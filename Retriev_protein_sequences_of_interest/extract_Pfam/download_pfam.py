#!/usr/bin/env python3

# standard library modules
import sys, json, ssl
from urllib import request
from urllib.error import HTTPError
from time import sleep

BASE_URL = "https://www.ebi.ac.uk/interpro/api/protein/UniProt/entry/pfam/PF00318/?page_size=200&extra_fields=sequence"

HEADER_SEPARATOR = "|"
LINE_LENGTH = 80

def output_list():
    # disable SSL verification to avoid config issues
    context = ssl._create_unverified_context()

    next_url = BASE_URL
    attempts = 0

    while next_url:
        try:
            req = request.Request(
                next_url,
                headers={
                    "Accept": "application/json",
                    "User-Agent": "PythonInterProClient/1.0",
                }
            )
            res = request.urlopen(req, context=context)

            if res.status == 408:
                sleep(61)
                continue
            elif res.status == 204:
                break

            payload = json.loads(res.read().decode())
            next_url = payload.get("next")
            attempts = 0

        except HTTPError as e:
            if e.code == 408:
                sleep(61)
                continue
            else:
                if attempts < 3:
                    attempts += 1
                    sleep(61)
                    continue
                else:
                    sys.stderr.write("LAST URL: " + next_url + "\n")
                    raise

        for item in payload.get("results", []):

            entries = item.get("entries")

            if entries:
                entries_header = "-".join(
                    entry["accession"] + "(" + ";".join(
                        ",".join(
                            f'{fragment["start"]}...{fragment["end"]}'
                            for fragment in locations["fragments"]
                        )
                        for locations in entry["entry_protein_locations"]
                    ) + ")"
                    for entry in entries
                )

                sys.stdout.write(
                    ">" + item["metadata"]["accession"]
                    + HEADER_SEPARATOR + entries_header
                    + HEADER_SEPARATOR + item["metadata"]["name"] + "\n"
                )
            else:
                sys.stdout.write(
                    ">" + item["metadata"]["accession"]
                    + HEADER_SEPARATOR + item["metadata"]["name"] + "\n"
                )

            seq = item.get("extra_fields", {}).get("sequence")
            if not seq:
                continue

            for i in range(0, len(seq), LINE_LENGTH):
                sys.stdout.write(seq[i:i + LINE_LENGTH] + "\n")

        # Don't overload the server
        if next_url:
            sleep(1)

if __name__ == "__main__":
    output_list()


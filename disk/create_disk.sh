#!/usr/bin/env bash

DISK="basic_programmas_voor_het_hele_gezin.d81"
PROGRAM_DIR="../programmas"

c1541 -format "imported by,vache" d81 "$DISK"

c1541 -attach "$DISK"

for file in "$PROGRAM_DIR"/*.bas; do
    name="$(basename "${file%.bas}")"
    clean_name="${name//_/ }"
    prg="$PROGRAM_DIR/${name}.prg"
    petcat -w2 -o "$prg" < "$file"
    c1541 -attach "$DISK" -write "$prg" "$clean_name"
done

rm "$PROGRAM_DIR"/*.prg

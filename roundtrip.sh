#!/bin/bash
#
# Perform round-trip test of SQUEEE/UNSQUEEZE
#
# Example of use: ./roundtrip.sh README.md
#
# What it does:
# - Clean build of both SQUEEZE and UNSQUEEZE
# - Copy provided file to test file-name
# - SQUEEZE test file
# - UNSQUEEZE squeezed test file
# - compare unsqueezed file to original: they should be identical
err() { echo 1>&2 "$*"; }
die() { err "ERROR: $*"; exit 1; }
run() { "$@" || die "command failed with rc=$?: $*"; }

PROGRAM="$(basename "$0")"
[[ -n "$PROGRAM" ]] || die "error determining program name"

file="$1"
[[ -n "$file" ]] || die "bad arguments; usage: $PROGRAM TEST-FILE"
[[ -e "$file" ]] || die "file not found: $file"
[[ -f "$file" ]] || die "file not regular: $file"
[[ -s "$file" ]] || die "file empty: $file"

work="./testwork"
origfile="roundtrp.orig"
testfile="roundtrp.tst"
testsq="roundtrp.ts.SQ"

run make -f makesq clean
run make -f makesq
run make -f makeusq clean
run make -f makeusq

run cp "$file" "$work/$origfile"
run cd "$work"
run cp "$origfile" "$testfile"
run ../sq "$testfile"
run ../usq "$testsq"
run cmp "$origfile" "$testfile"

err
err "SUCCESS: Round-trip test passed."

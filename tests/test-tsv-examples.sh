#!/usr/bin/env bash
set -o errexit

red=`tput setaf 1`
reset=`tput sgr0`
die() { set +v; echo "$red$*$reset" 1>&2 ; exit 1; }

for SCHEMA in antibodies contributors sample metadata; do
  for EXAMPLE in examples/tsv-examples/$SCHEMA/*; do
    echo "Testing $EXAMPLE ..."
    CMD="src/validate_tsv.py --path $EXAMPLE/$SCHEMA.tsv --schema $SCHEMA --output as_md"
    echo "Running: $CMD"
    README="$EXAMPLE/README.md"
    diff $README <( eval "$CMD" ) \
      || die "Update example: $CMD > $README"
  done
done

for GOOD in examples/tsv-examples/*/good-*/README.md; do
  grep 'No errors!' $GOOD > /dev/null || die "$GOOD should not be an error report."
done

for BAD in examples/tsv-examples/*/bad-*/README.md; do
  ! grep 'No errors!' $BAD || die "$BAD should be an error report."
done

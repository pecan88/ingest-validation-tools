```
Metadata TSV Errors:
  examples/dataset-examples/bad-mixed/upload/codex-metadata.tsv (as codex):
    Internal:
    - On row 2, column "donor_id", value "-INVALID-" fails because constraint "pattern"
      is "[A-Z]+[0-9]+"
    External:
      row 2, data examples/dataset-examples/bad-mixed/upload/bad-shared-dataset:
        Not allowed:
        - not-good-for-either-type.txt
        Required but missing:
        - .+\.pdf
        - drv_[^/]+/channelNames\.txt
        - drv_[^/]+/processed_[^/]+/.*
        - src_[^/]+/channelnames\.txt
        - src_[^/]+/channelnames_report\.csv
        - src_[^/]+/cyc.*_reg.*_.*/.*_.*_Z.*_CH.*\.tif
        - src_[^/]+/experiment\.json
        - src_[^/]+/exposure_times\.txt
        - src_[^/]+/segmentation\.(json|txt)
      row 2, contributors examples/dataset-examples/bad-mixed/upload/contributors.tsv: File
        has no data rows.
      row 2, antibodies examples/dataset-examples/bad-mixed/upload/antibodies.tsv: File
        does not exist
  examples/dataset-examples/bad-mixed/upload/scatacseq-metadata.tsv (as scatacseq):
    Internal:
    - On row 2, column "donor_id", value "-INVALID-" fails because constraint "pattern"
      is "[A-Z]+[0-9]+"
    - On row 2, column "sc_isolation_protocols_io_doi", value "" fails because constraint
      "required" is "True"
    - On row 2, column "library_construction_protocols_io_doi", value "" fails because
      constraint "required" is "True"
    External:
      row 2, data examples/dataset-examples/bad-mixed/upload/bad-shared-dataset:
        Not allowed:
        - not-good-for-either-type.txt
        Required but missing:
        - '[^/]+\.fastq\.gz'
      row 2, contributors examples/dataset-examples/bad-mixed/upload/contributors.tsv: File
        has no data rows.
Reference Errors:
  Multiple References:
    bad-shared-dataset:
    - examples/dataset-examples/bad-mixed/upload/codex-metadata.tsv (row 2)
    - examples/dataset-examples/bad-mixed/upload/scatacseq-metadata.tsv (row 2)
Hint: 'If validation fails because of extra whitespace in the TSV, try:

  src/cleanup_whitespace.py --tsv_in original.tsv --tsv_out clean.tsv'
```

---
title: Cell DIVE
schema_name: celldive
category: Imaging assays
all_versions_deprecated: False
layout: default
---

Related files:

- [📝 Excel template](https://raw.githubusercontent.com/hubmapconsortium/ingest-validation-tools/main/docs/celldive/celldive-metadata.xlsx): For metadata entry.
- [📝 TSV template](https://raw.githubusercontent.com/hubmapconsortium/ingest-validation-tools/main/docs/celldive/celldive-metadata.tsv): Alternative for metadata entry.

CellDIVE uploads require metadata on the antibodies used in the assay to be provided in an Antibodies TSV. For CellDIVE, the `channel_id` is represented as a cycle#/channel# combination (of the form `Cycle[0-9]_CH[0-9]`) linked to a given image file in the directory.
The other fields function the same way for all assays using antibodies. For more information, see the [Antibodies TSV documentation](../antibodies).

## Directory schema

| pattern | required? | description |
| --- | --- | --- |
| `channel_list\.txt` | ✓ | Information about the capture channels and tags (comma separated) |
| `slide_list\.txt` | ✓ | Information about the slides used by the experiment- each line corresponds to a slide name (begins with S - e.g. S20030077) - used in filenames |
| `HuBMAP_OME/region_[^/]+/S[^/]+\.ome\.tif` | ✓ | OME TIFF Files for the corresponding region (e.g. region_001) by slide (e.g S20030077) |
| `HuBMAP_rounds/round_info_S[^/]*\.dat` | ✓ | metadata file for the capture by slide (e.g S20030077) item-value tab separated format |
| `HuBMAP_Seg_and_quant/gray_scale_T_cells/region[^/]*/mask_T_cells_slideS[^/]+\.tif` | ✓ | grayscale T-cell masks |
| `HuBMAP_Seg_and_quant/quantification/region[^/]*/quant_slideS[^/]+\.csv` | ✓ | Comma separated quantification files |
| `HuBMAP_Seg_and_quant/rgb_T_cells/region[^/]*/mask_T_cells_slideS[^/]+\.tif` | ✓ | rgb T-cell masks |
| `HuBMAP_Seg_and_quant/segmentation/region[^/]*/dapi_slide_slideS[^/]+\.tif` | ✓ | segmentation (dapi slides) |
| `vHE/S[^/]+\.ome\.tif` | ✓ | vHE slides |
| `HuBMAP_OME/move_images.bat` |  | moves files |
| `HuBMAP_Seg_and_quant/*/move_images.bat` |  | moves files |
| `HuBMAP_OME/make_folders.bat` |  | creates directories |
| `HuBMAP_Seg_and_quant/*/make_folders.bat` |  | creates directories |
| `extras/.*` |  | Free-form descriptive information supplied by the TMC |
| `extras/thumbnail\.(png\|jpg)` |  | Optional thumbnail image which may be shown in search interface |

## Metadata schema


<details markdown="1" open="true"><summary><b>Version 1 (current)</b></summary>

<blockquote markdown="1">

<details markdown="1"><summary>Shared by all types</summary>

[`version`](#version)<br>
[`description`](#description)<br>
[`donor_id`](#donor_id)<br>
[`tissue_id`](#tissue_id)<br>
[`execution_datetime`](#execution_datetime)<br>
[`protocols_io_doi`](#protocols_io_doi)<br>
[`operator`](#operator)<br>
[`operator_email`](#operator_email)<br>
[`pi`](#pi)<br>
[`pi_email`](#pi_email)<br>
[`assay_category`](#assay_category)<br>
[`assay_type`](#assay_type)<br>
[`analyte_class`](#analyte_class)<br>
[`is_targeted`](#is_targeted)<br>

</details>
<details markdown="1"><summary>Unique to this type</summary>

[`acquisition_instrument_vendor`](#acquisition_instrument_vendor)<br>
[`acquisition_instrument_model`](#acquisition_instrument_model)<br>
[`number_of_antibodies`](#number_of_antibodies)<br>
[`number_of_channels`](#number_of_channels)<br>
[`number_of_cycles`](#number_of_cycles)<br>
[`number_of_imaging_rounds`](#number_of_imaging_rounds)<br>
[`resolution_x_value`](#resolution_x_value)<br>
[`resolution_x_unit`](#resolution_x_unit)<br>
[`resolution_y_value`](#resolution_y_value)<br>
[`resolution_y_unit`](#resolution_y_unit)<br>
[`processing_protocols_io_doi`](#processing_protocols_io_doi)<br>
[`overall_protocols_io_doi`](#overall_protocols_io_doi)<br>
[`antibodies_path`](#antibodies_path)<br>
[`contributors_path`](#contributors_path)<br>
[`data_path`](#data_path)<br>
</details>

</blockquote>

### Shared by all types

<a name="version"></a>
##### [`version`](#version)
Version of the schema to use when validating this metadata.

| constraint | value |
| --- | --- |
| enum | `1` |
| required | `True` |

<a name="description"></a>
##### [`description`](#description)
Free-text description of this assay.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="donor_id"></a>
##### [`donor_id`](#donor_id)
HuBMAP Display ID of the donor of the assayed tissue. Example: `ABC123`.

| constraint | value |
| --- | --- |
| pattern (regular expression) | `[A-Z]+[0-9]+` |
| required | `True` |

<a name="tissue_id"></a>
##### [`tissue_id`](#tissue_id)
HuBMAP Display ID of the assayed tissue. Example: `ABC123-BL-1-2-3_456`.

| constraint | value |
| --- | --- |
| pattern (regular expression) | `([A-Z]+[0-9]+)-[A-Z]{2}\d*(-\d+)+(_\d+)?` |
| required | `True` |

<a name="execution_datetime"></a>
##### [`execution_datetime`](#execution_datetime)
Start date and time of assay, typically a date-time stamped folder generated by the acquisition instrument. YYYY-MM-DD hh:mm, where YYYY is the year, MM is the month with leading 0s, and DD is the day with leading 0s, hh is the hour with leading zeros, mm are the minutes with leading zeros.

| constraint | value |
| --- | --- |
| type | `datetime` |
| format | `%Y-%m-%d %H:%M` |
| required | `True` |

<a name="protocols_io_doi"></a>
##### [`protocols_io_doi`](#protocols_io_doi)
DOI for protocols.io referring to the protocol for this assay.

| constraint | value |
| --- | --- |
| required | `True` |
| pattern (regular expression) | `10\.17504/.*` |
| url | prefix: `https://dx.doi.org/` |

<a name="operator"></a>
##### [`operator`](#operator)
Name of the person responsible for executing the assay.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="operator_email"></a>
##### [`operator_email`](#operator_email)
Email address for the operator.

| constraint | value |
| --- | --- |
| format | `email` |
| required | `True` |

<a name="pi"></a>
##### [`pi`](#pi)
Name of the principal investigator responsible for the data.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="pi_email"></a>
##### [`pi_email`](#pi_email)
Email address for the principal investigator.

| constraint | value |
| --- | --- |
| format | `email` |
| required | `True` |

<a name="assay_category"></a>
##### [`assay_category`](#assay_category)
Each assay is placed into one of the following 3 general categories: generation of images of microscopic entities, identification & quantitation of molecules by mass spectrometry, and determination of nucleotide sequence.

| constraint | value |
| --- | --- |
| enum | `imaging` |
| required | `True` |

<a name="assay_type"></a>
##### [`assay_type`](#assay_type)
The specific type of assay being executed.

| constraint | value |
| --- | --- |
| enum | `Cell DIVE` |
| required | `True` |

<a name="analyte_class"></a>
##### [`analyte_class`](#analyte_class)
Analytes are the target molecules being measured with the assay.

| constraint | value |
| --- | --- |
| enum | `protein` |
| required | `True` |

<a name="is_targeted"></a>
##### [`is_targeted`](#is_targeted)
Specifies whether or not a specific molecule(s) is/are targeted for detection/measurement by the assay.

| constraint | value |
| --- | --- |
| type | `boolean` |
| required | `True` |

### Unique to this type

<a name="acquisition_instrument_vendor"></a>
##### [`acquisition_instrument_vendor`](#acquisition_instrument_vendor)
An acquisition instrument is the device that contains the signal detection hardware and signal processing software. Assays generate signals such as light of various intensities or color or signals representing the molecular mass.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="acquisition_instrument_model"></a>
##### [`acquisition_instrument_model`](#acquisition_instrument_model)
Manufacturers of an acquisition instrument may offer various versions (models) of that instrument with different features or sensitivities. Differences in features or sensitivities may be relevant to processing or interpretation of the data.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="number_of_antibodies"></a>
##### [`number_of_antibodies`](#number_of_antibodies)
Number of antibodies.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="number_of_channels"></a>
##### [`number_of_channels`](#number_of_channels)
Number of fluorescent channels imaged during each cycle.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="number_of_cycles"></a>
##### [`number_of_cycles`](#number_of_cycles)
Number of cycles of 1. oligo application, 2. fluor application, 3. dye inactivation.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="number_of_imaging_rounds"></a>
##### [`number_of_imaging_rounds`](#number_of_imaging_rounds)
the total number of acquisitions performed on microscope to collect autofluorescence/background or stained signal.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="resolution_x_value"></a>
##### [`resolution_x_value`](#resolution_x_value)
The width of a pixel.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |

<a name="resolution_x_unit"></a>
##### [`resolution_x_unit`](#resolution_x_unit)
The unit of measurement of the width of a pixel. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| enum | `nm` or `um` |
| required | `False` |
| units for | `resolution_x_value` |

<a name="resolution_y_value"></a>
##### [`resolution_y_value`](#resolution_y_value)
The height of a pixel.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |

<a name="resolution_y_unit"></a>
##### [`resolution_y_unit`](#resolution_y_unit)
The unit of measurement of the height of a pixel. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| enum | `nm` or `um` |
| required | `False` |
| units for | `resolution_y_value` |

<a name="processing_protocols_io_doi"></a>
##### [`processing_protocols_io_doi`](#processing_protocols_io_doi)
DOI for analysis protocols.io for this assay. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| required | `False` |
| pattern (regular expression) | `10\.17504/.*` |
| url | prefix: `https://dx.doi.org/` |

<a name="overall_protocols_io_doi"></a>
##### [`overall_protocols_io_doi`](#overall_protocols_io_doi)
DOI for protocols.io for the overall process.

| constraint | value |
| --- | --- |
| required | `True` |
| pattern (regular expression) | `10\.17504/.*` |
| url | prefix: `https://dx.doi.org/` |

<a name="antibodies_path"></a>
##### [`antibodies_path`](#antibodies_path)
Relative path to file with antibody information for this dataset.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="contributors_path"></a>
##### [`contributors_path`](#contributors_path)
Relative path to file with ORCID IDs for contributors for this dataset.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="data_path"></a>
##### [`data_path`](#data_path)
Relative path to file or directory with instrument data. Downstream processing will depend on filename extension conventions.

| constraint | value |
| --- | --- |
| required | `True` |

</details>


<details markdown="1" ><summary><b>Version 0</b></summary>


### Shared by all types

<a name="donor_id"></a>
##### [`donor_id`](#donor_id)
HuBMAP Display ID of the donor of the assayed tissue. Example: `ABC123`.

| constraint | value |
| --- | --- |
| pattern (regular expression) | `[A-Z]+[0-9]+` |
| required | `True` |

<a name="tissue_id"></a>
##### [`tissue_id`](#tissue_id)
HuBMAP Display ID of the assayed tissue. Example: `ABC123-BL-1-2-3_456`.

| constraint | value |
| --- | --- |
| pattern (regular expression) | `([A-Z]+[0-9]+)-[A-Z]{2}\d*(-\d+)+(_\d+)?` |
| required | `True` |

<a name="execution_datetime"></a>
##### [`execution_datetime`](#execution_datetime)
Start date and time of assay, typically a date-time stamped folder generated by the acquisition instrument. YYYY-MM-DD hh:mm, where YYYY is the year, MM is the month with leading 0s, and DD is the day with leading 0s, hh is the hour with leading zeros, mm are the minutes with leading zeros.

| constraint | value |
| --- | --- |
| type | `datetime` |
| format | `%Y-%m-%d %H:%M` |
| required | `True` |

<a name="protocols_io_doi"></a>
##### [`protocols_io_doi`](#protocols_io_doi)
DOI for protocols.io referring to the protocol for this assay.

| constraint | value |
| --- | --- |
| required | `True` |
| pattern (regular expression) | `10\.17504/.*` |
| url | prefix: `https://dx.doi.org/` |

<a name="operator"></a>
##### [`operator`](#operator)
Name of the person responsible for executing the assay.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="operator_email"></a>
##### [`operator_email`](#operator_email)
Email address for the operator.

| constraint | value |
| --- | --- |
| format | `email` |
| required | `True` |

<a name="pi"></a>
##### [`pi`](#pi)
Name of the principal investigator responsible for the data.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="pi_email"></a>
##### [`pi_email`](#pi_email)
Email address for the principal investigator.

| constraint | value |
| --- | --- |
| format | `email` |
| required | `True` |

<a name="assay_category"></a>
##### [`assay_category`](#assay_category)
Each assay is placed into one of the following 3 general categories: generation of images of microscopic entities, identification & quantitation of molecules by mass spectrometry, and determination of nucleotide sequence.

| constraint | value |
| --- | --- |
| enum | `imaging` |
| required | `True` |

<a name="assay_type"></a>
##### [`assay_type`](#assay_type)
The specific type of assay being executed.

| constraint | value |
| --- | --- |
| enum | `Cell DIVE` |
| required | `True` |

<a name="analyte_class"></a>
##### [`analyte_class`](#analyte_class)
Analytes are the target molecules being measured with the assay.

| constraint | value |
| --- | --- |
| enum | `protein` |
| required | `True` |

<a name="is_targeted"></a>
##### [`is_targeted`](#is_targeted)
Specifies whether or not a specific molecule(s) is/are targeted for detection/measurement by the assay.

| constraint | value |
| --- | --- |
| type | `boolean` |
| required | `True` |

### Unique to this type

<a name="acquisition_instrument_vendor"></a>
##### [`acquisition_instrument_vendor`](#acquisition_instrument_vendor)
An acquisition instrument is the device that contains the signal detection hardware and signal processing software. Assays generate signals such as light of various intensities or color or signals representing the molecular mass.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="acquisition_instrument_model"></a>
##### [`acquisition_instrument_model`](#acquisition_instrument_model)
Manufacturers of an acquisition instrument may offer various versions (models) of that instrument with different features or sensitivities. Differences in features or sensitivities may be relevant to processing or interpretation of the data.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="number_of_antibodies"></a>
##### [`number_of_antibodies`](#number_of_antibodies)
Number of antibodies.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="number_of_channels"></a>
##### [`number_of_channels`](#number_of_channels)
Number of fluorescent channels imaged during each cycle.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="number_of_cycles"></a>
##### [`number_of_cycles`](#number_of_cycles)
Number of cycles of 1. oligo application, 2. fluor application, 3. dye inactivation.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="number_of_imaging_rounds"></a>
##### [`number_of_imaging_rounds`](#number_of_imaging_rounds)
the total number of acquisitions performed on microscope to collect autofluorescence/background or stained signal.

| constraint | value |
| --- | --- |
| type | `integer` |
| required | `True` |

<a name="resolution_x_value"></a>
##### [`resolution_x_value`](#resolution_x_value)
The width of a pixel.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |

<a name="resolution_x_unit"></a>
##### [`resolution_x_unit`](#resolution_x_unit)
The unit of measurement of the width of a pixel. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| enum | `nm` or `um` |
| required | `False` |
| units for | `resolution_x_value` |

<a name="resolution_y_value"></a>
##### [`resolution_y_value`](#resolution_y_value)
The height of a pixel.

| constraint | value |
| --- | --- |
| type | `number` |
| required | `True` |

<a name="resolution_y_unit"></a>
##### [`resolution_y_unit`](#resolution_y_unit)
The unit of measurement of the height of a pixel. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| enum | `nm` or `um` |
| required | `False` |
| units for | `resolution_y_value` |

<a name="processing_protocols_io_doi"></a>
##### [`processing_protocols_io_doi`](#processing_protocols_io_doi)
DOI for analysis protocols.io for this assay. Leave blank if not applicable.

| constraint | value |
| --- | --- |
| required | `False` |
| pattern (regular expression) | `10\.17504/.*` |
| url | prefix: `https://dx.doi.org/` |

<a name="overall_protocols_io_doi"></a>
##### [`overall_protocols_io_doi`](#overall_protocols_io_doi)
DOI for protocols.io for the overall process.

| constraint | value |
| --- | --- |
| required | `True` |
| pattern (regular expression) | `10\.17504/.*` |
| url | prefix: `https://dx.doi.org/` |

<a name="antibodies_path"></a>
##### [`antibodies_path`](#antibodies_path)
Relative path to file with antibody information for this dataset.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="contributors_path"></a>
##### [`contributors_path`](#contributors_path)
Relative path to file with ORCID IDs for contributors for this dataset.

| constraint | value |
| --- | --- |
| required | `True` |

<a name="data_path"></a>
##### [`data_path`](#data_path)
Relative path to file or directory with instrument data. Downstream processing will depend on filename extension conventions.

| constraint | value |
| --- | --- |
| required | `True` |

</details>

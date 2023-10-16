# Example of AWS S3 access to DAAC buckets in MAAP DPS

This repository stores code for an example MAAP DPS algorithm that test AWS S3 DAAC buckets by reading tiff or hdf5 files stored in these buckets. Access in this module relies on retrieving temporary credentials from the `maap-data-reader` role which was created for multi-DAAC access, and pass these credentials to the filesystem python client `fs` (which relies on `s3fs` for AWS S3).

## Structure

- `src.py` contains the python module in itself.
- `requirements.txt` lists the required python dependencies. 
- `run.sh` is the bash script that runs `src.py` and is an entrypoint required for a DPS algorithm, but can be ignored for local usage.

## Requirements

- python >=3.10
- `requirements.txt`
- authenticated to an AWS account and user with permissions to assume the `maap-data-reader` role. 

## Local usage

### Installation

From the root of this repository :

```
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Usage

Here are a few examples of usage of the module, each example using a different DAAC bucket. From the root of the repository after the installation step : 

```
# NSIDC DAAC Access
python src.py s3://nsidc-cumulus-prod-protected/ATLAS/ATL08/006/2023/06/21/ATL08_20230621235543_00272011_006_01.h5

# ORNL DAAC Access
python src.py s3://ornl-cumulus-prod-protected/gedi/GEDI_L4B_Gridded_Biomass/data/GEDI04_B_MW019MW138_02_002_05_R01000M_PS.tif

# GES DISC Access
python src.py s3://gesdisc-cumulus-prod-protected/Landslide/Global_Landslide_Nowcast.1.1/2020/Global_Landslide_Nowcast_v1.1_20201231.tif

# LP DAAC Access
python src.py s3://lp-prod-protected/HLSL30.020/HLS.L30.T56JMN.2023225T234225.v2.0/HLS.L30.T56JMN.2023225T234225.v2.0.B11.tif
 ```

 ## Usage in a DPS job. 

The algorithm is registered as `daac-access-example`. It is based on the [following MAAP workspace container image](mas.maap-project.org/root/maap-workspaces/base_images/vanilla:v3.1.1), which already fulfills the above two requirements (AWS auth and python). You can run the algorithm from the MAAP ADE job UI `Submit` tab with the s3 path of your choice. You will not get any output from the job, but it prints messages notifying about data access success to stdout : so after the DPS job finishes and succeeds, you can look at your `dps_output` folder in the ADE and open the `stdout` file of the corresponding job to look at what happened. 

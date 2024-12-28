# Kestra-Spatial
 Custom Kestra build to include popular spatial libraries

## Build
To build the image:
- Clone or download a copy of the repository
- Unzip the file if you downloaded a zip file
- Open a terminal and change directory to where you have the Dockerfile
- Run the following command to build the image:
`docker compose up -d`

## Run the image
To run the image in a new container, run the following command:   
`docker run --rm -it -p 8080:8080 --user=root -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp kestra-python:latest server local`
- Log in via http://localhost:8080

## Run Python flows locally
By default, Kestra will seek to outsource the execution of Python flows to a Docker container using Kestrapy. The new container will be pulled from a pre-existing image, and will not include the custom libraries, so it is necessary to avoid this. 

To run Python flows locally, you need to run the flows using the following inclusion, which replaces `runner: PROCESS`.
```
    taskRunner:
      type: io.kestra.plugin.core.runner.Process
```

## Demonstration flow
The repository includes a demonstration flow which uses pandas to create a dataframe and then print the head of the df. The flow is located in the `flows` directory.

## Included libraries
The image includes the following libraries which cover a range of topics from spatial services connections, dataframes, vectorisation, rasterisation, database connections, and machine learning / image feature inference. The number of libraries makes this image unsuitable for serverless deployments, but is useful in the context of a generalised scheduler/orchestrator:
- requests
- pandas
- geopandas
- polars
- rasterio
- fiona
- shapely
- xarray
- netcdf4
- dask
- esridump
- geojson
- pyproj
- owslib
- sqlalchemy
- geoalchemy2
- h3
- matplotlib
- osmnx
- spatialpandas
- ultralytics
- boto3
- gdal

## Security
Is not enabled by default in the image as the open source version of Kestra does not support security. To enable security, you need to use the enterprise version of Kestra.
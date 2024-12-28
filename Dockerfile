FROM kestra/kestra:latest

USER root
RUN apt-get update -y && apt-get install pip -y

RUN apt install libpq5 -y
RUN apt install libpq-dev -y
RUN apt install libgdal-dev -y
RUN apt install gdal-bin -y

RUN pip install --no-cache-dir requests pandas geopandas polars rasterio fiona shapely xarray netcdf4 dask esridump geojson pyproj owslib sqlalchemy geoalchemy2 h3 matplotlib osmnx spatialpandas ultralytics boto3
RUN pip install --no-cache-dir gdal
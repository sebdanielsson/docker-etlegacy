# Environment variables
IMAGE_VERSION='2.8' # Container version
ETL_DL_URL='https://www.etlegacy.com/download/file/396' # etlegacy-v2.80.1-x86_64.tar.gz

# Download
curl $ETL_DL_URL | tar xvz

# Build
docker build -t sebdanielsson/etlegacy:$IMAGE_VERSION .
docker build -t sebdanielsson/etlegacy:latest .

# Push
docker push sebdanielsson/etlegacy:$IMAGE_VERSION
docker push sebdanielsson/etlegacy:latest

# Clean
rm -Rf etlegacy-v

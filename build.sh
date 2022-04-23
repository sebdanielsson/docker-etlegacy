# Environment variables
IMAGE_VERSION='2.8' # Container version
ETL_DL_URL='https://www.etlegacy.com/download/file/396' # etlegacy-v2.80.1-x86_64.tar.gz

# Download
echo "Downloading $ETL_DL_URL"
curl $ETL_DL_URL | tar xz

# Build
echo "Starting build process"
docker build -t sebdanielsson/etlegacy:$IMAGE_VERSION .
docker build -t sebdanielsson/etlegacy:latest .

# Push
echo "Start push to Docker Hub"
docker push sebdanielsson/etlegacy:$IMAGE_VERSION
docker push sebdanielsson/etlegacy:latest

# Clean
echo "Cleaning up downloaded files"
rm -Rf etlegacy-v*

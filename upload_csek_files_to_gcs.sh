##################################################
##
## Upload images to GCS using
## Customer Supplied Encrption keys 
##
##################################################

# source the previously set env variables
source ./config.sh

# prompt user to login
gcloud auth login ${USER_EMAIL}

echo "Set default project"
gcloud config set project ${PROJECT_ID}

echo "uploading images using customer supplied key" 

CSEK_KEY=$(cat Base64EncryptionKey.txt)

gsutil -o "GSUtil:encryption_key=${CSEK_KEY}" \
-m \
cp ./google-cloud-icons/*.png \
gs://${PROJECT_ID}-csek-objects-bucket

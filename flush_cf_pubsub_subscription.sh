##################################################
##
## Flush the Pub/Sub topic that the 
## cloud function publishes to
##
##################################################

# source the previously set env variables
source ./config.sh

# prompt user to login
gcloud auth login ${USER_EMAIL}

echo "Set default project"
gcloud config set project ${PROJECT_ID}

echo "Flushing messages" 
gcloud pubsub subscriptions seek \
${PS_SUBSCRIPTION_NAME} \
--project ${PROJECT_ID} \
--time=$(date +%Y-%m-%dT%H:%M:%S)
##################################################
##
## Pull Messages from Pub/Sub 
##
##################################################

# source the previously set env variables
source ./config.sh

# prompt user to login
gcloud auth login ${USER_EMAIL}

echo "Set default project"
gcloud config set project ${PROJECT_ID}

echo "Pulling one message" 
gcloud pubsub subscriptions pull ${PS_SUBSCRIPTION_NAME} --auto-ack

echo "Pulling 10 messages" 
gcloud pubsub subscriptions pull ${PS_SUBSCRIPTION_NAME} --limit=10 --auto-ack
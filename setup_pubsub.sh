##################################################
##
## Create Pub/Sub Topic and Subscription for demo
##
##################################################

# source the previously set env variables
source ./config.sh

# prompt user to login
gcloud auth login ${USER_EMAIL}

echo "Set default project"
gcloud config set project ${PROJECT_ID}

echo "Creating Pub/Sub Topic" 

gcloud pubsub topics create ${PS_TOPIC_NAME}

echo "Creating Pub/Sub Topic Subscription" 

gcloud pubsub subscriptions create ${PS_SUBSCRIPTION_NAME} \
--topic=${PS_TOPIC_NAME}

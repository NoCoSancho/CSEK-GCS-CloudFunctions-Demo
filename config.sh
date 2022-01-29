##################################################
##
## Set these Variables
##
##################################################

# existing GCP user that will:
# create the project
# attach a billing id (needs to have permission)
# and provision resources
export USER_EMAIL=<insert gcp user email>

# project id for your NEW GCP project
export PROJECT_ID=<insert project id>

# the new project will need to be tied to a billing account
export BILLING_ACCOUNT_ID=<insert billing account>

# desired GCP region for networking and compute resources
export REGION=<insert gcp region>

# desired GCP zone for networking and compute resources
export ZONE=<insert gcp zone>

# desired GCP VPC name
export VPC_NAME=<insert vpc name>

# desired GCP subnet name
export SUBNET_NAME=<insert subnet name>

# desired GCE Instance Name
export VM_INSTANCE_NAME=<insert instance name>

# desired pub/sub topic name
export PS_TOPIC_NAME=<insert topic name>

# desired pub/sub topic subscription name
export PS_SUBSCRIPTION_NAME=<insert subscription name>

##################################################
#Example
##################################################
# export USER_EMAIL=myuser@mydomain.com
# export PROJECT_ID=csek-gcs-demo-project-01
# export BILLING_ACCOUNT_ID=123456-123456-123456
# export REGION=us-central1
# export ZONE=us-central1-a
# export VPC_NAME=demo-vpc
# export SUBNET_NAME=demo-subnet-1
# export VM_INSTANCE_NAME=csek-jobs-vm-01
# export PS_TOPIC_NAME=csek-gcs-bucket-topic
# export PS_SUBSCRIPTION_NAME=csek-gcs-bucket-subscription
##################################################

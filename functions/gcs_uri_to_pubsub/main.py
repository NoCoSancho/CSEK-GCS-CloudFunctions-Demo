import re
import os
import json
from google.cloud import pubsub_v1

FUNCTIONS_TOPIC = os.getenv("TOPIC_NAME")
PROJECT_ID = os.getenv("PROJECT_ID")

# Instantiates a Pub/Sub client
publisher = pubsub_v1.PublisherClient()

def main_func(event, context):

    bucket_name = event['bucket']
    file_name = event['name']
    content_type = event['contentType']

    gcs_input_uri = f"gs://{event['bucket']}/{event['name']}"
    eventid = context.event_id
    extract_timestamp = context.timestamp
    gcs_blob_location = context.resource['name']

    #Print File Information to log

    print(f'input uri: {gcs_input_uri}')

    #build message payload

    pubsub_message = {"topic": FUNCTIONS_TOPIC, "message": gcs_input_uri }

    #publish message
    response = publish(pubsub_message)

    #assert response == "Message published."


# Publishes a message to a Cloud Pub/Sub topic.
def publish(request):
    request_json = request

    topic_name = request_json.get("topic")
    message = request_json.get("message")

    if not topic_name or not message:
        return ('Missing "topic" and/or "message" parameter.', 400)

    print(f'Publishing message to topic {topic_name}')

    # References an existing topic
    topic_path = publisher.topic_path(PROJECT_ID, topic_name)

    message_json = json.dumps({
        'data': {'message': message},
    })
    message_bytes = message_json.encode('utf-8')

    # Publishes a message
    try:
        publish_future = publisher.publish(topic_path, data=message_bytes)
        publish_future.result()  # Verify the publish succeeded
        return 'Message published.'
    except Exception as e:
        print(e)
        return (e, 500)

# [END functions_pubsub_publish]
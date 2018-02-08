# Example 3: maintains state.


import watson_developer_cloud

# Set up Conversation service.
conversation = watson_developer_cloud.ConversationV1(
  username = '85351a35-301c-420c-8006-c87b60c5dab8', # replace with username from service key
  password = '8j5H3Xxc5ept', # replace with password from service key
  version = '2017-05-26'
)
workspace_id = '5aeaf839-1fc0-4b69-97c6-8bd473752aea' # replace with workspace ID


# Initialize with empty value to start the conversation.
user_input = ''
context = {}

# Main input/output loop
while True:

  # Send message to Conversation service.
  response = conversation.message(
    workspace_id = workspace_id,
    input = {
      'text': user_input
    },
    context = context
  )

  # If an intent was detected, print it to the console.
  if response['intents']:
    print('Detected intent: #' + response['intents'][0]['intent'])

  # Print the output from dialog, if any.
  if response['output']['text']:
    print(response['output']['text'][0])

  # Update the stored context with the latest received from the dialog.
  context = response['context']

  # Prompt for next round of input.
  user_input = input('>> ')
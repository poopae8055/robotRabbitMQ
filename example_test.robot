*** Setting ***
Library    RabbitMq
Library    json
Variables    testdata/body_msg.yaml
Variables    testdata/common.yaml

*** Keywords ***
Connect To RabbitMq
    Create Rabbitmq Connection    ${rabbitmq_host}  ${http_port}  ${amqp_port}  ${username}  ${password}  alias=${alias}  vhost=${rb_vhost}

Publish message to queue
    ${json_string}    Json.Dumps    ${message_body}
    Publish Message	   exchange_name=${exchange_name}	routing_key=${routing_key}	payload=${json_string}

Assert the result
   log  assert the result

*** Test Cases ***
Example test case
    Given Connect To RabbitMq
    When Publish message to queue
    Then Assert the result
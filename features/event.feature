Feature: API

  Scenario: List events in JSON
    When I send and accept JSON
    And I send a GET request to "/eventos"
    Then the response status should be "200"
    And the JSON response should be:
      """
      [{"id":1,
        "name":"MyEvent",
        "description":"MyDescription",
        "local":"MyLocal",
        "participants_limit":10,
        "url":"http://example.org/eventos/1.json"}]
      """    
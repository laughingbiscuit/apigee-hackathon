Feature: Validate the Apigee Hackathon

  @Ch6
  Scenario: Successfully get a mock vehicles response
    When I GET /mock/v1/vehicles
    Then response code should be 200
    And response body path $.vehicles should be of type array
  
  @Ch6
  Scenario: Successfully get a mock vehicle response
    When I GET /mock/v1/vehicles/123
    Then response code should be 200
    And response body path $.id should be 123
  
  @Ch6
  Scenario: Successfully get a mock status response
    When I GET /mock/v1/status
    Then response code should be 200
    And response body path $.success should be true

  @Ch6
  Scenario: Successfully get a mock not found response
    When I GET /mock/v1/vehicles/321
    Then response code should be 404
  
  @Ch8
  Scenario: Successfully get a ping response
    When I GET /fleet/v1/ping
    Then response code should be 200

  @Ch8
  Scenario: Successfully get a status response
    When I GET /fleet/v1/status
    Then response code should be 200

  @Ch11
  Scenario: Successfully get an access token
    Given I have basic authentication credentials `clientId` and `clientSecret`
    And I set form parameters to
    | parameter   | value               |
    | grant_type  | client_credentials  |
  When I POST to /identity/v1/token
  Then response code should be 200
  And  I store the value of body path $.access_token as access token

  @Ch11
  Scenario: Fail to get an access token
    Given I have basic authentication credentials invalid and invalid
    And I set form parameters to
    | parameter   | value               |
    | grant_type  | client_credentials  |
    When I POST to /identity/v1/token
    Then response code should be 401

  @Ch12
  Scenario: Successfully access a protected resource
    Given I set bearer token
    When I GET /fleet/v1/vehicles/123
    Then response code should be 200
    And response body path $.id should be 123


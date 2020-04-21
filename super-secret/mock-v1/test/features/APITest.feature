Feature:
  As an API Developer
  I want to get mock data
  So that I can independently build an API

  Scenario: Get List of Vehicles
    When I GET /mock/v1/vehicles
    Then response code should be 200
    Then response body path $.vehicles should be of type array
  
  Scenario: Get Valid Vehicle
    When I GET /mock/v1/vehicles/123
    Then response code should be 200
    Then response body path $.id should be 123
    Then response body path $.licenseplate should be ZH-ABCD
  
  Scenario: Get Missing Vehicle
    When I GET /mock/v1/vehicles/321
    Then response code should be 404
    Then response body path $.error should be Vehicle not found

Feature: Registration of the api client
  To view or submit an order

Background:
  * url baseUrl
  * def requestBody = read('requests/authRequest.json')

  Scenario: Authentication and verify the token
    Given path '/api-clients/'
    And request requestBody
    When method POST
    Then status 201
    #Verify that the token is returned
   And match response.accessToken == '#present'
    #Create a file for the token
    And def accessToken = response.accessToken
    And karate.write(accessToken, 'access-token.txt')


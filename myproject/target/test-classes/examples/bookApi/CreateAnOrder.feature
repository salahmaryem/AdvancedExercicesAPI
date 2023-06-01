Feature: Create an order with Authorization

  Background:
    * url baseUrl
    * configure headers = { Authorization: 'Bearer ' + accessToken }

    Scenario: create order
      Given path '/orders'
      When method POST
      Then status 201

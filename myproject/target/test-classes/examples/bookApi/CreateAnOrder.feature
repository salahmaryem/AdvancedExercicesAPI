Feature: Create an order with Authorization

  Background:
    * url baseUrl
    * def requestBody = read('requests/createRequest.json')
    * def requestBody1 = read('requests/invalidCreatingRequest.json')
    * def config = karate.callSingle('classpath:karate-config.js')

    Scenario: Creating an order with valid existing BookId
      Given header Authorization = 'Bearer '+ config.accessToken
      And path '/orders'
      And request requestBody
      When method POST
      Then status 201

    Scenario: Creating an order with out of stock BookId
      #First, Get all books to see the out of stock BookId
      Given path '/books'
      When method GET
      Then status 200
      #Then, create a request with the false infos
      Given header Authorization = 'Bearer '+ config.accessToken
      And path '/orders'
      And request requestBody
         #Set the request to an invalid bookId
      And set requestBody.bookId = 7
      When method POST
      Then status 400
      And response.error == 'Invalid or missing bookId.'

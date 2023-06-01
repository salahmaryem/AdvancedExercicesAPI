Feature: Checking if getting a book by it's type returns the desired book

  Background:
    * url baseUrl

  Scenario: Get Book Details by Type (Fiction)
    Given path '/books'
    And param type = 'fiction'
    When method GET
    Then status 200
    * def bookType = $response[*].type
    * print 'Books type:', bookType
    * print response.length

  # Verify that all the book types in the response are equal to 'fiction'
    * def expectedType = 'fiction'
    * def unmatchedBooks = karate.filter(response, function(book) { return book.type != expectedType })
    * match unmatchedBooks == '#[]'


  Scenario: Get Book Details by Type (non-Fiction)
    Given path '/books'
    And param type = 'non-fiction'
    When method GET
    Then status 200
    * def bookType = $response[*].type
    * print 'Books type:', bookType
    * print response.length

  # Verify that all the book types in the response are equal to 'non-fiction'
    * def expectedType = 'non-fiction'
    * def unmatchedBooks = karate.filter(response, function(book) { return book.type != expectedType })
    * match unmatchedBooks == '#[]'


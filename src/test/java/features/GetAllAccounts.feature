@Regression
Feature: Testing Account APIs

  Background: Setting up test
    Given url BASE_URL
    * def generateTokenResult = callonce read('GenerateSupervisorToken.feature')
    Then print generateTokenResult
    * def validToken = "Bearer " + generateTokenResult.response.token
    Given path "/api/accounts/get-all-accounts"

  @All_Accounts_1
  Scenario: Negative Testing /api/accounts/get-all-accounts without authentication
    When method get
    Then status 401

  @All_Accounts_2
  Scenario: Positive Testing /api/accounts/get-all-accounts with authentication
    Given header Authorization = validToken
    When method get
    Then status 200
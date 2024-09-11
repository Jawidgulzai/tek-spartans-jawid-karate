@Regression
Feature: Testing Account APIs

  Background: Setting up test
    Given url BASE_URL
    * def generateTokenResult = callonce read('GenerateSupervisorToken.feature')
    Then print generateTokenResult
    * def validToken = "Bearer " + generateTokenResult.response.token
    Given path "/api/accounts/get-all-accounts"

  @All_Account_1
  Scenario: Testing /api/accounts/get-all-accounts
    When method get
    Then status 401


  @All_Account_2
  Scenario: Testing /api/accounts/get-all-accounts
    Given header Authorization = validToken
    When method get
    Then status 200
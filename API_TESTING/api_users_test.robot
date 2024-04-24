*** Settings ***
Resource    ../API_TESTING/resources/api_test_users.resource


*** Variables ***



*** Test Cases ***


Test01: Register new user on ServeRest

    Create new user
    # Register new user created on ServerRest
    # Confirm user registration
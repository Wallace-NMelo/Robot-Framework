*** Settings ***
Library    RequestsLibrary
Library    String

*** Keywords ***
Create new user
    ${palavra_aleatória}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatória}    Convert To Lower Case    string=${palavra_aleatória}
    # Log    "Minha palavra aleatória: ${palavra_aleatória}@emailtest.com"
    Set Test Variable    ${EMAIL_TEST}    ${palavra_aleatória}@emailtest.com
    Log    message="Test Email Criado: ${EMAIL_TEST}"

*** Settings ***
Documentation     Teste de geração de e-mail customizado
Library            String
Library            Faker

*** Test Cases ***
Criar e-mail customizado
    ${nome}        Set Variable    John
    ${sobrenome}   Set Variable    Doe
    ${email}       Gere Email Customizado    ${nome}    ${sobrenome}
    Log To Console  ${email}

*** Keywords ***
Gere Email Customizado
    [Arguments]    ${nome}    ${sobrenome}
    ${palavra_aleatoria}    Generate Random String    8    [LETTERS]
    ${email}    Set Variable    ${nome}${sobrenome}${palavra_aleatoria}@testerobot.com
    RETURN   ${email}

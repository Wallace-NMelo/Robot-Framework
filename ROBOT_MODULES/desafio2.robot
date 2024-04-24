*** Variables ***
@{numeros}    1    2    3    4    5    6    7    8    9    10

*** Test Cases ***
Teste de Impressão
    FOR    ${numero}    IN    @{numeros}
        ${is_5_or_10}    Set Variable If    ${numero} == 5 or ${numero} == 10    True    False
        Run Keyword If    ${is_5_or_10}    Log    Eu sou o número ${numero}!
        ...    ELSE    Log    Eu não sou o número 5 e nem o 10!
    END

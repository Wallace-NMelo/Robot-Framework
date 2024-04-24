*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${AMAZON_URL}                   https://www.amazon.com.br/
${MENU_ELETRONICO_XPATH}        (//a[contains(.,'Eletrônicos')])[1]
${MENU_ELETRONICO_HEADER}       //h1[contains(.,'Eletrônicos e Tecnologia')]
${AMAZON_LOGO_XPATH}            //*[@id="nav-logo-sprites"]
${PLAYSTATION_}                 ${EMPTY}


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    [Arguments]    ${maximizar}=False
    Go To    url=${AMAZON_URL}
    IF    '${maximizar}'=='True'    Maximize Browser Window
    Wait Until Element Is Visible    locator=${AMAZON_LOGO_XPATH}

Acessar o Carrinho de Compras
    Click Element    locator=nav-cart-count
    Wait Until Page Contains    text=Carrinho de compras

Entrar no menu "Eletrônicos"
    Wait Until Element Is Visible    locator=${MENU_ELETRONICO_XPATH}
    Click Element    locator=${MENU_ELETRONICO_XPATH}

Verificar conteúdo do menu "Eletrônicos"
    Wait Until Page Contains    text="Eletrônicos e Tecnologia"
    Wait Until Element Is Visible    locator=${MENU_ELETRONICO_HEADER}
    Set Browser Implicit Wait    value=5

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no Botão de pesquisa
    Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,"${PRODUTO}")])[3]

Adicionar o produto "${PRODUTO}" no carrinho
    ${element_locator}=    Set Variable    (//span[contains(.,"${PRODUTO}")])[3]
    Wait Until Element Is Visible    locator=${element_locator}
    Click Element    locator=${element_locator}
    Wait Until Page Contains    text=${PRODUTO}
    Click Button    locator=add-to-cart-button
    Wait Until Page Contains    text=Adicionado ao carrinho

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Acessar o Carrinho de Compras
    ${element_locator}=    Set Variable    //span[@class='a-truncate-cut'][contains(.,"${PRODUTO}")]
    Wait Until Element Is Visible    locator=${element_locator}

Remover o produto "${PRODUTO}" do carrinho
    Acessar o Carrinho de Compras 
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    ${remove_product_locator}=    Set Variable    //input[contains(@aria-label,'Excluir ${PRODUTO}')]
    Click Element    locator=${remove_product_locator}

Verificar se o carrinho fica vazio
    Acessar o Carrinho de Compras
    Wait Until Page Contains    text=Seu carrinho da Amazon está vazio

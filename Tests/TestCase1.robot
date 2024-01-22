*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${home_page}        http://www.google.com
${browser}         Chrome
${email_address}   robotframeworktest2024@gmail.com
${email_password}  robotframeworktest2024
${login_button}    //*[@id="gb"]/div/div[2]/a/span
${email_slot}      //*[@id="identifierId"]
${forward_email}   //*[@id="identifierNext"]/div/button/span
${password_slot}   //*[@id="password"]/div[1]/div/div[1]/input
${forward_password}   //*[@id="passwordNext"]/div/button/span

*** Keywords ***
Open the Browser
    Open Browser    ${home_page}    ${browser}

Search Topic
    [Arguments]     ${topic}
    Open the Browser
    Input Text    name=q    ${topic}
    Press Keys    name=q    ENTER

Login Steps
    Open the Browser
    Wait Until Element Is Visible    xpath=${login_button}
    Click Element    xpath=${login_button}
    Wait Until Element Is Visible    xpath=${email_slot}
    Input Text    xpath=${email_slot}    ${email_address}
    Click Element    xpath=${forward_email}
    Wait Until Element Is Visible    ${password_slot}
    Input Password    xpath=${password_slot}    ${email_password}
    Set Browser Implicit Wait    5

*** Test Cases ***
Open Google Homepage
    Open the Browser
    Set Browser Implicit Wait    5
    Close Browser
    Log    Test Completed

Search on Google
    Search Topic    Automation
    Set Browser Implicit Wait    5
    Close Browser
    Log    Test Completed

Login Test
    Login Steps
    Close Browser
    Log    Test Completed

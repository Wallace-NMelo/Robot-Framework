*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${url}        https://www.techlistic.com/p/selenium-practice-form.html
${browser}         Chrome
${firstnameslot}    //*[@id="post-body-3077692503353518311"]/div[1]/div/div/h2[2]/div[1]/div/div[2]/input
${lastnameslot}    //*[@id="post-body-3077692503353518311"]/div[1]/div/div/h2[2]/div[1]/div/div[5]/input
${dateslot}        //*[@id="datepicker"]


*** Keywords ***
Open url on Browser
    Open Browser    ${url}    ${browser}


*** Test Cases ***
Open Form Test
    Open url on Browser
    Set Browser Implicit Wait    5
    Close Browser
    Log    Test Completed

Fill Form
    Open url on Browser


    # Input Texts
    Input Text    xpath=${firstnameslot}   Robot
    Input Text    name=${lastnameslot}    Framework


    # Radio Buttons
    Select Radio Button    group_name=sex    value=Female
    Select Radio Button    group_name=exp     value=5

    Select Radio Button    group_name=profession    value=Automation Tester
    Select Radio Button    group_name=tool    value=Selenium Webdriver
    
    Scroll Element Into View    id=datepicker

    Close Browser

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://github.com
${BROWSER}    chrome
${EMAIL}      leopatrick4142@gmail.com
${PASSWORD}   Liondark@2000
${TIMEOUT}    10s

*** Test Cases ***
Valid Login
    Open GitHub
    Login To GitHub    ${EMAIL}    ${PASSWORD}
    Verify Login Success
    Close Browser

*** Keywords ***
Open GitHub
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIMEOUT}
    Click Element    link:Sign in

Login To GitHub
    [Arguments]    ${EMAIL}    ${PASSWORD}
    Wait Until Element Is Visible    id:login_field    10s
    Input Text    id:login_field    ${EMAIL}
    Input Password    id:password    ${PASSWORD}
    Click Button    name:commit

Verify Login Success
    Wait Until Page Does Not Contain Element
    ...    id:login_field
    ...    10s

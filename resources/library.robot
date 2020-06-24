*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/library.robot


Documentation    resouces file is defining keywords
Library    ../testData/readindexing.py
Library    ../externalKeywords/locators.py

*** Variables ***
${Browser}    Chrome
${URL}    http://hou-t-qasrv-01.csisoftwareusa.com:12121/OLS60_Site3/login.aspx

*** Keywords ***

User_Open_Application
    [Documentation]    This keyword is for opening application
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    sleep    4
    input text    xpath://input[@id='ctl00_pageContentHolder_loginControl_UserName']    ritug
    input text    xpath://input[@id='ctl00_pageContentHolder_loginControl_Password']    ritu4
    sleep    4
    click button    xpath://input[@value='Login']
    Sleep    4

openCamp
    [Documentation]    opens Camp module
    User_Open_Application
    sleep    5
    click Element    xpath://div[@title='Camp']
    page should contain element    xpath://input[@value='Camp']    Camp

read_element_locator
    [Arguments]    ${jsonpath}
    ${result}=    read_locator_from_json  ${jsonpath}
    [Return]    ${result}

read_numberofRows
    [Arguments]  ${sheetname}
    ${maxRows}=    fetch_numberofrows  ${sheetname}
    [Return]    ${maxRows}

read_cellData
    [Arguments]  ${sheetname}    ${rows}    ${cell}
    ${cellData}=    fetch_cellData  ${sheetname}    ${rows}    ${cell}
    [Return]    ${cellData}

# *** Test Cases ***
#TC_1
 #   ${var1}=    fetch_numberofrows    ValidLogin
  #  log to console    ${var1}
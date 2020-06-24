*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${URL}    http://hou-t-qasrv-01.csisoftwareusa.com:12121/OLS60_Site3/Login.aspx
${URL1}    https://www.thetestingworld.com/testings/

*** Keywords ***
email
input text    id:email    abc@xyz.com

*** Test Cases ***
TC_001 - Opening and Closing Browser
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    input text    xpath://input[@id='ctl00_pageContentHolder_loginControl_UserName']    ritug
    input text    xpath://input[@id='ctl00_pageContentHolder_loginControl_Password']    ritu4
    sleep    4
    click button    xpath://input[@value='Login']
    Sleep    4
    Close Browser
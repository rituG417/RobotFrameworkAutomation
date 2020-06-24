*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/library.robot

*** Variables ***
${Browser}    Chrome
${URL}    http://hou-t-qasrv-01.csisoftwareusa.com:12121/OLS60_Site3/Login.aspx

*** Test Cases ***
Login
    open browser    ${URL}    ${Browser}
    maximize browser window
    sleep    4
    ${row}=    read_numberofRows    ValidLogin
    #Log to Console  ${row}
    #{row}+1- to go till last column as in slicing we give +1 value
         FOR    ${i}    IN RANGE    1    ${row}+1
    \    ${username}=  read_cellData  ValidLogin  ${i}    1
    \    ${password}=  read_cellData  ValidLogin  ${i}    2
    \    input text    xpath://input[@id='ctl00_pageContentHolder_loginControl_UserName']    ${username}
    \    input text    xpath://input[@id='ctl00_pageContentHolder_loginControl_Password']    ${password}
    \    click button    xpath://input[@value='Login']
    \    sleep    8
    \    click element    xpath://a[@class='cssSignout']
    \    sleep    8
    \    click element    xpath://a[@class='cssSignout']
#    \    clear element text    xpath://input[@id='ctl00_pageContentHolder_loginControl_UserName']
 #   \    clear element text    xpath://input[@id='ctl00_pageContentHolder_loginControl_Password']
    close browser
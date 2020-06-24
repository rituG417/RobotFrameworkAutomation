*** Settings ***
Library    SeleniumLibrary
Library    Collections
Default Tags    dflt

*** Variables ***
${Browser}    Chrome
${URL}    https://facebook.com
${URL1}    https://www.thetestingworld.com/testings/

*** Keywords ***
email
    input text    id:email    abc@xyz.com

*** Test Cases ***
TC_001 - Opening and Closing Browser
    [Tags]    Sanity
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    Close Browser

TC_002 - input text
    [Tags]
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    input text    id:email    abc@xyz.com
    clear element text    id:email
    input text    id:email    abc3@xyz.com
    input text    id:pass    test123
    select radio button    sex    1
    sleep  5
    close browser

TC_003 - radio button
    [Tags]    Smoke
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    select radio button    sex    -1
    sleep  5
    close browser

TC_004 - check box
    [Tags]    Smoke    Sanity
    Open Browser    ${URL1}  ${Browser}
    Maximize Browser Window
    Sleep    4
    select checkbox  xpath://div[@class='btn']//input[@required]
    sleep  5
    close browser

TC_005 - select link
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    click link  xpath://a[text()='Create a Page']
    sleep  5
    close browser

TC_006 - click button
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    click button  xpath://input[@value='Log In']
    sleep  5
    close browser

 TC_007 - click dropdown
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    Select From List By Index    id:day    5
    Select From List By Value    id:month    4
    Select From List By Label    id:year    2018
    sleep  5
    close browser

TC_008 - writing keyword
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    email
    sleep  5
    close browser

TC_009 - variable setting
    ${x}=    set variable    ritug
    log to console    ${x}

TC_10 - list
    @{list1}    create list    ritu    11    8.9    D$8
    ${listlength}=    get length    ${list1}
    log to console    ${listlength}
    ${var}=    getfromlist    ${list1}    2
    log to console    ${var}

TC_11 - forLoop
    @{list1}    create list    ritu    11    8.9    D$8
    #: FOR    ${var1}    IN RANGE    1    20
    #\  log to console    ${var1}
    : FOR    ${i}    IN    ${list1}
    \    log to console    ${i}

TC_12-pageShouldContainAssertion
     Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    Page Should Contain    Create an account
    close browser

TC_13-pageShouldNotContainAssertion
     Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    Page Should Not Contain    Ritu
    close browser

TC_14-pageShouldContainTextFieldAssertion
     Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    Page Should Contain TextField    id:email
    close browser

TC_15-pageShouldContainElement
     Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Sleep    4
    Page Should Contain Element    xpath://i[@class='fb_logo img sp_6M5yDv-EUGW sx_5d302e']    facebook
    close browser
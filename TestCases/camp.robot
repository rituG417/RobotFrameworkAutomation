*** Settings ***
Library    SeleniumLibrary
resource    ../resources/library.robot

Documentation    Camp module books camp for all type of users
Library    SeleniumLibrary
Resource    ../resources/library.robot
Library    SeleniumLibrary
Resource    ../resources/library.robot


*** Test Cases ***
TC_001_openCamp
    [Documentation]    opens Camp module
    User_Open_Application
    sleep    15
    ${camptile}=    read_element_locator    Camp.camp_tile_xpath
    click Element    xpath:${camptile}
    sleep    15
    ${campverification}=    read_element_locator    Camp.camp_page_verification_xpath
    page should contain element    xpath:${campverification}    Camp
    close browser

TC_002_selectCategory
    [tags]    Regression
    [Documentation]    selecting category
    openCamp
    sleep    5
    click Element    xpath://input[@id='ctl00_pageContentHolder_dlCampCategory_ctl02_campCategoryCtrl_btnSelectCategory']
    page should contain element    xpath://input[@value='Camp']    Camp
    sleep    5
    close browser

TC_003_selectCamp
    [tags]    Regression    Functional
    [Documentation]    camp selection
    openCamp
    sleep    5
    selectCategory
    sleep    4
    click Element    xpath://input[@id='ctl00_welcomeCnt_btnBredCurm']
    page should contain element    xpath://input[@value='Camp']    Camp
    sleep    5
    close browser

TC_004_selectCampBySearch
    [tags]    Regression
    [Documentation]    selecting camp by advance search
    openCamp
    sleep    5
    Click Element    xpath://input[@id='btnAdvanceSearch']
    sleep    4
    Select From List By Index    xpath://a[@rel='campSitesdropmenu']    1
    sleep    2
    Select From List By Index    xpath://a[@rel='campCatdropmenu']    1
    sleep    2
    Select From List By Index    xpath://a[@rel='campSessiondropmenu']    1
    click Element    xpath://input[@id='btnViewSearchResults']
    sleep    5
    close browser


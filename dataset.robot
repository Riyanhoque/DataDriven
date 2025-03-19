*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Setup        open the browser with the Mortagage payment url
Test Teardown        Close Browser
# Resource        resource.robot
Test Template    Validate UnSuccesful Login 


*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Page}                       css:.nav-link
${Url}        https://rahulshettyacademy.com/loginpagePractise/



*** Test Cases ***      username                  password
Invalid email           djaiierht                 learning
Invalid password        rahulshettyacademy        12344jfa
Invalid Syntext         £2%?                      learning



*** Keywords ***    

Validate UnSuccesful Login  
    [Arguments]        ${username}        ${password}
    open the browser with the Mortagage payment url       
    Fill the Loging form    ${username}    ${password}
    wait until Element is located in the page        ${Error_Message_Login}
    verify error message is correct 

# Validate Cards display in the shopping page
#     Fill the Loging form    ${User_Valid_id}    ${User_valid_pass}
#     wait until Element is located in the page    ${Page}


open the browser with the Mortagage payment url 
    Create Webdriver    Chrome
    Go To    ${Url}
    Maximize Browser Window
    
Fill the Loging form
    [Arguments]       ${userId}       ${password}   
    Input Text        id:username    ${userId}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until Element is located in the page
    [Arguments]        ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct    
   Element Text Should Be        ${Error_Message_Login}        Incorrect username/password.
*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Setup        open the browser with the Mortagage payment url
Test Teardown        Close Browser
Resource        resource.robot
Test Template    Validate UnSuccesful Login 
Library        DataDriver 


*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Page}                       css:.nav-link




*** Test Cases ***      username                  password
Invalid email           djaiierht                 learning
Invalid password        rahulshettyacademy        12344jfa
Invalid Syntext         £2%?                      learning
valid Login element        ${User_Valid_id}        ${User_valid_pass}


*** Keywords ***    

Validate UnSuccesful Login  
    [Arguments]        ${username}        ${password}
    open the browser with the Mortagage payment url       
    Fill the Loging form    ${username}    ${password}
    wait until Element is located in the page        ${Error_Message_Login}
    verify error message is correct 

Validate Cards display in the shopping page
    Fill the Loging form    ${User_Valid_id}    ${User_valid_pass}
    wait until Element is located in the page    ${Page}


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
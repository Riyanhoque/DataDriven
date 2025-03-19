*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables 

Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${Url}        https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortagage payment url
    Create Webdriver    Chrome
    Go To    ${Url}
    Maximize Browser Window


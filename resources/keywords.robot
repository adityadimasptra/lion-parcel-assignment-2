*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${LOGIN_URL}      https://www.saucedemo.com
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${PRODUCT_1}      backpack
${PRODUCT_2}      bike_light
${FIRST_NAME}     John
${LAST_NAME}      Doe
${POSTAL_CODE}    12345

*** Keywords ***
The user is on the Sauce Demo login page
    Open Browser    ${LOGIN_URL}    chrome
    Go To    ${LOGIN_URL}
    Title Should Be    Swag Labs

The user logs in with valid credentials
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button

The user adds items to the cart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Link    xpath=//*[@data-test='shopping-cart-link']
    Page Should Contain    text=Sauce Labs Backpack
    Page Should Contain    text=Sauce Labs Bike Light

    Click Button    id=checkout
    Page Should Contain    text=Checkout: Your Information
    
    Input Text    id=first-name    ${FIRST_NAME}
    Input Text    id=last-name    ${LAST_NAME}
    Input Text    id=postal-code    ${POSTAL_CODE}
    Click Button    id=continue
    Page Should Contain    text=Checkout: Overview
    Page Should Contain    text=Sauce Labs Backpack
    Page Should Contain    text=Sauce Labs Bike Light

The user completes the checkout process
    Click Button    id=finish

The user should see the checkout confirmation page
    Page Should Contain    Checkout: Complete!

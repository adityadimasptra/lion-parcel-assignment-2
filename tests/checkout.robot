*** Settings ***
Resource        ../resources/keywords.robot

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

*** Test Cases ***
User Checks Out Successfully
    Given The user is on the Sauce Demo login page
    When The user logs in with valid credentials
    And The user adds items to the cart
    And The user completes the checkout process
    Then The user should see the checkout confirmation page
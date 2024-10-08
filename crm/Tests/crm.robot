*** Settings ***
Documentation    This is some basic information about the whole suite
Library          SeleniumLibrary

*** Variables ***


*** Test Cases ***
Should be able to add new customer
    [Documentation]         This is some basic info about the test case
    [Tags]                  1006    Smoke   Contacts
    # initialize Selenium
    Set selenium speed      .2s
    set selenium timeout    10s
    # open the browser
    log                     Starting the test case
    open browser            https://automationplayground.com/crm/   firefox
    #resize browser window for recording
    #Set window position     x=341   y=169
    #Set window size         width=1935  height=1090
    page should contain     Customers Are Priority One
    click link              Sign In
    page should contain     Login
    input text              id=email-id     admin@robotframeworktutorial.com
    input text              id=password     qwe
    click button            Submit
    page should contain     Our Happy Customers
    click link              id=new-customer
    page should contain     Add Customer
    input text              id=EmailAddress     john.doe@gmail.com
    input text              id=FirstName        John
    input text              id=LastName         Doe
    input text              id=City             Dallas
    select from list by value       id=StateOrRegion        TX
    select radio button     gender      female
    select checkbox         name=promos-name
    click button            Submit
    wait until page contains    Success! New customer added.
    sleep                   4s
    close browser

*** Keywords ***

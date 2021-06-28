*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  DateTime

Resource  keywords.robot
Resource  variables.robot

Suite Setup  Run Keywords
...          Open url
...          Should show login container
Suite Teardown  Run Keywords
...             Click button logout
...             Should show notification message with "logout success"
...             Click close notifications             
...             Close Browser

*** Test Cases ***
Scenario: Login the system
    Input username in login page with "super_parking_all"
    Input password in login page with "password"
    Click button login
    Should show notification message with "Login successfully"
    Click close notifications

Scenario: Add visitor
    Click button bento menu
    Click button visitor management
    Click button Add Visitor
    Fill in First Name with "Test"
    Fill in Last Name with "Coming"
    Fill in Email with "test@coming.com"
    Fill in Phone with "012345678"
    Fill in Company with "AAA"
    Click button Add 
    Should show notification message with "Visitor successfully added."
    Click close notifications
    Show visitor info in "Name:" should be "Test Coming"
    Show visitor info in "Company:" should be "AAA"
    Show visitor info in "Email:" should be "test@coming.com"
    Show visitor info in "Phone:" should be "012345678"

Scenario: Add Appointment
    Click button bento menu
    Click button visitor management
    Click kebab icon on info
    Click Add Appointment
    Fill in Visiting Person with "Sutfah"
    Input date today
    Select checkbox request building
    Select checkbox request parking
    Select checkbox request wifi
    Fill in Allowed Time with "3"
    Fill in Allowed Device with "2"
    Click Add Appointment
    Should show notification message with "Appointment successfully added."
    Click close notifications
    Click button Tab Info with "Visiting Info"
    Show information in list with "${css_TimeNow}" status is "-"

Scenario: Check in / out appointment
    Click kebab icon on appointment list
    Click manage appointment 
    Click Button Check in
    Click Button Save Facility
    Should show notification message with "Request and Checked in successfully."
    Click close notifications
    Reload Page
    Click button Tab Info with "Visiting Info"
    Show information in list with "${css_TimeNow}" status is "Checked in"
    Click kebab icon on appointment list
    Click manage appointment 
    Click Button Check out
    Click Confirm check out 
    Should show notification message with "Visitor successfully checked out."
    Click close notifications
    Show information in list with "${css_TimeNow}" status is "Checked out"

Scenario: Delete visitor 
    Click kebab icon on info
    Click delete visitor
    Click confirm delete
    Should show notification message with "Visitor successfully deleted."
    Click close notifications
    
    
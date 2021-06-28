*** Settings ***
Library  SeleniumLibrary
Library  Collections 
Library  DateTime
Resource  variables.robot


*** Keywords ***

Should show login container
    Element Should Be Visible  ${css_loginContainer}

Should show title name with "${titletext}"
    Title Should Be  ${titletext}

Open url
    Open Browser  ${url}  chrome  options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window

Input username in login page with "${username}"
    Wait Until Element Is Visible  ${css_usernameFieldLogin}
    Input Text  ${css_usernameFieldLogin}  ${username}
    Textfield Value Should Be  ${css_usernameFieldLogin}  ${expectUsername}

Input password in login page with "${password}"
    Wait Until Element Is Visible  ${css_passwordFieldLogin}
    Input Text  ${css_passwordFieldLogin}  ${password}
    Textfield Value Should Be  ${css_passwordFieldLogin}  ${expectPassword} 

Click button login
    Wait Until Element Is Visible  ${css_buttonLogin}
    Click Button  ${css_buttonLogin}  

Should show notification message with "${massage}"
    Wait Until Element Is Visible  ${css_notificationAlert} 
    ${notification} =  Get Text  ${css_notificationAlert} 
    Should Be Equal  ${notification}  ${massage}

Click close notifications
    Wait Until Element Is Visible  ${css_closeNotification}
    Click Element  ${css_closeNotification}

Click button bento menu
    Wait Until Element Is Visible  ${css_bentomenu}
    Click Element  ${css_bentomenu}
    Element Should Be Visible  ${css_menuList}

Click button visitor management
    Wait Until Element Is Visible  ${css_visitorManage}
    Click Element  ${css_visitorManage}
    Wait Until Element Is Visible  ${css_sidebar}
    Element Text Should Be  ${css_sidebar}  ${css_expectSidebar}

Click button Add Visitor
    Wait Until Element Is Visible  ${css_addVisitorButton}
    Click Element  ${css_addVisitorButton} 
    Wait Until Element Is Visible  ${css_Title}
    Element Text Should Be  ${css_Title}  ${css_expectAddVisitorTitle}

Fill in First Name with "${GuestFirstname}"
    Wait Until Element Is Visible  ${css_guestFirstnameField}
    Input Text  ${css_guestFirstnameField}  ${GuestFirstname}
    Textfield Value Should Be  ${css_guestFirstnameField}  ${GuestFirstname}

Fill in Last Name with "${GuestLastname}"
    Wait Until Element Is Visible  ${css_guestLastnameField}
    Input Text  ${css_guestLastnameField}  ${GuestLastname}
    Textfield Value Should Be  ${css_guestLastnameField}  ${GuestLastname}

Fill in Email with "${GuestEmail}"
    Wait Until Element Is Visible  ${css_guestEmailField}
    Input Text  ${css_guestEmailField}  ${GuestEmail}
    Textfield Value Should Be  ${css_guestEmailField}  ${GuestEmail}

Fill in Phone with "${GuestPhone}"
    Wait Until Element Is Visible  ${css_guestPhoneField}
    Input Text  ${css_guestPhoneField}  ${GuestPhone}
    Textfield Value Should Be  ${css_guestPhoneField}  ${GuestPhone}

Fill in Company with "${GuestCompany}"
    Wait Until Element Is Visible  ${css_guestCompanyField}
    Input Text  ${css_guestCompanyField}  ${GuestCompany}
    Textfield Value Should Be  ${css_guestCompanyField}  ${GuestCompany}

Click button Add 
    Wait Until Element Is Visible  ${css_addGuest} 
    Click Button  ${css_addGuest} 

Show visitor info in "${typeProfile}" should be "${detialUser}"
    Wait Until Element Is Visible  ${css_type}
    ${profileItem} =  Get Element Count  ${css_type}
    
    FOR  ${i}  IN RANGE  ${profileItem}
        ${profileItemText} =  Get Text  (${css_type})\[${i}+1]
        ${type} =  Set Variable  ${profileItemText}
        
        IF  '${type}' == '${typeProfile}'
            ${DetailProfile} =  Get Text  (${css_DetailProfile} )\[${i}+1]  
            ${detail} =  Set Variable  ${DetailProfile}
            Should Be Equal  ${type}${detail}  ${typeProfile}${detialUser}  
            END 
    END

Click kebab icon on info
    Wait Until Element Is Visible  ${css_kebabIconOnInfo}
    Click Element  ${css_kebabIconOnInfo}
    Element Should Be Visible  ${css_optionListOnInfo}
    
Click Add Appointment
    Wait Until Element Is Visible  ${css_addAppointmentButton} 
    Click Element  ${css_addAppointmentButton} 
    Wait Until Element Is Visible  ${css_Title}
    Element Text Should Be  ${css_Title}  ${css_expectAppointmentTitle}

Fill in Visiting Person with "${NameVisitingPerson}"
    Wait Until Element Is Visible  ${css_visitingPersonField}
    Input Text  ${css_visitingPersonField}  ${NameVisitingPerson}
    Textfield Value Should Be  ${css_visitingPersonField}  ${NameVisitingPerson}

Input date today
    Wait Until Element Is Visible  ${css_startDateInput}
    Click Element  ${css_startDateInput}   
    Wait Until Element Is Visible  ${css_buttonNow} 
    Click Element  ${css_buttonNow}    
    ${date}   Get Current Date   result_format=%d/%m/%Y %H:%M  
    Textfield Value Should Be   ${css_startDateInput}  ${date}  

Select checkbox request building
    Wait Until Element Is Visible  ${css_checkboxRequestBuilding}
    Select Checkbox  ${css_checkboxRequestBuilding}
    Checkbox Should Be Selected  ${css_checkboxRequestBuilding}

Select checkbox request parking
    Wait Until Element Is Visible  ${css_checkboxRequestParking}
    Select Checkbox  ${css_checkboxRequestParking}
    Checkbox Should Be Selected  ${css_checkboxRequestParking}
    
Select checkbox request wifi
    Wait Until Element Is Visible  ${css_checkboxRequestWifi}
    Select Checkbox  ${css_checkboxRequestWifi}
    Checkbox Should Be Selected  ${css_checkboxRequestWifi}

Fill in Allowed Time with "${TimeWifi}"
    Wait Until Element Is Visible  ${css_TimeWifiField}
    Press Keys  ${css_TimeWifiField}  CTRL+a+BACKSPACE
    Input Text  ${css_TimeWifiField}  ${TimeWifi}
    Textfield Value Should Be  ${css_TimeWifiField}  ${TimeWifi}

Fill in Allowed Device with "${DeviceNumber}"
    Wait Until Element Is Visible  ${css_DeviceNumber}
    Press Keys  ${css_DeviceNumber}  CTRL+a+BACKSPACE
    Input Text  ${css_DeviceNumber}  ${DeviceNumber}
    Textfield Value Should Be  ${css_DeviceNumber}  ${DeviceNumber}

Click button Tab Info with "${tabInfo}"
    Wait Until Element Is Visible  ${css_TabInfo} 
    ${Tab} =  Get Element Count  ${css_TabInfo}
    
    FOR  ${i}  IN RANGE  ${Tab}
        ${profileItemText} =  Get Text  (${css_TabInfo})\[${i}+1]
        ${type} =  Set Variable  ${profileItemText}
        
        IF  '${type}' == '${tabInfo}'
            Click Element  (${css_TabInfo})\[${i}+1]  
            END 
    END

Show information in list with "${dataWannaCheck}" status is "${statusWannaCheck}"
    Wait Until Element Is Visible  ${css_listContainer}
    ${listVisitor} =  Get Element Count  //*[@id="user-info-tabs"]/div/div[2]/div/div[3]/div/div[1]
    FOR  ${i}  IN RANGE  ${listVisitor}
        ${listVisitorText} =  Get Text  //*[@id="user-info-tabs"]/div/div[2]/div/div[3]/div[${i}+1]/div[1]
        ${detail} =  Set Variable  ${listVisitorText}
        IF  '${detail}' == '${dataWannaCheck}'
            ${listVisitorStatus} =  Get Text  //*[@id="user-info-tabs"]/div/div[2]/div/div[3]/div[${i}+1]/div[4]
            ${status} =  Set Variable  ${listVisitorStatus} 
            Should Be Equal  ${detail}   ${dataWannaCheck}
            Should Be Equal  ${status}   ${statusWannaCheck}

        END
    END


Click kebab icon on appointment list
    Wait Until Element Is Visible   ${css_KebabIcon}
    Click Element  ${css_KebabIcon}   
    Element Should Be Visible  ${css_listKebab}
Click manage appointment 
    Wait Until Element Is Visible   ${css_manage} 
    Click Element  ${css_manage}
    Wait Until Element Is Visible  ${css_Title}
    Element Text Should Be  ${css_Title}  ${css_expectManageTitle} 

Click Button Check in  
    Wait Until Element Is Visible   ${css_ButtonCheckIn}
    Click Element  ${css_ButtonCheckIn}

Click Button Save Facility
    Wait Until Element Is Visible    ${css_ButtonSaveFacility}
    Click Element  ${css_ButtonSaveFacility}
    
Click Button close content
    Wait Until Element Is Visible  ${css_closeContent}
    Click Element  ${css_closeContent}

Click Button Check out
    Wait Until Element Is Visible  ${css_ButtonCheckOut}
    Click Element    ${css_ButtonCheckOut}

Click Confirm check out 
    Wait Until Element Is Visible  ${css_TitleComfirm}
    Click Element    ${css_buttonComfirm} 
    Element Should Be Visible  ${css_titleDeleteVisitor}

Click delete visitor
    Wait Until Element Is Visible   ${css_deletevisitor} 
    Click Element  ${css_deletevisitor}


Click confirm delete
    Wait Until Element Is Visible  ${css_buttonDelete}  
    Click Element  ${css_buttonDelete}

Click button logout    
    Wait Until Element Is Visible  //*[@id="menu-container"]
    Click Element  //*[@id="menu-container"]/i[2]/div/span
    Click Element  (//*[@id="profile-menu-list"]//*[@id="logout-btn"]) 
    
    
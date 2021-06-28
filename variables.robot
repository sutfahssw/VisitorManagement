*** Variables ***

${url}  https://10.10.20.191:31608/#
${css_TimeNow}         28/06/2021, 18:02 - 28/06/2021, 19:02
#login page
${css_loginContainer}  id=login-inner-container
${css_usernameFieldLogin}  id=username-input
${css_passwordFieldLogin}  id=password-input
${expectUsername}  super_parking_all
${expectPassword}  password
${css_buttonLogin}  id=login-btn
#notification
${css_notificationAlert}  //*[@class="notifications-tc"]//*[@class="notification-message"]
${css_closeNotification}  //*[@id="mod-notification-1"]/div/div/div/div
#bento menu
${css_menuList}       id=app-menu-list
${css_bentomenu}      //*[@id="menu-container"]//*[@class="app-menu-icon"]
${css_visitorManage}  //*[@id="app-menu-list"]//*[@class="app-menu-item"]//*[@id="app-icon-guest-management"]
#visitorManagement
${css_sidebar}                  //*[@id="left-menu"]//*[@class="sidebar-title-container"]
${css_expectSidebar}            Visitor Management
${css_addVisitorButton}         id=add-guest-btn
${css_Title}          //*[@class="content-modal-title"]
${css_expectAddVisitorTitle}    Add Visitor
#VisitorInfo
${css_guestFirstnameField}  id=guest-user-firstname-input
${css_guestLastnameField}   id=guest-user-lastname-input
${css_guestEmailField}      id=guest-user-email-input
${css_guestPhoneField}      id=guest-user-phone-input
${css_guestCompanyField}    id=guest-user-company-input
${css_addGuest}             //*[@id="create-guest"]
#info
${css_type}                     //*[@id="user-collapse-profile"]//*[@class="profile-data"]//*[@class="profile-item"]//*[@class="text-gray profile-label"]
${css_DetailProfile}            //*[@id="user-collapse-profile"]//*[@class="profile-data"]//*[@class="profile-item"]//*[@class="text-black profile-detail"]
${css_kebabIconOnInfo}          //*[@id="toggle-option-dropdown-"]
${css_optionListOnInfo}         //*[@id="option-list"]
${css_addAppointmentButton}     //*[@id="add-appointment"] 
${css_expectAppointmentTitle}   Add Appointment
${css_visitingPersonField}      //*[@id="guest-user-person-input"]
#date
${css_startDateInput}           //*[@id="start-date-input"]
${css_calendarInput}            //*[@class="rc-calendar-input "]
${css_buttonNow}                //*[@class="rc-calendar-today-btn "]


#checkbox
${css_checkboxRequestBuilding}  //*[@id="input-checkbox-request-building-input"]
${css_checkboxRequestParking}   //*[@id="input-checkbox-request-parking-input"]
${css_checkboxRequestWifi}      //*[@id="input-checkbox-request-wifi-input"]
${css_TimeWifiField}            //*[@id="guest-user-wifi-hours-input"]
${css_DeviceNumber}             //*[@id="guest-user-device-num-input"]
#visiting info
${css_TabInfo}                  //*[@class="ant-tabs-nav ant-tabs-nav-animated"]//*[@class=" ant-tabs-tab"]
${css_listContainer}            //*[@id="user-info-tabs"]/div/div[2]/div/div[3]
${css_KebabIcon}                //*[@id="toggle-option-dropdown-0"]
${css_listKebab}                //*[@id="option-list"]
${css_manage}                   //*[@class="ant-menu-item"]
${css_expectManageTitle}        Appointment
${css_ButtonCheckIn}            //*[@id="checkin-appointment"]
${css_ButtonSaveFacility}       //*[@id="save-facility"]
${css_closeContent}             //*[@id="close-content-modal-btn"]
${css_ButtonCheckOut}           //*[@id="checkout-appointment"]
${css_TitleComfirm}            //*[@id="rcDialogTitle1"]
${css_textCheckOutConfirmation}    Check out Confirmation
${css_buttonComfirm}           //*[@class="custom-button primary"]
#delete
${css_deletevisitor}        //*[@id="remove-guest"]
${css_titleDeleteVisitor}   //*[@id="rcDialogTitle1"]
${css_TextDelete}            Delete Visitor
${css_buttonDelete}         //*[@id="confirm-delete-guest"]
*** Settings ***
Library     SeleniumLibrary
Resource    ../Resource.robot


*** Variables ***
${LOGIN_URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${LOGIN_BRANDING}          //div[@class='orangehrm-login-branding']
${LOGIN_HEADER}            //h5[@class='oxd-text oxd-text--h5 orangehrm-login-title']
${LOGIN_FIELD_USERNAME}    //input[@name='username']
${LOGIN_FIELD_PASSWORD}    //input[@type='password']
${LOGIN_BTN}               //button[@type='submit']
${LOGOUT_ALERT}            //p[@class='oxd-text oxd-text--p oxd-alert-content-text']
${LOGIN_TITLE}             Login
${LOGIN_USERNAME}          Admin
${LOGIN_PASSWORD}          admin123
${LOGIN_WRONG_USERNAME}    Admi
${LOGIN_WRONG_PASSWORD}    admi123
${LOGOUT_ALERT_MESSAGE}    Invalid credentials
       

*** Keywords ***
Acessar a página de Login
    Go to                             ${LOGIN_URL}
    Wait Until Element Is Visible     ${LOGIN_BRANDING}

Preencher os campos com credenciais validas
    Input Text    ${LOGIN_FIELD_USERNAME}    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_FIELD_PASSWORD}    ${LOGIN_PASSWORD}

Clicar no botao de login
    Click Element    ${LOGIN_BTN}  
    
Preencher os campos com credenciais invalidas
    Input Text    ${LOGIN_FIELD_USERNAME}    ${LOGIN_WRONG_USERNAME}
    Input Text    ${LOGIN_FIELD_PASSWORD}    ${LOGIN_WRONG_PASSWORD}

Conferir se o login não foi realizado
    Wait Until Element Is Visible     ${LOGOUT_ALERT} 
    Element Text Should Be            ${LOGOUT_ALERT}     ${LOGOUT_ALERT_MESSAGE}

Conferir se o logout foi realizado
    Wait Until Element Is Visible     ${LOGIN_HEADER}
    Element Text Should Be            ${LOGIN_HEADER}    ${LOGIN_TITLE}
    
Realizar o Login
    Run Keyword    Acessar a página de Login
    Run Keyword    Preencher os campos com credenciais validas
    Run Keyword    Clicar no botao de login
    Run Keyword    Conferir se o login foi realizado com sucesso
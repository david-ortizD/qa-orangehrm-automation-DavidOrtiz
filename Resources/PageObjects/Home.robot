*** Settings ***
Library     SeleniumLibrary
Resource    ../Resource.robot


*** Variables ***
${HOME_TITLE}            Dashboard
${HOME_USER_ICON}        //span[@class='oxd-userdropdown-tab']
${HOME_USER_MENU}        //ul[@class='oxd-dropdown-menu']
${HOME_MENU_LOGOUT}      //a[contains(.,'Logout')]
${HOME_MENU_PIM}         //a[@class='oxd-main-menu-item'][contains(.,'PIM')]


*** Keywords ***
Clicar no icone de perfil
    Wait Until Element Is Visible   ${HOME_USER_ICON}
    Click Element                   ${HOME_USER_ICON}

Realizar o logout
    Wait Until Element Is Visible    ${HOME_USER_MENU}
    Click Element                    ${HOME_MENU_LOGOUT}

Entrar no menu PIM
    Click Element    ${HOME_MENU_PIM}

Conferir se o login foi realizado com sucesso
    Wait Until Page Contains    ${HOME_TITLE}

Acessar a pagina home
    Run Keyword    Login.Realizar o Login


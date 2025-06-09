*** Settings ***
Library     SeleniumLibrary
Resource    ../Resource.robot


*** Variables ***
${LIST_MENU_ADDEMPLOYEE}    //a[@class='oxd-topbar-body-nav-tab-item'][contains(.,'Add Employee')]
${LIST_SEARCH}              //div[contains(@class, 'oxd-grid-item--gutters')]//input[contains(@class, 'oxd-input')]
${LIST_BTN_SEARCH}          //button[contains(@class,'oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space')]
${LIST_ID_EMPLOYEE}         //div[@class='oxd-table-cell oxd-padding-cell'][2]
${LIST_EMPLOYEE}            //a[contains(.,'Employee List')]


*** Keywords ***
Acessar a pagina de cadastro de funcionario
    Wait Until Element Is Visible    ${LIST_MENU_ADDEMPLOYEE}
    Click Element                    ${LIST_MENU_ADDEMPLOYEE}

Preencher o campo de pesquisa
    Run Keyword     AddEmployee.Gerar novo funcionario
    Wait Until Element Is Visible    ${LIST_EMPLOYEE} 
    Click Element                    ${LIST_EMPLOYEE} 
    Wait Until Element Is Visible    ${LIST_SEARCH}
    Input Text                       ${LIST_SEARCH}    ${EMPLOYEE_ID}

Clicar no botão pesquisar
    Wait Until Element Is Visible     ${LIST_BTN_SEARCH}
    Double Click Element              ${LIST_BTN_SEARCH}   

Verificar o novo funcionario na listagem
    Wait Until Element Contains    ${LIST_ID_EMPLOYEE}    ${EMPLOYEE_ID}
    Element Text Should Be         ${LIST_ID_EMPLOYEE}    ${EMPLOYEE_ID}

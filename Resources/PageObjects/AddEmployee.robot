*** Settings ***
Library     SeleniumLibrary
Resource    ../Resource.robot


*** Variables ***
${ADD_INPUT_FIRSTNAME}       //input[@name='firstName']
${ADD_INPUT_LASTNAME}        //input[@name='lastName']
${ADD_INPUT_ID}              //label[contains(@class, 'oxd-label')][text()='Employee Id']/following::input[1]
${ADD_BTN}                   //button[contains(@class,'oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space')]
${ADD_PERSONAL_DETAILS}      //h6[@class='oxd-text oxd-text--h6 orangehrm-main-title'][contains(.,'Personal Details')]
${EMPLOYEE_ID} 
${EMPLOYEE_NAME}
${EMPLOYEE_LASTNAME}


*** Keywords ***
Preencher os campos obrigatorios
    ${EMPLOYEE_ID} =                 Evaluate    random.randint(0, 9999)    modules=random
    ${EMPLOYEE_NAME} =               Evaluate    faker.Faker("pt_BR").first_name()    modules=faker
    ${EMPLOYEE_LASTNAME} =           Evaluate    faker.Faker("pt_BR").last_name()    modules=faker
    Wait Until Element Is Visible    ${ADD_INPUT_FIRSTNAME}
    Wait Until Element Is Visible    ${ADD_INPUT_LASTNAME}
    Wait Until Element Is Visible    ${ADD_INPUT_ID}
    Press Keys                       ${ADD_INPUT_ID}    CTRL+A    BACKSPACE
    Input Text                       ${ADD_INPUT_FIRSTNAME}    ${EMPLOYEE_NAME}
    Input Text                       ${ADD_INPUT_LASTNAME}     ${EMPLOYEE_LASTNAME}
    Input Text                       ${ADD_INPUT_ID}           ${EMPLOYEE_ID}
    Set Global Variable              ${EMPLOYEE_ID}

Submeter cadastro
    Wait Until Element Is Visible    ${ADD_BTN}
    Double Click Element             ${ADD_BTN}

Verificar se o funcionario foi cadastrado
    Wait Until Element Is Visible    ${ADD_PERSONAL_DETAILS}

Gerar novo funcionario
    Run Keyword    ListEmployee.Acessar a pagina de cadastro de funcionario
    Run Keyword    Preencher os campos obrigatorios
    Run Keyword    Submeter cadastro
    Run Keyword    Verificar se o funcionario foi cadastrado
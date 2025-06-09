*** Settings ***
Library     SeleniumLibrary
Resource    ./PageObjects/Home.robot
Resource    ./PageObjects/Login.robot
Resource    ./PageObjects/AddEmployee.robot
Resource    ./PageObjects/ListEmployee.robot
Resource    ./PageObjects/Login.robot


*** Variables ***
${BROWSER}      chrome


*** Keywords ***
# Setup e Teardown
Abrir navegador
    Open Browser  about:blank    ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser
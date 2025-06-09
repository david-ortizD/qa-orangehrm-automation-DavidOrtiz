*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/Resource.robot
Test setup        Abrir navegador
Test Teardown     Fechar navegador


*** Test Cases ***
⁠Caso de teste 01: Login bem-sucedido
    Login.Acessar a página de Login
    Login.Preencher os campos com credenciais validas
    Login.Clicar no botao de login
    Home.Conferir se o login foi realizado com sucesso

Caso de teste 02: ⁠Login inválido com mensagem de erro validada
    Login.Acessar a página de Login
    Login.Preencher os campos com credenciais invalidas
    Login.Clicar no botao de login
    Login.Conferir se o login não foi realizado

⁠Caso de teste 03: Logout do sistema após o login
    Home.Acessar a pagina home
    Home.Clicar no icone de perfil
    Home.Realizar o logout
    Login.Conferir se o logout foi realizado    

⁠Caso de teste 04: ⁠Cadastro de novo funcionário
    Home.Acessar a pagina home
    Home.Entrar no menu PIM
    ListEmployee.Acessar a pagina de cadastro de funcionario
    AddEmployee.Preencher os campos obrigatorios
    AddEmployee.Submeter cadastro
    AddEmployee.Verificar se o funcionario foi cadastrado

Caso de teste 05: ⁠Busca pelo funcionário recém-cadastrado
    Home.Acessar a pagina home
    Home.Entrar no menu PIM
    ListEmployee.Preencher o campo de pesquisa
    ListEmployee.Clicar no botão pesquisar
    ListEmployee.Verificar o novo funcionario na listagem



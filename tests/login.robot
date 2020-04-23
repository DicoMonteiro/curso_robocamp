
*** Settings ***
Documentation       Suite de testes para validar o login do sistema Pixel
...                 Sendo um administrador de catálogo
...                 Quero me autenticar no sistema
...                 Para que eu possa gerenciar o catálogo de produtos

Resource            ../resources/resource.robot
# Resource            ../resource/pages/LoginPage.robot
Test Setup          Open session
Test Teardown       Close session


# ATDD = (Desenvolvimento guiado por teste de aceitação)
# ATDD exclusivamente para testar

# Gherckin = (Desenvolvimento guiado por comportamento)

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "didico@ninjapixel.com" e senha "pwd123"
    Então visualizo o nome do usuário "Adriano" no dashboard

Login com senha inválida
    [Template]    Tentativa de login
    didico@ninjapixel.com    teste123    Usuário e/ou senha inválidos
    # Dado que eu acesso a página de login
    # Quando solicito submeto minhas credenciais de login "didico@ninjapixel.com" e senha "teste123"
    # Então visulizo uma mensagem de erro "Usuário e/ou senha inválidos"

Login com email inválido
    [Template]    Tentativa de login
    teste@ninjapixel.com    pwd123    Usuário e/ou senha inválidos
    # Dado que eu acesso a página de login
    # Quando solicito submeto minhas credenciais de login "teste@ninjapixel.com" e senha "pwd123"
    # Então visulizo uma mensagem de erro "Usuário e/ou senha inválidos"

Login com senha branco
    [Template]    Tentativa de login
    didico@ninjapixel.com    ${EMPTY}    Opps. Informe a sua senha!
    # Dado que eu acesso a página de login
    # Quando solicito submeto minhas credenciais de login "didico@ninjapixel.com" e senha "${EMPTY}"
    # Então visulizo uma mensagem de alerta "Opps. Informe a sua senha!"

Login com email branco
    [Template]    Tentativa de login
    ${EMPTY}     pwd123    Opps. Informe o seu email!
    # Dado que eu acesso a página de login
    # Quando solicito submeto minhas credenciais de login "${EMPTY}" e senha "pwd123"
    # Então visulizo uma mensagem de alerta "Opps. Informe o seu email!"


*** Keywords ***
Tentativa de login
    [Arguments]      ${email}    ${senha}    ${mensagem}

    Dado que eu acesso a página de login
    Quando solicito submeto minhas credenciais de login "${email}" e senha "${senha}"
    Então visulizo uma mensagem de alerta "${mensagem}"

# Dado que eu acesso a página de login
#     Go To                             ${URL}/login

# Quando solicito submeto minhas credenciais de login "${email}" e senha "${senha}"
#     # LoginPage.Login with    ${email}    ${senha}
#     Login with    ${email}    ${senha}

# Então visualizo o nome do usuário "${nome}" no dashboard
#     Apresentar o nome do usuário        ${nome}

# Então visulizo uma mensagem de alerta "${mensagem}"
#     Apresentar mensagem de alerta        ${mensagem}

# Então visulizo uma mensagem de erro "${mensagem}"
#     Apresentar mensagem de erro        ${mensagem}
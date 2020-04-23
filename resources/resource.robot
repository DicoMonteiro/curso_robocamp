*** Settings ***
Documentation    Resource é o arquivo para ter o controle das interações e validações
...              Semelhante ao Page Object para estruturar a base de utilização dos
...              keywords do Robot Framework
Library            SeleniumLibrary

Resource           pages/LoginPage.robot
Resource           pages/BasePage.robot

# *** Variables ***
# ${URL}            http://pixel-web:3000



*** Keywords ***
# Nova sessão
#     Open Browser        ${URL}        chrome

# Encerrar sessão
#     Capture Page Screenshot
#     Close Browser

# Login with
#     [Arguments]              ${username}     ${password}
#     Input Text               id:emailId                      ${username}
#     Input Text               css:input[name='password']      ${password}
#     Click Element            class:btn-round

# Apresentar o nome do usuário
#     [Arguments]                 ${nome}
#     Wait Until Page Contains    ${nome}

Apresentar mensagem de alerta
    [Arguments]                   ${expect_message}
    Wait Until Page Contains      ${expect_message}
    ${message}=                   Get WebElement                  class:alert                #class:alert-info
    Should Contain                ${message.text}                 ${expect_message}

# Apresentar mensagem de erro
#     [Arguments]                    ${expect_message}
#     # Wait Until Page Contains      ${expect_message}
#     # ${message}=                   Get WebElement                  class:alert-danger
#     Wait Until Element Contains    class:alert-danger             ${expect_message}

Dado que eu acesso a página de login
    Go To                        ${URL}/login

Quando solicito submeto minhas credenciais de login "${email}" e senha "${senha}"
    # LoginPage.Login with    ${email}    ${senha}
    Login with                   ${email}    ${senha}

Então visualizo o nome do usuário "${nome}" no dashboard
    Wait Until Page Contains     ${nome}

Então visulizo uma mensagem de alerta "${mensagem}"
    Wait Until Element Contains    class:alert      ${mensagem}

*** Settings ***
Documentation    Este arquivo implementa a abertura e fechamento do browser

# Resource    ../../resources/actions.robot


*** Variables ***
# Padronização: Variaveis sem caps lock não são seletores
${base_url}    http://pixel-web:3000

# Padronização: Variaveis com CAPS LOCK são seletores
${ALERT_DANGER}    class:alert-danger
${ALERT_INFO}      class:alert-info

*** Keywords ***
### Hooks
Open Session
    Open Chrome
    # Implementado o wait global para ser utilizado em todos o projeto sem precisar
    # estar chamando o Wait Element em cada step
    Set Selenium Implicit Wait    5
    Set Window Size               1280    800

Close Session
    # Capture Page Screenshot
    Close Browser

After Test
    Capture Page Screenshot

After Test WCLS
    Capture Page Screenshot
    Execute Javascript        localStorage.clear();

Login session
    Open session
    Login with    didico@ninjapixel.com    pwd123

Product Form Session
    Login session
    Go To Product Form

Open Chrome
    Open Browser    ${base_url}/login    chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])
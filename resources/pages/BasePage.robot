*** Settings ***
Documentation    Este arquivo implementa a abertura e fechamento do browser
   
*** Variables ***
${URL}            http://pixel-web:3000

*** Keywords ***
Open session
    Open Browser        ${URL}        chrome
    # Implementado o wait global para ser utilizado em todos o projeto sem precisar
    # estar chamando o Wait Element em cada step
    Set Selenium Implicit Wait        5

Close session
    Capture Page Screenshot
    Close Browser
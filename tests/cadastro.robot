*** Settings ***
Documentation        Cadastro de Produtos no Catálogo
...                  Sendo um administrador de catálogo
...                  Quero cadastrar produtos
...                  Para que eu possa disponibiliza-los 
Resource             ../resources/resource.robot
# Resource             ../resource/pages/LoginPage.robot

Library              OperatingSystem  

Test Setup           Open session
Test Teardown        Close session


# *** Variables ***
# &{dk}    name=Donkey Kong    category=Super Nintendo    price=49.99    desc=Um jogo muito divertido
     


*** Test Cases ***
Disponibilizar o produto
    Dado que eu estou logado
    # E que eu tenha um novo produto ${dk}
    # ...    Donkey Kong    Super Nintendo    49.99    Um jogo muito divertido
    # Quando eu faço o cadastro desse produto    ${dk}
    Quando eu faço o cadastro desse produto      dk.json
    # Então visualizo este item no catálogo


*** Keywords ***
Dado que eu estou logado
    # LoginPage.Login with    didico@ninjapixel.com    pwd123
    Login with    didico@ninjapixel.com    pwd123

# E que eu tenha um novo produto
#     [Arguments]    ${name}    ${category}    ${price}    ${desc}
#     Set Test Variable    ${name}
#     Set Test Variable    ${category}
#     Set Test Variable    ${price}
#     Set Test Variable    ${desc}

Quando eu faço o cadastro desse produto
    # [Arguments]        ${product}
    [Arguments]        ${json_file}
    
    # O cógdigo abaixo vai pegar o arquivo json, contendo as massas de testes
    ${product_file}=    Get File    tests/fixtures/${json_file}
    # O código abaixo vai fazer a conversão em arquivo json
    ${product_json}=    Evaluate    json.loads($product_file)    json

    # Wait Until Element Is Visible    class:product-add
    Click Element                    class:product-add
    # Wait Until Element Is Visible    css:input[name=title]
    # Input Text                       css:input[name=title]        ${product['name']}
    # Click Element                    css:input[placeholder=Gategoria]
    # Log To Console                   product['category']
    # Click Element                    xpath://li//span[text()='${product['category']}']
    # Input Text                       css:input[name=price]        ${product['price']}
    # # Input Text                       css:input[placeholder="Adicione aqui..."]    ${product.}
    # Input Text                       css:textarea[name=description]    ${product['desc']}
    Input Text                       css:input[name=title]        ${product_json['name']}
    Click Element                    css:input[placeholder=Gategoria]
    # Log To Console                   product_json['cat']
    # Click Element                    xpath://li/span[text()='${product_json['cat']}']
    Click Element                    xpath://li/span[contains(text(), '${product_json['cat']}')]
    Input Text                       css:input[name=price]        ${product_json['price']}
    # Input Text                       css:input[placeholder="Adicione aqui..."]    ${product.}
    Input Text                       css:textarea[name=description]    ${product_json['desc']}
    Sleep        5

# Então visualizo este item no catálogo

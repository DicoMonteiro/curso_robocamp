*** Settings ***
Documentation    Este arquivo implementa as ações e elementos do Produto


*** Keywords ***
Go To Product Form
    Wait Until Element Is Visible    class:product-add
    Click Element    class:product-add

Create New Product
    [Arguments]    ${product_json}

    # Click Element    class:product-add
    Input Text       css:input[name=title]    ${product_json['name']}


    # Foi estruturado para a condição de executar um determinado ação, se for diferente e outro se for igual 
    # Run keyword If    "${product_json['cat']}" != "EMPTY"    Select Category    ${product_json['cat']}
    # ...    Run keyword If    Select Category    ${product_json['cat']}
    # Run keyword If    "${product_json['cat']}" == "EMPTY"    Run Keywords

    # Com esse implementação fica mais fácil de compreencer, que a primeira linha verifica se contem algo, 
    # não contendo, ele não executa o Select Category, se existir algum valor, ele executa o Select Category
    Run keyword If    "${product_json['cat']}"
    ...    Select Category    ${product_json['cat']}

    # ${categoria}=          Run Keyword    if     ${product_json['cat']} == "EMPTY"
    # ...                    Condition select
    # ...            ELSE    Select Category    ${product_json['cat']}      

    Input Text         css:input[name=price]     ${product_json['price']}

    Input Producers    ${product_json['producers']}
    Input Text         css:textarea[name=description]    ${product_json['desc']}

    # Utilizando essa keyword o upload somente é executado se existir algum valor na variavel
    Run Keyword If    "${product_json['image']}"
    ...    Upload Photo    ${product_json['image']}

    Click Element    id:create-product


Upload Photo
    [Arguments]    ${image}

    ${file}        Set Variable    ${EXECDIR}/resources/fixtures/images/${image}
    Choose File    id:upcover      ${file}

# Condition select
#     Press Keys        css:input[placeholder=Gategoria]    TAB

Select Category
    [Arguments]    ${cat}

    Click Element     css:input[placeholder=Gategoria]

    Set Selenium Speed        1
    Wait Until Element Is Visible    class:el-select-dropdown__list
    Click Element                    xpath://li/span[text()='${cat}']
    Set Selenium Speed        0

Input Producers
    [Arguments]    ${producers}

    : FOR    ${item}    IN    @{producers}
    \    Log           ${item}
    \    Input Text    class:producers    ${item}
    \    Press Keys    class:producers    TAB
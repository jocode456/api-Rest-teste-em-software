*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

ASSISTIDO_CT01 - Deve cadastrar assistido com dados válidos
    Open Browser    http://localhost:8080/assistido.html    chrome
    Sleep    1s
    Input Text        id=assNome    João da Silva
    Input Text        id=assPeso    70.5
    Input Text        id=assData    1990-05-15
    Click Element     id=btnAssistido
    Sleep    2s
    Element Text Should Be    id=msgAssistido    Assistido cadastrado com sucesso
    Capture Page Screenshot    evidencia_ct01_sucesso.png
    Close Browser

ASSISTIDO_CT02 - Deve validar nome obrigatório
    Open Browser    http://localhost:8080/assistido.html    chrome
    Sleep    1s
    Input Text        id=assPeso    70.5
    Input Text        id=assData    1990-05-15
    Click Element     id=btnAssistido
    Sleep    1s
    Element Should Be Focused    id=assNome
    Capture Page Screenshot    evidencia_ct02_nome_obrigatorio.png
    Close Browser

ASSISTIDO_CT03 - Deve validar peso obrigatório
    Open Browser    http://localhost:8080/assistido.html    chrome
    Sleep    1s
    Input Text        id=assNome    João da Silva
    Input Text        id=assData    1990-05-15
    Click Element     id=btnAssistido
    Sleep    1s
    Element Should Be Focused    id=assPeso
    Capture Page Screenshot    evidencia_ct03_peso_obrigatorio.png
    Close Browser

ASSISTIDO_CT04 - Deve validar data obrigatória
    Open Browser    http://localhost:8080/assistido.html    chrome
    Sleep    1s
    Input Text        id=assNome    João da Silva
    Input Text        id=assPeso    70.5
    Click Element     id=btnAssistido
    Sleep    1s
    Element Should Be Focused    id=assData
    Capture Page Screenshot    evidencia_ct04_data_obrigatoria.png
    Close Browser

ASSISTIDO_CT05 - Deve validar data futura
    Open Browser    http://localhost:8080/assistido.html    chrome
    Sleep    1s
    Input Text        id=assNome    João da Silva
    Input Text        id=assPeso    70.5
    Input Text        id=assData    2099-01-01
    Click Element     id=btnAssistido
    Sleep    2s
    Element Text Should Be    id=msgAssistido    Data de nascimento não pode ser futura
    Capture Page Screenshot    evidencia_ct05_data_futura.png
    Close Browser

ASSISTIDO_CT06 - Deve validar nome muito curto
    Open Browser    http://localhost:8080/assistido.html    chrome
    Sleep    1s
    Input Text        id=assNome    A
    Input Text        id=assPeso    70.5
    Input Text        id=assData    1990-05-15
    Click Element     id=btnAssistido
    Sleep    2s
    Element Text Should Be    id=msgAssistido    Nome muito curto
    Capture Page Screenshot    evidencia_ct06_nome_curto.png
    Close Browser
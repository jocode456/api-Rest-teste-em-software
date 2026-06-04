*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
CT01 - Deve realizar cadastro com dados válidos
    Open Browser    http://localhost:8080/cadastro.html    chrome
    Sleep    1s
    Input Text        id=cadEmail    teste123@gmail.com
    Input Password    id=cadSenha    12345678
    Input Text        id=cadData     2000-01-25
    Click Element     id=btnCadastrar
    Sleep    2s
    Element Text Should Be    id=msgCadastro    Registrado com sucesso
    Capture Page Screenshot    evidencia_ct01_cadastro_sucesso.png
    Close Browser

CT02 - Deve validar email obrigatório
    Open Browser    http://localhost:8080/cadastro.html    chrome
    Sleep    1s
    Input Password    id=cadSenha    12345678
    Input Text        id=cadData     2000-01-25
    Click Element     id=btnCadastrar
    Sleep    1s
    Element Should Be Focused    id=cadEmail
    Capture Page Screenshot    evidencia_ct02_email_obrigatorio.png
    Close Browser

CT03 - Deve validar senha obrigatória
    Open Browser    http://localhost:8080/cadastro.html    chrome
    Sleep    1s
    Input Text        id=cadEmail    dias@gmail.com
    Input Text        id=cadData     2000-01-25
    Click Element     id=btnCadastrar
    Sleep    1s
    Element Should Be Focused    id=cadSenha
    Capture Page Screenshot    evidencia_ct03_senha_obrigatoria.png
    Close Browser

CT04 - Deve validar senha inválida (menos de 8 caracteres)
    Open Browser    http://localhost:8080/cadastro.html    chrome
    Sleep    1s
    Input Text        id=cadEmail    dias@gmail.com
    Input Password    id=cadSenha    123
    Input Text        id=cadData     2000-01-25
    Click Element     id=btnCadastrar
    Sleep    2s
    Element Text Should Be    id=msgCadastro    Senha inválida
    Capture Page Screenshot    evidencia_ct04_senha_invalida.png
    Close Browser

CT05 - Deve validar email inválido
    Open Browser    http://localhost:8080/cadastro.html    chrome
    Sleep    1s
    Input Text        id=cadEmail    diasgmail.com
    Input Password    id=cadSenha    12345678
    Input Text        id=cadData     2000-01-25
    Click Element     id=btnCadastrar
    Sleep    1s
    Element Should Be Focused    id=cadEmail
    Capture Page Screenshot    evidencia_ct05_email_invalido.png
    Close Browser

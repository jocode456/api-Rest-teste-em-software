*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
CT01 - Deve realizar login com credenciais válidas
    Open Browser    http://localhost:8080/login.html    chrome
    Sleep    1s
    Input Text        id=logEmail    dias@gmail.com
    Input Password    id=logSenha    12345678
    Click Element     id=btnLogin
    Sleep    2s
    Element Text Should Be    id=msgLogin    Login efetuado com sucesso
    Capture Page Screenshot    evidencia_ct01_login_sucesso.png
    Close Browser

CT02 - Deve validar email obrigatório
    Open Browser    http://localhost:8080/login.html    chrome
    Sleep    1s
    Input Password    id=logSenha    12345678
    Click Element     id=btnLogin
    Sleep    1s
    Element Should Be Focused    id=logEmail
    Capture Page Screenshot    evidencia_ct02_email_obrigatorio.png
    Close Browser

CT03 - Deve validar senha obrigatória
    Open Browser    http://localhost:8080/login.html    chrome
    Sleep    1s
    Input Text        id=logEmail    dias@gmail.com
    Click Element     id=btnLogin
    Sleep    1s
    Element Should Be Focused    id=logSenha
    Capture Page Screenshot    evidencia_ct03_senha_obrigatoria.png
    Close Browser

CT04 - Deve validar email inválido
    Open Browser    http://localhost:8080/login.html    chrome
    Sleep    1s
    Input Text        id=logEmail    diasgmail.com
    Input Password    id=logSenha    12345678
    Click Element     id=btnLogin
    Sleep    1s
    Element Should Be Focused    id=logEmail
    Capture Page Screenshot    evidencia_ct04_email_invalido.png
    Close Browser

CT05 - Deve validar credenciais incorretas
    Open Browser    http://localhost:8080/login.html    chrome
    Sleep    1s
    Input Text        id=logEmail    dias@gmail.com
    Input Password    id=logSenha    senhaerrada
    Click Element     id=btnLogin
    Sleep    2s
    Element Text Should Be    id=msgLogin    Credenciais incorretas
    Capture Page Screenshot    evidencia_ct05_credenciais_incorretas.png
    Close Browser

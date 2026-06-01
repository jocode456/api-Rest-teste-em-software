
function exibirMensagem(elementoId, texto, ehSucesso) {
    const div = document.getElementById(elementoId);
    if (div) {
        div.textContent = texto;
        div.className = ehSucesso ? 'mensagem sucesso' : 'mensagem erro';
    }
}

//usuario
const formCadastro = document.getElementById('formCadastro');
if (formCadastro) {
    formCadastro.addEventListener('submit', async (e) => {
        e.preventDefault();
        const dados = {
            email: document.getElementById('cadEmail').value,
            senha: document.getElementById('cadSenha').value,
            dataNascimento: document.getElementById('cadData').value
        };

        try {
            const resposta = await fetch('/cadastro', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(dados)
            });
            const json = await resposta.json();
            exibirMensagem('msgCadastro', json.mensagem, resposta.ok);
        } catch (err) {
            exibirMensagem('msgCadastro', 'Erro de conexão com o servidor', false);
        }
    });
}

//login
const formLogin = document.getElementById('formLogin');
if (formLogin) {
    formLogin.addEventListener('submit', async (e) => {
        e.preventDefault();
        const dados = {
            email: document.getElementById('logEmail').value,
            senha: document.getElementById('logSenha').value
        };

        try {
            const resposta = await fetch('/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(dados)
            });
            const json = await resposta.json();
            exibirMensagem('msgLogin', json.mensagem, resposta.ok);
        } catch (err) {
            exibirMensagem('msgLogin', 'Erro de conexão com o servidor', false);
        }
    });
}

//paciente assistido
const formAssistido = document.getElementById('formAssistido');
if (formAssistido) {
    formAssistido.addEventListener('submit', async (e) => {
        e.preventDefault();
        const dados = {
            nome: document.getElementById('assNome').value,
            peso: document.getElementById('assPeso').value,
            dataNascimento: document.getElementById('assData').value
        };

        try {
            const resposta = await fetch('/assistido', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(dados)
            });
            const json = await resposta.json();
            exibirMensagem('msgAssistido', json.mensagem, resposta.ok);
        } catch (err) {
            exibirMensagem('msgAssistido', 'Erro de conexão com o servidor', false);
        }
    });
}

//adm
const formAdmin = document.getElementById('formAdmin');
if (formAdmin) {
    formAdmin.addEventListener('submit', async (e) => {
        e.preventDefault();
        const dados = { 
            perfil: document.getElementById('admPerfil').value 
        };

        try {
            const resposta = await fetch('/admin', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(dados)
            });
            const json = await resposta.json();
            exibirMensagem('msgAdmin', json.mensagem, resposta.ok);
        } catch (err) {
            exibirMensagem('msgAdmin', 'Erro de conexão com o servidor', false);
        }
    });
}
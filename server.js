const express = require('express');
const cors = require('cors');
const crypto = require('crypto');
const db = require('./db');

const app = express();
app.use(cors());
app.use(express.json());


app.use(express.static('public'));


app.post('/cadastro', (req, res) => {
    const { email, senha, dataNascimento } = req.body;
    const timestamp = new Date().toISOString();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const caracteresRepetidosRegex = /^(.)\1+$/;

    if (!email || !emailRegex.test(email)) return res.status(400).json({ mensagem: "Email inválido", timestamp });
    if (!senha || senha.length < 8 || caracteresRepetidosRegex.test(senha)) return res.status(400).json({ mensagem: "Senha inválida", timestamp });
    if (!dataNascimento || dataNascimento.includes('40')) return res.status(400).json({ mensagem: "Data de nascimento inválida", timestamp });

    const idHash = crypto.randomBytes(4).toString('hex');
    db.query('INSERT INTO usuarios (id_usuario_hash, email, senha, data_nascimento) VALUES (?, ?, ?, ?)', 
    [idHash, email, senha, dataNascimento], (err) => {
        if (err && err.code === 'ER_DUP_ENTRY') return res.status(400).json({ mensagem: "Email já cadastrado", timestamp });
        res.status(201).json({ mensagem: "Registrado com sucesso", dados: { email }, timestamp });
    });
});


app.post('/login', (req, res) => {
    const { email, senha } = req.body;

    if (!email || !senha) return res.status(400).json({ mensagem: "Email e senha são obrigatórios" });

    db.query('SELECT * FROM usuarios WHERE email = ? AND senha = ?', [email, senha], (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro interno' });
        
        if (results.length === 0) return res.status(400).json({ mensagem: "Credenciais incorretas" });
        res.status(200).json({ mensagem: "Login efetuado com sucesso", perfil: results[0].perfil });
    });
});


app.post('/assistido', (req, res) => {
    const { nome, peso, dataNascimento } = req.body;

    if (!nome || nome.length < 2) return res.status(400).json({ mensagem: "Nome muito curto" });
    if (!peso || peso <= 0) return res.status(400).json({ mensagem: "Peso deve ser maior que zero" }); 

    db.query('INSERT INTO assistidos (nome, peso, data_nascimento) VALUES (?, ?, ?)', 
    [nome, peso, dataNascimento], (err) => {
        if (err) return res.status(500).json({ erro: 'Erro interno' });
        res.status(201).json({ mensagem: "Assistido cadastrado com sucesso" });
    });
});


app.post('/admin', (req, res) => {
    const { perfil } = req.body;

    if (perfil !== 'Administrador') return res.status(403).json({ mensagem: "Acesso Proibido: Permissão insuficiente" });
    res.status(200).json({ mensagem: "Acesso liberado ao painel administrativo" });
});


const PORT = 8080;
app.listen(PORT, () => {
    console.log(`rodando na porta ${PORT}`);
    console.log(`http://localhost:${PORT}/index.html`);
});
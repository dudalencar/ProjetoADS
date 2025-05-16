 CREATE TABLE IF NOT EXISTS cargo (
 	id_cargo INTEGER PRIMARY KEY AUTOINCREMENT,
   	cargo_nome TEXT NOT NULL UNIQUE
 );
 
 INSERT INTO cargo
 (cargo_nome)
 VALUES
 ('Analista');
  INSERT INTO cargo
 (cargo_nome)
 VALUES
 ('Desenvolvedor');
  INSERT INTO cargo
 (cargo_nome)
 VALUES
 ('Designer');

CREATE TABLE IF NOT EXISTS funcionario (
    id_func INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    cep TEXT NOT NULL,
    id_cargo INTEGER NOT NULL,
    salario REAL NOT NULL,
    data_admissao DATE NOT NULL,
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);


INSERT INTO funcionario 
(nome, cpf, email, cep, id_cargo, salario, data_admissao) 
VALUES 
('Alana Santos Amaral', '551.689.897-54', 'alana@email.com', 45877648, 1, 3000.00, '2025-04-06');

INSERT INTO funcionario 
(nome, cpf, email, cep, id_cargo, salario, data_admissao) 
VALUES 
('Bruno Oliveira Costa', '218.456.123-99', 'bruno.costa@email.com', 12345678, 2, 4500.00, '2025-03-15');

INSERT INTO funcionario 
(nome, cpf, email, cep, id_cargo, salario, data_admissao) 
VALUES 
('Camila Ferreira Lima', '345.789.654-22', 'camila.lima@email.com', 98765432, 3, 3700.00, '2025-02-28');

CREATE TABLE projeto (
    id_projeto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE
);

INSERT INTO projeto 
(nome, descricao, data_inicio, data_fim)
VALUES
('Sistema de Gestão de RH', 'Plataforma web para gerenciar admissões, folha de pagamento e férias.', '2025-01-10', '2025-06-30');

INSERT INTO projeto 
(nome, descricao, data_inicio, data_fim)
VALUES
('App de Controle de Estoque', 'Aplicativo mobile para registro e monitoramento de estoque em tempo real.', '2025-03-01', NULL);

INSERT INTO projeto 
(nome, descricao, data_inicio, data_fim)
VALUES
('Portal do Cliente', 'Portal web para acesso a pedidos, suporte e histórico de compras.', '2024-11-20', '2025-04-15');

CREATE TABLE funcionario_projeto (
    id_func INTEGER,
    id_projeto INTEGER,
    funcao_no_projeto TEXT,
    PRIMARY KEY (id_func, id_projeto),
    FOREIGN KEY (id_func) REFERENCES funcionario(id_func),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto)
);

INSERT INTO funcionario_projeto 
(id_func, id_projeto, funcao_no_projeto)
VALUES
(1, 1, 'Desenvolvedor Backend');

INSERT INTO funcionario_projeto 
(id_func, id_projeto, funcao_no_projeto)
VALUES
(2, 1, 'Analista de Requisitos');

INSERT INTO funcionario_projeto 
(id_func, id_projeto, funcao_no_projeto)
VALUES
(3, 2, 'UX/UI Designer');

CREATE TABLE IF NOT EXISTS usuario_sistema (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    nivel_acesso TEXT NOT NULL,
    ativo INTEGER NOT NULL DEFAULT 1
);

INSERT INTO usuario_sistema 
(nome, email, senha, nivel_acesso, ativo)
VALUES
('Carlos Henrique Silva', 'carlos.henrique@empresa.com', '56789', 'admin', 0);

INSERT INTO usuario_sistema 
(nome, email, senha, nivel_acesso, ativo)
VALUES
('Juliana Mendes Costa', 'juliana.costa@empresa.com', '98765', 'rh', 1);

INSERT INTO usuario_sistema 
(nome, email, senha, nivel_acesso, ativo)
VALUES
('Roberta Almeida Luz', 'roberta.luz@empresa.com', '12345', 'gerente', 1);

SELECT * FROM cargo;
SELECT * FROM funcionario;
SELECT * FROM projeto;
SELECT * FROM funcionario_projeto;
SELECT * FROM usuario_sistema;

-- .: Tabelas, Colunas e Registros :.

CREATE TABLE usuarios (
	id INT,
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail do usuário',
    endereco VARCHAR(50) NOT NULL COMMENT 'Endereço do usuário',
    data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário'
);

/*
CREATE TABLE usuarios_nova (
	id INT,
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail do usuário',
    endereco VARCHAR(50) NOT NULL COMMENT 'Endereço do usuário',
    data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário'
);
*/

CREATE TABLE destinos (
	id INT,
    nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do usuário'
);

CREATE TABLE reservas (
	id INT COMMENT 'Identificador único da reserva',
    id_usuario INT COMMENT 'Referência ao ID do usuário que fez a reserva',
    id_destino INT COMMENT 'Referência ao ID do destino da reserva',
    data DATE COMMENT 'Data da reserva',
    status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada)'
);


-- .: Operações CRUD: INSERT e SELECT :.

-- INSERT:
INSERT INTO usuarios (
	id,
    nome,
    email,
    endereco,
    data_nascimento
)
VALUES (
	1,
    "Ana Karine",
    "anakarine@email.com",
    "Rua A, 10 - Fortaleza-CE",
    "1981-08-01"
);

INSERT INTO destinos (
	id,
    nome,
    descricao
)
VALUES (
	1,
    "Ubajara",
    "Parque Nacional"
);

INSERT INTO reservas (
	id,
    id_usuario,
    id_destino,
    data,
    status
)
VALUES (
	1,
    1,
    1,
    '2023-10-12',
    'pendente'
);

/*
INSERT INTO usuarios (
	id,
    nome,
    email,
    endereco,
    data_nascimento
)
VALUES (
	2,
    "Lucia Maria",
    "luciam@email.br",
    "Avenida Brasil, 15, apto 13 - São Paulo-SP",
    "1957-04-09"
), (
	3,
    "Francisco Félix",
    "ff2023@email.br",
    "Avenida Lua, 2005 - São Paulo-SP",
    "1954-12-23"
);

INSERT INTO destinos (
	id,
    nome,
    descricao
)
VALUES (
	2,
    "Parnaíba",
    "Passeio pelo Delta do Parnaíba"
), (
	3,
    "Maranhão",
    "Praia do Tatú"
);

INSERT INTO reservas (
	id,
    id_usuario,
    id_destino,
    data,
    status
)
VALUES (
	2,
    2,
    1,
    '2023-10-11',
    'cancelada'
), (
	3,
    3,
    3,
    '2023-11-13',
    'confirmada'
);
*/

-- SELECT
SELECT * FROM usuarios;
SELECT * FROM destinos; 
SELECT * FROM reservas;

SELECT * FROM usuarios 
WHERE id = 1

SELECT * FROM usuarios 
WHERE id = 1
AND nome LIKE "%Kar%";

SELECT * FROM usuarios 
WHERE id = 1
OR nome LIKE "%Kar%";


-- .: Operações CRUD: UPDATE e DELETE :.

-- UPDATE
UPDATE 	usuarios
SET id = 4
WHERE email = "denilson@mail.br";

-- DELETE
DELETE FROM destinos
WHERE nome = "Foz do Iguaçú";


-- .: Alterando e Excluindo Tabelas :.

-- Migrando dados da tabela 'usuarios' para a tabela 'usuarios_nova'
INSERT INTO usuarios_nova (id, nome, email, endereco, data_nascimento)
SELECT id, nome, email, endereco, data_nascimento
FROM usuarios;

-- Excluindo a tabela 'usuarios'
DROP TABLE usuarios;

-- Alterando o nome da tabela 'usuarios_nova' para 'usuarios'
ALTER TABLE usuarios_nova 
RENAME usuarios;

-- Alterando a quantidade de caracteres da coluna 'endereco'
ALTER TABLE usuarios
MODIFY COLUMN endereco VARCHAR(150);


-- .: Chaves Primárias e Estrangeiras :.

-- Adicionando PRIMARY KEY a coluna 'id' da tabela 'usuarios'
ALTER TABLE usuarios
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);

-- Adicionando PRIMARY KEY a coluna 'id' da tabela 'destinos'
ALTER TABLE destinos
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);

-- Adicionando PRIMARY KEY a coluna 'id' da tabela 'reservas'
ALTER TABLE reservas
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);

-- Adicionando FOREIGN KEY a coluna 'id_usuario' da tabela 'reservas'
-- e fazendo referência com a coluna 'id' da tabela 'usuarios'
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios (id);

-- Adicionando FOREIGN KEY a coluna 'id_destino' da tabela 'reservas'
-- e fazendo referência com a coluna 'id' da tabela 'destinos'
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_destinos
FOREIGN KEY (id_destino) REFERENCES destinos (id);

/*
INSERT INTO reservas (
    id_usuario,
    id_destino,
    data
)
VALUES (
    4,
    2,
    '2023-12-23'
);
*/

-- Excluindo a CONSTRAINT 'fk_reservas_usuarios' da tabela 'reservas'
ALTER TABLE reservas 
DROP CONSTRAINT fk_reservas_usuarios;

-- Recriando a CONSTRAINT 'fk_reservas_usuarios' da tabela 'reservas'
-- com DELETE CASCADE
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios (id)
ON DELETE CASCADE;

-- Deletando o usuário de id = 1, todas as reservas 
-- com esse id também serão deletados
DELETE FROM usuarios
WHERE id = 1;
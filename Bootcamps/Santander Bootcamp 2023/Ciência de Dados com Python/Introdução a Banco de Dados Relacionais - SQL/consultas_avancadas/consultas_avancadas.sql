-- .: Consultas com junções e subconsultas :.

-- INNER JOIN
SELECT * FROM usuarios us 
INNER JOIN reservas rs
ON us.id = rs.id_usuario;

SELECT * FROM usuarios us 
INNER JOIN reservas rs ON us.id = rs.id_usuario
INNER JOIN destinos ds ON rs.id_destino = ds.id;

-- LEFT JOIN
-- Retorna todos os usuários e suas respectivas reservas;
-- usuários sem reserva retornam NULL
-- | usuario A | NULL |
SELECT * FROM usuarios us 
LEFT JOIN reservas rs
ON us.id = rs.id_usuario;

-- RIGHT JOIN
-- Retorna todos os destinos e suas reservas vinculadas;
-- destinos sem reserva retornam NULL
-- | NULL | destino B |
SELECT * FROM reservas rs 
RIGHT JOIN destinos ds
ON rs.id_destino = ds.id;


-- Retorna todos os destinos sem reserva
-- SELECT id_destino FROM reservas;
SELECT * FROM destinos
WHERE id NOT IN (SELECT id_destino FROM reservas);

-- Retorna todos os usuários sem reserva
-- SELECT id_usuario FROM reservas;
SELECT * FROM usuarios
WHERE id NOT IN (SELECT id_usuario FROM reservas);

-- Retorna a quantidade de reservas para cada usuário
SELECT 
	nome, 
    (SELECT COUNT(*)
     FROM reservas 
     WHERE id_usuario = usuarios.id) AS total_reservas 
FROM usuarios;



-- .: Funções agregadas e agrupamento de resultados :.

-- COUNT
-- quantidade total de usuários
SELECT COUNT(*) AS total_usuarios FROM usuarios;

-- quantidade total de usuários com reserva
SELECT COUNT(*) AS total_usuarios FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario;

-- MAX
-- usuário com a maior idade
SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS maior_idade
FROM usuarios;

-- GROUP BY
-- agrupar os 'id_destino' da planilha 'reservas'
-- contar quantas vezes cada 'id_destino' repete
SELECT COUNT(*) AS quantidade_reservas, id_destino 
FROM reservas
GROUP BY id_destino;

-- ORDER BY
SELECT COUNT(*) AS quantidade_reservas, id_destino 
FROM reservas
GROUP BY id_destino
ORDER BY quantidade_reservas;

SELECT COUNT(*) AS quantidade_reservas, id_destino 
FROM reservas
GROUP BY id_destino
ORDER BY quantidade_reservas DESC;

SELECT COUNT(*) AS quantidade_reservas, id_destino 
FROM reservas
GROUP BY id_destino
ORDER BY quantidade_reservas, id_destino DESC;



-- .: Índices :.

/*
-- inserindo massa de dados
INSERT INTO usuarios (nome, email, data_nascimento, rua) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-01', 'Rua A'),
('Maria Santos', 'maria.santos@example.com', '1992-03-15', 'Rua B'),
('Pedro Almeida', 'pedro.almeida@example.com', '1985-07-10', 'Rua C'),
('Ana Oliveira', 'ana.oliveira@example.com', '1998-12-25', 'Rua D'),
('Carlos Pereira', 'carlos.pereira@example.com', '1991-06-05', 'Rua E'),
('Laura Mendes', 'laura.mendes@example.com', '1994-09-12', 'Rua F'),
('Fernando Santos', 'fernando.santos@example.com', '1988-02-20', 'Rua G'),
('Mariana Costa', 'mariana.costa@example.com', '1997-11-30', 'Rua H'),
('Ricardo Rodrigues', 'ricardo.rodrigues@example.com', '1993-04-18', 'Rua I'),
('Camila Alves', 'camila.alves@example.com', '1989-08-08', 'Rua J'),
('Bruno Carvalho', 'bruno.carvalho@example.com', '1995-03-25', 'Rua K'),
('Amanda Silva', 'amanda.silva@example.com', '1996-12-02', 'Rua L'),
('Paulo Mendonça', 'paulo.mendonca@example.com', '1999-07-20', 'Rua M'),
('Larissa Oliveira', 'larissa.oliveira@example.com', '1987-10-15', 'Rua N'),
('Fernanda Sousa', 'fernanda.sousa@example.com', '1992-05-08', 'Rua O'),
('Gustavo Santos', 'gustavo.santos@example.com', '1993-09-18', 'Rua P'),
('Helena Costa', 'helena.costa@example.com', '1998-02-22', 'Rua Q'),
('Diego Almeida', 'diego.almeida@example.com', '1991-11-27', 'Rua R'),
('Juliana Lima', 'juliana.lima@example.com', '1997-04-05', 'Rua S'),
('Rafaela Silva', 'rafaela.silva@example.com', '1996-01-10', 'Rua T'),
('Lucas Pereira', 'lucas.pereira@example.com', '1986-08-30', 'Rua U'),
('Fábio Rodrigues', 'fabio.rodrigues@example.com', '1989-03-12', 'Rua V'),
('Isabela Santos', 'isabela.santos@example.com', '1994-12-07', 'Rua W'),
('André Alves', 'andre.alves@example.com', '1995-09-28', 'Rua X'),
('Clara Carvalho', 'clara.carvalho@example.com', '1990-02-15', 'Rua Y'),
('Roberto Mendes', 'roberto.mendes@example.com', '1992-07-21', 'Rua Z'),
('Mariana Oliveira', 'mariana.oliveira@example.com', '1997-05-03', 'Av. A'),
('Gustavo Costa', 'gustavo.costa@example.com', '1998-11-16', 'Av. B'),
('Lara Sousa', 'lara.sousa@example.com', '1993-06-09', 'Av. C'),
('Pedro Lima', 'pedro.lima@example.com', '1996-09-27', 'Av. D');
*/

-- análise do plano de execução

-- leitura de 1 linha pois o 'email' é UNIQUE (existe índice de consulta)
EXPLAIN
	SELECT * FROM usuarios WHERE email = "joao.silva@example.com";

-- leitura de 34 linhas pois o 'nome' não possui índice de consulta
EXPLAIN
	SELECT * FROM usuarios WHERE nome = "João Silva";

-- criando índice de consulta para a coluna 'nome'
CREATE INDEX idx_nome ON usuarios (nome);

-- leitura de 2 linhas (2 usuários cadastrados como "João Silva")
EXPLAIN
	SELECT * FROM usuarios WHERE nome = "João Silva";
-- .: Normalização de Dados :.

-- Criando colunas 'rua', 'numero', 'cidade' e 'estado' na tabela 'usuarios'
ALTER TABLE usuarios
ADD rua VARCHAR(100),
ADD numero VARCHAR(15), -- LONGTEXT
ADD cidade VARCHAR(50),
ADD estado VARCHAR(20);

-- Populando as colunas criadas no passo anterior a partir da coluna 'endereco'
-- Exemplos de endereço: 
-- "Avenida Brasil, 15, apto 13 - São Paulo-SP"
-- "Rua B, 584 - Rio de Janeiro-RJ"
UPDATE usuarios
SET rua = SUBSTRING_INDEX(endereco, ',', 1),
    SET numero = SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, '-' , 1), ',' , 2), ',' , -1);
    cidade = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, '-', 2), '-', -1),
    estado = SUBSTRING_INDEX(endereco, '-', -1);

-- Deletar a coluna 'endereco'
ALTER TABLE usuarios
DROP COLUMN endereco;
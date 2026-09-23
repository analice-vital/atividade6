CREATE DATABASE clinica_medica_db;

USE clinica_medica_db;

CREATE TABLE medicos (
    id INT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    especialidade VARCHAR(80) NOT NULL,
    crm VARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE pacientes (
    id INT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    rua VARCHAR(120) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE agendamentos (
    id INT NOT NULL,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    sala VARCHAR(10) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    observacoes VARCHAR(255),

    PRIMARY KEY (id),

    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

INSERT INTO medicos (id, nome, especialidade, crm, telefone, email)
VALUES
(1, 'Carlos Andrade', 'Cardiologia', 'SP123456', '(14) 99123-4567', 'carlos.andrade@vidasaudavel.com'),
(2, 'Sofia Almeida', 'Dermatologia', 'SP654321', '(14) 99765-4321', 'sofia.almeida@vidasaudavel.com'),
(3, 'Fernando Batista', 'Ortopedia', 'SP789123', '(14) 98877-6655', 'fernando.batista@vidasaudavel.com');

INSERT INTO pacientes (id, nome, cpf, data_nascimento, rua, numero, cidade, cep, telefone, email)
VALUES
(1, 'Ana Oliveira', '111.222.333-44', '1985-05-20', 'Rua das Flores', '123', 'Botucatu', '18600-000', '(14) 99888-7777', 'ana.oliveira@email.com'),
(2, 'Lucas Martins', '444.555.666-77', '1992-11-30', 'Avenida Principal', '456', 'Botucatu', '18602-123', '(14) 99777-6666', 'lucas.martins@email.com'),
(3, 'Ricardo Mendes', '777.888.999-00', '1978-02-10', 'Travessa da Paz', '78', 'Botucatu', '18605-456', '(14) 99666-5555', 'ricardo.mendes@email.com');

INSERT INTO agendamentos (id, medico_id, paciente_id, data_hora, sala, valor, observacoes)
VALUES
(1, 1, 1, '2025-10-20 09:00:00', 'Sala 101', 350.00, 'Paciente relata dor no peito'),
(2, 2, 3, '2025-10-22 14:30:00', 'Sala 205', 400.00, 'Verificar manchas na pele'),
(3, 3, 2, '2025-10-25 11:00:00', 'Sala 302', 300.00, NULL);

UPDATE medicos
SET telefone = '(14) 99100-2030'
WHERE id = 1;

UPDATE pacientes
SET
    rua = 'Avenida Vital Brasil',
    numero = '789',
    cep = '18603-190'
WHERE id = 1;

DELETE FROM agendamentos
WHERE id = 2;

DELETE FROM pacientes
WHERE id = 3;

SELECT * FROM medicos;
SELECT * FROM pacientes;
SELECT * FROM agendamentos;

CREATE DATABASE CursosEtecUirapuru;
USE CursosEtecUirapuru;

CREATE TABLE Curso(
idCurso INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cargaHoraria INT
);

CREATE TABLE Professor(
idProfessor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
formacao VARCHAR(50),
email VARCHAR(50)
);

CREATE TABLE Disciplina(
idDisciplina INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
idCurso INT,
FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

CREATE TABLE Aluno(
idAluno INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
data_nasc DATE,
email VARCHAR(50),
idCurso INT,
FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

CREATE TABLE Atribuicao(
idAtribuicao INT AUTO_INCREMENT PRIMARY KEY,
idProfessor INT,
idDisciplina INT,
FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor),
FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina)
);

ALTER TABLE Professor ADD telefone INT;

CREATE TABLE Salas(
idSala INT AUTO_INCREMENT PRIMARY KEY,
nomeSala VARCHAR(50),
capacidade INT
);

ALTER TABLE Professor CHANGE COLUMN telefone telefone VARCHAR(20);

ALTER TABLE Atribuicao ADD COLUMN idSala INT;

ALTER TABLE Atribuicao ADD CONSTRAINT FOREIGN KEY (idSala) REFERENCES Salas(idSala);

INSERT INTO Curso(nome,cargaHoraria) VALUES
('Desenvolvimento de Sistemas', 1200),
('Segurança do Trabalho', 1200),
('Nutrição', 1200);

INSERT INTO Professor(nome,formacao,email,telefone) VALUES
('Cleiton Dias', 'Análise e Desenvolvimento de Sistemas', 'cleitondias2025@gmail.com','(11)93029-0421'),
('Mario', 'Técnico em Segurança do Trabalho', 'mario2025@gmail.com', '(11)12345-6789'),
('Karla', 'Nutrição e Dietética', 'karla2025@gmail.com', '(11)98765-4321');

INSERT INTO Disciplina(nome,idCurso) VALUES
('Banco de Dados', 1),
('fundamentos da segurança', 2),
('Educação Nutricional', 3);

INSERT INTO Aluno(nome,data_nasc,email,idCurso) VALUES
('Carlos Cauã', '29-01-2005', 'cauau2005@gmail.com', 1),
('Talita Ribeiro', '07-05-2009', 'cauau2005@gmail.com', 2),
('Rayane Temi Tahara', '28-09-2008', 'cauau2005@gmail.com', 3);

INSERT INTO Salas(nomeSala,capacidade) VALUES
('LAB-01', 30),
('LAB-06', 20),
('LAB-03', 30);

INSERT INTO Atribuicao(idProfessor, idDisciplina, idSala) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

ALTER TABLE Professor DROP COLUMN formacao;
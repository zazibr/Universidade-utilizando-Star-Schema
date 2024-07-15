-- Cria o banco de dados se ele não existir
CREATE DATABASE IF NOT EXISTS universidade;

use universidade;

CREATE TABLE Departamento (
    idDepartamento INT PRIMARY KEY,
    Nome VARCHAR(45),
    Campus VARCHAR(45)
);

CREATE TABLE Professor (
    idProfessor INT PRIMARY KEY,
    Nome VARCHAR(45),
    Departamento_idDepartamento INT,
    FOREIGN KEY (Departamento_idDepartamento) REFERENCES Departamento(idDepartamento)
);

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    Nome_Curso VARCHAR(45),
    Departamento_idDepartamento INT,
    FOREIGN KEY (Departamento_idDepartamento) REFERENCES Departamento(idDepartamento)
);

CREATE TABLE Aluno (
    idAluno INT PRIMARY KEY,
    Nome VARCHAR(45)
);

CREATE TABLE Disciplina (
    idDisciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(45),
    Professor_idProfessor INT,
    FOREIGN KEY (Professor_idProfessor) REFERENCES Professor(idProfessor)
);

CREATE TABLE Matriculado (
    Aluno_idAluno INT,
    Disciplina_idDisciplina INT,
    PRIMARY KEY (Aluno_idAluno, Disciplina_idDisciplina),
    FOREIGN KEY (Aluno_idAluno) REFERENCES Aluno(idAluno),
    FOREIGN KEY (Disciplina_idDisciplina) REFERENCES Disciplina(idDisciplina)
);

CREATE TABLE Pre_requisitos (
    idPre_requisitos INT PRIMARY KEY,
    Disciplina_idDisciplina INT,
    Pre_requisitos_idPre_requisitos INT,
    FOREIGN KEY (Disciplina_idDisciplina) REFERENCES Disciplina(idDisciplina),
    FOREIGN KEY (Pre_requisitos_idPre_requisitos) REFERENCES Disciplina(idDisciplina)
);

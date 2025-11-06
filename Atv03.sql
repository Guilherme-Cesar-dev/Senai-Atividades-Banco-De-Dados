-- Primeiro Modelo Físico de Dados

CREATE table Curso (
	idcurso INT NOT NULL,
    nome VARCHAR(100)  NOT NULL,
    
    PRIMARY KEY(idcurso)
);

CREATE table Autor (
	idautor INT NOT NULL,
    nome VARCHAR(100)  NOT NULL,
    
    PRIMARY KEY(idautor)
);

CREATE table Editora (
	ideditora INT NOT NULL,
    nome VARCHAR(100)  NOT NULL,
    
    PRIMARY KEY(ideditora)
);

CREATE table EditoraAutor (
	idautor INT NOT NULL,
	ideditora INT NOT NULL,
    
    PRIMARY KEY(idautor, ideditora),
    FOREIGN KEY (idautor) REFERENCES Autor(idautor),
    FOREIGN KEY (ideditora) REFERENCES Editora(ideditora)
);

CREATE table Aluno (
	idaluno INT NOT NULL,
    idcurso INT NOT NULL,
    nome VARCHAR(100)  NOT NULL,
    cpf CHAR(11)  NOT NULL,
    
    PRIMARY KEY(idaluno),
    FOREIGN KEY (idcurso) REFERENCES Curso(idcurso)
);

CREATE table Livro (
	ISBN INT NOT NULL,
    ideditora INT NOT NULL,
    titulo CHAR NOT NULL,
    diaDaPublicacao DATE NOT NULL,
    
    PRIMARY KEY(ISBN),
    FOREIGN KEY (ideditora) REFERENCES Editora(ideditora)
);

CREATE table LivroAluno (
	ISBN INT NOT NULL,
	idaluno INT NOT NULL,
    
    PRIMARY KEY(ISBN, idaluno),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (idaluno) REFERENCES Aluno(idaluno)
);

CREATE table LivroAutor (
	ISBN INT NOT NULL,
	idautor INT NOT NULL,
    
    PRIMARY KEY(ISBN, idautor),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (idautor) REFERENCES Autor(idautor)
);
-- tabela ELEITOR
create table ELEITOR (
    nome VARCHAR2(100) not null,
    endereco VARCHAR2(100) not null,
    tit_eleitor VARCHAR2(12),
    constraint pk_eleitor primary key (tit_eleitor)
    -- constraint chk_tit_eleitor check (tit_eleitor like '????????????')
);
SELECT * FROM ELEITOR;
DROP TABLE ELEITOR;
-- tabela ELEITOR


-- tabela PROJETO_DE_LEI
create table PROJETO_DE_LEI (
    autor varchar2(100), -- tem que ser um dos politicos
    ano varchar2(4),
    numero integer primary key,
    constraint fk_projeto_autor foreign key (autor) references LEGISLATIVO (nome)
);
SELECT * FROM PROJETO_DE_LEI;
DROP TABLE PROJETO_DE_LEI;
-- tabela PROJETO_DE_LEI


-- tabela MINISTROS_STF
create table MINISTROS_STF(
    cpf varchar2(14) primary key
);
SELECT * FROM MINISTROS_STF;
DROP TABLE MINISTROS_STF;
-- tabela MINISTROS_STF


-- tabela TITULOS_STF
create table TITULOS_STF(
    cpf varchar2(14),
    data_titulo date,
    descricao varchar2(300),
    grau varchar2(50),
    constraint fk_cpf_ministro foreign key (cpf) references MINISTROS_STF (cpf)
);
SELECT * FROM TITULOS_STF;
DROP TABLE TITULOS_STF;
-- tabela TITULOS_STF


-- tabela LEI
create table LEI(
    numero integer primary key,
    autor varchar2(100),
    data_publicacao date not null,
    constraint fk_lei_autor foreign key (autor) references PROJETO_DE_LEI (autor)
);
SELECT * FROM LEI;
DROP TABLE LEI;
-- tabela LEI


-- tabela MINISTROS
create table MINISTROS(
    cpf varchar2(14) primary key,
    data_nascimento date not null
);
SELECT * FROM MINISTROS;
DROP TABLE MINISTROS;
-- tabela MINISTROS


-- tabela MINISTERIOS
create table MINISTERIOS(
    sigla varchar2(10) primary key,
    verba float,
    nome VARCHAR2(100) not null
);
SELECT * FROM MINISTERIOS;
DROP TABLE MINISTERIOS;
-- tabela MINISTERIOS


-- tabela SECRETARIAS
create table SECRETARIAS(
    sigla_min varchar2(10),
    sigla varchar2(10),
    nome varchar2(50),
    constraint fk_sigla_sec foreign key (sigla_min) references MINISTERIOS (sigla)
);
SELECT * FROM SECRETARIAS;
DROP TABLE SECRETARIAS;
-- tabela SECRETARIAS


-- tabela LEGISLATIVO
create table LEGISLATIVO (
    cpf varchar2(14) primary key,
    cargo varchar2(50) not null,
    estado varchar2(2) not null,
    nome varchar2(100) not null,
    partido varchar2(10)
);

SELECT * FROM LEGISLATIVO;

DROP TABLE LEGISLATIVO;
-- tabela LEGISLATIVO


-- tabela EXECUTIVO
create table EXECUTIVO (
    cpf varchar2(14) primary key,
    cargo varchar2(50) not null,
    estado varchar2(2) not null,
    nome varchar2(100) not null,
    partido varchar2(10)
);

SELECT * FROM EXECUTIVO;

DROP TABLE EXECUTIVO;
-- tabela EXECUTIVO


-- tabela PARTICIPACOES
create table PARTICIPACOES(
    cpf varchar2(14),
    participacao varchar2(50),
    constraint fk_cpf_legislativo foreign key (cpf) references LEGISLATIVO (cpf)
);
-- tabela PARTICIPACOES




-- Populando as tabelas

-- Inserindo eleitores
insert into ELEITOR (nome, endereco, tit_eleitor) values
('Maria Madalena da Silva Santos', 'Rua do Cabo, 183, Ponta Grossa', '111111111111');

insert into ELEITOR (nome, endereco, tit_eleitor) values
('Joaquim Raimundo Farias', 'Rua dos Bobos, 634, Casa Amarela', '222222222222');

insert into ELEITOR (nome, endereco, tit_eleitor) values
('Thiago Lorenzo da Silva Ferraz', 'Rua Amauri Fernandes, 456, Várzea', '333333333333');

insert into ELEITOR (nome, endereco, tit_eleitor) values
('Severino Daniel Emanuel Rocha', 'Rua Ayrton Senna, 567, São Gonçalo', '444444444444');

insert into ELEITOR (nome, endereco, tit_eleitor) values
('Sebastiana Rayssa Farias', 'Rua Paulo Freire, 75, Várzea', '555555555555');

insert into ELEITOR (nome, endereco, tit_eleitor) values
('Isis Alícia Rodrigues', 'Rua Demétrio Costa, 10, Pitombeiras', '666666666666');

insert into ELEITOR (nome, endereco, tit_eleitor) values
('Ana Bezerra da Silva', 'Rua do Paz, 45, Batateira', '777777777777');
-- Inserindo eleitores

-- Inserindo projetos
insert into PROJETO_DE_LEI (autor, ano, numero) values
('Joana Castro Bezerra', '2010', 784);

insert into PROJETO_DE_LEI (autor, ano, numero) values
('Cícera Giomar Bezerra', '2018', 645);

insert into PROJETO_DE_LEI (autor, ano, numero) values
('Joana Castro Bezerra', '2014', 342);

insert into PROJETO_DE_LEI (autor, ano, numero) values
('Neymar da Silva Santos Júnior', '2022', 754);

insert into PROJETO_DE_LEI (autor, ano, numero) values
('José Roberto de Sá', '2015', 546);
-- Inserindo projetos

-- Inserindo LEGISLATIVO
insert into LEGISLATIVO (cpf, cargo, estado, nome, partido) values
('111.111.111-11', 'deputado federal', 'SP', 'José Malaquias Peixoto', 'PSDB');

insert into LEGISLATIVO (cpf, cargo, estado, nome, partido) values
('222.222.222-22', 'deputado estadual', 'PB', 'Joana Castro Bezerra', 'PT');

insert into LEGISLATIVO (cpf, cargo, estado, nome, partido) values
('333.333.333-33', 'senador', 'PE', 'José Roberto de Sá', 'PT');

insert into LEGISLATIVO (cpf, cargo, estado, nome, partido) values
('444.444.444-44', 'deputado federal', 'SP', 'Neymar da Silva Santos Júnior', 'PSOL');

insert into LEGISLATIVO (cpf, cargo, estado, nome, partido) values
('555.555.555-55', 'deputado federal', 'SP', 'Cícera Giomar Bezerra', 'PSDB');

insert into LEGISLATIVO (cpf, cargo, estado, nome, partido) values
('666.666.666-66', 'deputado estadual', 'PE', 'Antônio Nunes Ferreira', 'PSL');
-- Inserindo LEGISLATIVO

-- Inserindo EXECUTIVO
insert into EXECUTIVO (cpf, cargo, estado, nome, partido) values
('777.777.777-13', 'presidente', 'DF', 'Luiz Inácio Lula da Silva', 'PT');
-- Inserindo EXECUTIVO

-- Populando as tabelas

-- tabela ELEITOR
create table ELEITOR (
    nome VARCHAR2(100),
    tit_eleitor VARCHAR2(12) primary key,
    rua VARCHAR2(100),
    cep VARCHAR2(10),
    numero number
);
SELECT * FROM ELEITOR;
DROP TABLE ELEITOR;


--tabela VOTA
create table VOTA(
    tit_eleitor varchar(12),
    cpf varchar2(14),
    registro varchar(50),
    constraint pk_vota primary key (tit_eleitor, cpf),
    constraint fk_cpf_vota foreign key (cpf) references POLITICO(cpf),
    constraint fk_titeleitor_cria foreign key (tit_eleitor) references ELEITOR(tit_eleitor)
);
SELECT * FROM VOTA;
DROP TABLE VOTA;


-- tabela POLITCO
create table POLITICO (
    cpf varchar2(14) primary key,
    cargo varchar2(50) not null,
    estado varchar2(2) not null,
    nome varchar2(100) not null,
    partido varchar2(10)
);
SELECT * FROM POLITICO;
DROP TABLE POLITICO;


-- tabela LEGISLATIVO
create table LEGISLATIVO (
    cpf varchar2(14) primary key,
    cpf_pres varchar2(14),
    tipo_camara varchar2(50),
    constraint fk_cpf_pres foreign key (cpf_pres) references LEGISLATIVO(cpf),
    constraint fk_tipo_camara foreign key (tipo_camara) references CAMARA(tipo)
);
SELECT * FROM LEGISLATIVO;
DROP TABLE LEGISLATIVO;


-- tabela CAMARA
create table CAMARA(
    tipo varchar2(50) primary key,
    presidente varchar2(100)
);
SELECT * FROM CAMARA;
DROP TABLE CAMARA;


-- tabela EXECUTIVO
create table EXECUTIVO (
    cpf varchar2(14) primary key,
    constraint fk_cpf_executivo foreign key (cpf) references POLITCO(cpf)
);
SELECT * FROM EXECUTIVO;
DROP TABLE EXECUTIVO;


-- tabela PARTICIPACOES
create table PARTICIPACOES(
    cpf varchar2(14),
    participacao varchar2(50),
    CONSTRAINT pk_participacoes primary key (cpf, participacoes),
    constraint fk_cpf_legislativo foreign key (cpf) references LEGISLATIVO (cpf)
);
SELECT * FROM PARTICIPACOES;
DROP TABLE PARTICIPACOES;


-- tabela CRIA
create table CRIA(
    cpf varchar2(14),
    numero integer,
    constraint pk_cria primary key (cpf, numero),
    constraint fk_cpf_cria foreign key (cpf) references POLITICO(cpf),
    constraint fk_numero_cria foreign key (numero) references PROJETO_DE_LEI(numero)
);
SELECT * FROM CRIA;
DROP TABLE CRIA;


-- tabela PROJETO_DE_LEI
create table PROJETO_DE_LEI (
    ano varchar2(4),
    numero integer primary key,
    status varchar2(50)
);
SELECT * FROM PROJETO_DE_LEI;
DROP TABLE PROJETO_DE_LEI;


-- tabela ANALISA
create table ANALISA(
	numero integer,
	cpf_exec varchar2(14),
	data_analisa date,
	resultado varchar2(50),
	constraint pk_analisa primary key (numero, cpf_exec),
	constraint fk_numero_analisa foreign key (numero)references PROJETO_DE_LEI(numero),
	constraint fk_cpfexec_analisa foreign key (cpf_exec)references EXECUTIVO(cpf)
);
SELECT * FROM ANALISA;
DROP TABLE ANALISA;


-- tabela MINISTROS_STF
create table MINISTROS_STF(
    cpf varchar2(14) primary key
);
SELECT * FROM MINISTROS_STF;
DROP TABLE MINISTROS_STF;


-- tabela TITULOS_STF
create table TITULOS_STF(
    cpf varchar2(14),
    data_titulo date,
    descricao varchar2(300),
    grau varchar2(50),
    constraint pk_titulos_stf primary key (cpf, data_titulo, descricao, grau),
    constraint fk_cpf_ministro foreign key (cpf) references MINISTROS_STF (cpf)
);
SELECT * FROM TITULOS_STF;
DROP TABLE TITULOS_STF;


-- tabela LEI
create table LEI(
    numero integer primary key,
    data_publicacao date not null,
    numero_pl integer unique not null,
    cpf_exec varchar2(14) unique not null,
    constraint fk_numero_pl foreign key (numero_pl, cpf_exec) references ANALISA (numero, cpf_exec)
);
SELECT * FROM LEI;
DROP TABLE LEI;
-- tabela LEI


-- tabela AUTOR_LEIS
create table AUTOR_LEIS(
    numero integer,
    autor varchar2(100),
    constraint pk_autor_leis primary key (numero, autor),
    constraint fk_numero_lei foreign key (numero) references LEI(numero)
    -- constraint chk_autor check (autor in POLITICO(nome))
);


-- tabela MINISTERIOS_MINISTROS
create table MINISTERIOS_MINISTROS(
    cpf varchar(14) primary key,
    data_nascimento date,
    sigla varchar(10) unique not null,
    nome_ministerio varchar(50),
    verba decimal(9,2),
    cpf_exec varchar(14),
    constraint fk_cpfexec_ministeriosministros foreign key (cpf_exec) references EXECUTIVO(cpf) 
);
SELECT * FROM MINISTERIOS_MINISTROS;
DROP TABLE MINISTERIOS_MINISTROS;



-- tabela SECRETARIAS
create table SECRETARIAS(
    cpf_ministro varchar2(12),
    sigla varchar2(10),
    nome varchar2(50),
    constraint pk_secretaria primary key (cpf_ministro, sigla),
    constraint fk_cpf_sec foreign key (cpf_ministro) references MINISTERIOS_MINISTROS (cpf)
);
SELECT * FROM SECRETARIAS;
DROP TABLE SECRETARIAS;


-- tabela TRAMITA
create table TRAMITA(
    numero integer,
    tipo_camara varchar2(50),
    data_tramita date,
    resultado varchar2(50),
    constraint pk_tramita primary key (numero, tipo_camara),
    constraint fk_numero foreign key (numero) references PROJETO_DE_LEI (numero),
    constraint fk_tipo_camara foreign key (tipo_camara) references CAMARA (tipo)
);

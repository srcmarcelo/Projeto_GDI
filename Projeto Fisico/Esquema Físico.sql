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


-- tabela POLITICO
create table POLITICO (
cpf varchar2(14) primary key,
cargo varchar2(50) not null,
estado varchar2(2) not null,
nome varchar2(100) not null,
partido varchar2(10)
);
SELECT * FROM POLITICO;
DROP TABLE POLITICO;


--tabela vota
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


-- tabela CAMARA
create table CAMARA(
tipo varchar2(50) primary key,
presidente varchar2(100)
);
SELECT * FROM CAMARA;
DROP TABLE CAMARA;


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


-- tabela EXECUTIVO
create table EXECUTIVO (
cpf varchar2(14) primary key,
constraint fk_cpf_executivo foreign key (cpf) references POLITICO(cpf)
);
SELECT * FROM EXECUTIVO;
DROP TABLE EXECUTIVO;


-- tabela PARTICIPACOES
create table PARTICIPACOES(
cpf varchar2(14),
participacao varchar2(50),
CONSTRAINT pk_participacoes primary key (cpf, participacao),
constraint fk_cpf_legislativo foreign key (cpf) references LEGISLATIVO (cpf)
);
SELECT * FROM PARTICIPACOES;
DROP TABLE PARTICIPACOES;


-- tabela PROJETO_DE_LEI
create table PROJETO_DE_LEI (
ano varchar2(4),
numero integer primary key,
status varchar2(50)
);
SELECT * FROM PROJETO_DE_LEI;
DROP TABLE PROJETO_DE_LEI;


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


-- tabela ANALISA
create table ANALISA(
numero integer,
cpf_exec varchar2(14),
data_analisa date,
resultado varchar2(50),
constraint pk_analisa primary key (numero, cpf_exec),
constraint fk_numero_analisa foreign key (numero) references PROJETO_DE_LEI(numero),
constraint fk_cpfexec_analisa foreign key (cpf_exec)references EXECUTIVO(cpf)
);
SELECT * FROM ANALISA;
DROP TABLE ANALISA;


-- tabela LEI
create table LEI(
numero integer primary key,
data_publicacao date not null,
numero_pl integer unique not null,
cpf_exec varchar2(14) not null,
constraint fk_numero_pl foreign key (numero_pl, cpf_exec) references ANALISA
(numero, cpf_exec)
);
SELECT * FROM LEI;
DROP TABLE LEI;


-- tabela AUTOR_LEIS
create table AUTOR_LEIS(
numero integer,
autor varchar2(100),
constraint pk_autor_leis primary key (numero, autor),
constraint fk_numero_lei foreign key (numero) references LEI(numero)
-- constraint chk_autor check (autor in POLITICO(nome))
);
SELECT * FROM AUTOR_LEIS;
DROP TABLE AUTOR_LEIS;


-- tabela MINISTERIOS_MINISTROS
create table MINISTERIOS_MINISTROS(
cpf varchar2(14) primary key,
data_nascimento date,
sigla varchar2(10) unique not null,
nome_ministerio varchar2(50),
verba integer,
cpf_exec varchar2(14),
constraint fk_cpfexec foreign key (cpf_exec) references EXECUTIVO(cpf)
);
SELECT * FROM MINISTERIOS_MINISTROS;
DROP TABLE MINISTERIOS_MINISTROS;


-- tabela SECRETARIAS
create table SECRETARIAS(
cpf_ministro varchar2(12),
sigla varchar2(10),
nome varchar2(100),
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
constraint fk_numero_tramita foreign key (numero) references PROJETO_DE_LEI(numero),
constraint fk_tipo_tramita foreign key (tipo_camara) references CAMARA (tipo)
);
SELECT * FROM TRAMITA;
DROP TABLE TRAMITA;




-- INSERINDO ELEITOR
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Tiago Antonio Joaquim Martins', '147852369789', 'rua amarela', '78546-952', 10);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Clara Sebastiana Ferreira', '987456321147', 'Rua Professor Santiago Dantas ', '59035-210',
31);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Ryan Lucas Lopes', '321654987987', 'Rua Geraldo Andrade ', '75901-097', 25);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Julio Rodrigo Arthur Assunção', '321321321321', 'Rua Josué Lemos ', '14403-801', 890);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Marli Ayla Betina Silva', '147852258741', 'Rua Vinte e Dois ', '25260-250', 314);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Henrique Alexandre Leonardo da Mata', '357357357357', 'Avenida Terceira Avenida Área
Especial 21', '27720-597', 57);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Ian Heitor Campos', '369369369369', 'Rua da Glória ', '78141-136', 177);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Marcos Rodrigo Alves', '852546951753', 'Rua Antióquia ', '54170-750', 93);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Oliver Caleb Cardoso', '258789987852', 'Rua Tacima ', '58302-410', 804);
insert into ELEITOR (nome, tit_eleitor, rua, cep, numero) values
('Lara Heloise Melo', '159159159159', 'Rua Ulisses Conceição ', '79017-668', 41);


-- INSERINDO POLITICO
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('53485723738', 'deputado estadual', 'PE', 'Pedro Lucca Moreira', 'PSDB');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('80136955819', 'deputado federal', 'SP', 'José Marcos Moreira', 'PT');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('95307699034', 'presidente', 'SP', 'Luiz Inácio Lula da Silva', 'PT');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('10793297222', 'deputado estadual', 'PE', 'Vinicius Márcio Pinto', 'PSOL');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('83714792988', 'deputado federal', 'MG', 'Diogo Hugo Oliver Carvalho', 'PSL');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('92544443910', 'deputado estadual', 'SE', 'Mariana Sabrina Antonella Rodrigues', 'PTB');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('37379326627', 'deputado federal', 'MA', 'Francisco Luiz Jesus', 'PT');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('71019001194', 'deputado estadual', 'PA', 'Leandro Anthony Vieira', 'PT');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('35120996531', 'deputado federal', 'PB', 'Manuela Marli Ana Almeida', 'PSOL');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('63975831553', 'deputado estadual', 'SP', 'Rosângela Raimunda Luna Araújo', 'PV');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('58192287661', 'deputado federal', 'SP', 'Guilherme Carlos Sebastião Costa', 'PT');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('47533744594', 'senador', 'MG', 'Daniela Sônia Agatha Sales', 'PSOL');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('24647271641', 'senador', 'MG', 'Esther Valentina Marli Teixeira', 'PT');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('52901262368', 'senador', 'PA', 'Ricardo Lorenzo Melo', 'PSOL');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('86650393681', 'senador', 'RR', 'Raquel Patrícia Barbosa', 'PT');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('97269913749', 'senador', 'PB', 'Teresinha Luciana Monteiro', 'PSOL');
insert into POLITICO (cpf, cargo, estado, nome, partido) values
('75948203476', 'senador', 'MG', 'Marli Sandra da Paz', 'PT');


-- INSERINDO CAMARA
insert into CAMARA (tipo, presidente) values
('deputados', 'Pedro Lucca Moreira');
insert into CAMARA (tipo, presidente) values
('senadores', 'Mariana Carla da Silva');


-- INSERINDO LEGISLATIVO
insert into LEGISLATIVO (cpf, tipo_camara) values
('53485723738', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('80136955819', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('10793297222', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('83714792988', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('92544443910', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('37379326627', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('71019001194', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('35120996531', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('63975831553', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('58192287661', 'deputados');
insert into LEGISLATIVO (cpf, tipo_camara) values
('47533744594', 'senadores');
insert into LEGISLATIVO (cpf, tipo_camara) values
('24647271641', 'senadores');insert into LEGISLATIVO (cpf, tipo_camara) values
('52901262368', 'senadores');
insert into LEGISLATIVO (cpf, tipo_camara) values
('86650393681', 'senadores');
insert into LEGISLATIVO (cpf, tipo_camara) values
('97269913749', 'senadores');
insert into LEGISLATIVO (cpf, tipo_camara) values
('75948203476', 'senadores');


-- INSERINDO EXECUTIVO
insert into EXECUTIVO (cpf) values ('95307699034');


-- INSERINDO PROJETO_DE_LEI
insert into PROJETO_DE_LEI (ano, numero, status) values
('1994', 123456, 'negado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('1995', 654321, 'aprovado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('1991', 147852, 'negado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('2013', 369852, 'negado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('1985', 987456, 'aprovado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('1978', 369147, 'negado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('2004', 852654, 'negado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('2018', 159753, 'aprovado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('2022', 852987, 'negado');
insert into PROJETO_DE_LEI (ano, numero, status) values
('1990', 654789, 'negado');


-- INSERINDO MINISTERIOS_MINISTROS
insert into MINISTERIOS_MINISTROS (cpf, data_nascimento, sigla, nome_ministerio, verba, cpf_exec) values
('70125451784', '07-02-1958', 'MEC', 'Ministério da Educação', 1989233, '95307699034');
insert into MINISTERIOS_MINISTROS (cpf, data_nascimento, sigla, nome_ministerio, verba, cpf_exec) values
('62528710526', '21-02-1945', 'MJSP', 'Ministério da Justiça e Segurança Pública', 575354054, '95307699034');
insert into MINISTERIOS_MINISTROS (cpf, data_nascimento, sigla, nome_ministerio, verba, cpf_exec) values
('02024348505', '12-04-1995', 'ME', 'Ministério da Economia', 1466766, '95307699034');
insert into MINISTERIOS_MINISTROS (cpf, data_nascimento, sigla, nome_ministerio, verba, cpf_exec) values
('58657563460', '17-04-1992', 'MS', 'Ministério da Saúde', 4562111, '95307699034');
insert into MINISTERIOS_MINISTROS (cpf, data_nascimento, sigla, nome_ministerio, verba, cpf_exec) values
('77864976760', '05-01-1973', 'MME', 'Ministério de Minas e Energia', 2234098, '95307699034');


-- INSERINDO PARTICIPACOES
insert into PARTICIPACOES (cpf, participacao) values
('53485723738', 'Comenda Nise Magalhães da Silveira');
insert into PARTICIPACOES (cpf, participacao) values
('53485723738', 'Conselho da Comenda do Mérito Esportivo');
insert into PARTICIPACOES (cpf, participacao) values
('10793297222', 'Conselho do Prêmio Jovem Empreendedor');
insert into PARTICIPACOES (cpf, participacao) values
('10793297222', 'Corregedoria Parlamentar');
insert into PARTICIPACOES (cpf, participacao) values
('35120996531', 'Conselho da Comenda do Mérito Esportivo');
insert into PARTICIPACOES (cpf, participacao) values
('35120996531', 'Procuradoria Especial da Mulher');
insert into PARTICIPACOES (cpf, participacao) values
('35120996531', 'Conselho da Ordem do Congresso Nacional');
insert into PARTICIPACOES (cpf, participacao) values
('35120996531', 'Conselho de Comunicação Social');
insert into PARTICIPACOES (cpf, participacao) values
('47533744594', 'Conselho do Prêmio Jovem Empreendedor');
insert into PARTICIPACOES (cpf, participacao) values
('80136955819', 'Grupo Parlamentar Estados Unidos da América');
insert into PARTICIPACOES (cpf, participacao) values
('80136955819', 'Conselho da Comenda do Mérito Esportivo');
insert into PARTICIPACOES (cpf, participacao) values
('80136955819', 'Frente Parlamentar Mista Antirracismo');
insert into PARTICIPACOES (cpf, participacao) values
('63975831553', 'Frente Parlamentar da Rota das Emoções');
insert into PARTICIPACOES (cpf, participacao) values
('63975831553', 'Frente Parlamentar das Fronteiras Brasileiras');
insert into PARTICIPACOES (cpf, participacao) values
('10793297222', 'Frente Parlamentar de Recursos Naturais e Energia');
insert into PARTICIPACOES (cpf, participacao) values
('86650393681', 'Frente Parlamentar do Matopiba');
insert into PARTICIPACOES (cpf, participacao) values
('86650393681', 'Conselho da Comenda do Mérito Esportivo');
insert into PARTICIPACOES (cpf, participacao) values
('86650393681', 'Frente Parlamentar em Apoio ao Brasil Central');


-- INSERINDO SECRETARIAS
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('70125451784','SEB','Secretaria de Educação Básica');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('70125451784','SEPT','Secretaria de Educação Profissional e Tecnológica');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('62528710526','SNSP','Secretaria Nacional de Segurança Pública');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('62528710526','SGII','Secretaria de Gestão e Integração de Informações');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('02024348505','SPE','Secretaria de Política Econômica');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('02024348505','STN','Secretaria do Tesouro Nacional');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('58657563460','SE','Secretaria Executiva');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('58657563460','SAPS','Secretaria de Atenção Primária à Saúde');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('77864976760','SE','Secretaria Executiva');
insert into SECRETARIAS (cpf_ministro, sigla, nome) values
('77864976760','SPE','Secretaria de Planejamento e Desenvolvimento Energético');


-- INSERINDO AUTOR_LEIS
insert into AUTOR_LEIS (numero, autor) values
(982011, 'Guilherme Carlos Sebastião Costa');
insert into AUTOR_LEIS (numero, autor) values
(982011, 'Daniela Sônia Agatha Sales');
insert into AUTOR_LEIS (numero, autor) values
(982011, 'Marli Sandra da Paz');
insert into AUTOR_LEIS (numero, autor) values
(110283, 'Ricardo Lorenzo Melo');
insert into AUTOR_LEIS (numero, autor) values
(110283, 'Pedro Lucca Moreira');
insert into AUTOR_LEIS (numero, autor) values
(567490, 'Raquel Patrícia Barbosa');


-- INSERINDO ANALISA
insert into ANALISA (numero, cpf_exec, data_analisa, resultado) values
(654321, '95307699034', '15-09-2016', 'aprovado');
insert into ANALISA (numero, cpf_exec, data_analisa, resultado) values
( 987456, '95307699034', '26-04-2020', 'aprovado');
insert into ANALISA (numero, cpf_exec, data_analisa, resultado) values
( 159753, '95307699034', '19-10-2012', 'APROVADO');
insert into ANALISA (numero, cpf_exec, data_analisa, resultado) values
( 123456, '95307699034', '11-08-2018', 'NEGADO');


-- INSERINDO LEIS
insert into LEI (numero, data_publicacao, numero_pl, cpf_exec) values
(982011, '01-10-2016', 654321, '95307699034');
insert into LEI (numero, data_publicacao, numero_pl, cpf_exec) values
(110283, '15-05-2020', 987456, '95307699034');
insert into LEI (numero, data_publicacao, numero_pl, cpf_exec) values
(567490, '20-12-2012', 159753, '95307699034');


-- INSERINDO CRIA
insert into CRIA (cpf, numero) values
('53485723738', 123456);
insert into CRIA (cpf, numero) values
('53485723738', 654321);
insert into CRIA (cpf, numero) values
('53485723738', 147852);
insert into CRIA (cpf, numero) values
('53485723738', 369852);
insert into CRIA (cpf, numero) values
('53485723738', 987456);
insert into CRIA (cpf, numero) values
('53485723738', 369147);
insert into CRIA (cpf, numero) values
('53485723738', 852654);
insert into CRIA (cpf, numero) values
('53485723738', 159753);
insert into CRIA (cpf, numero) values
('53485723738', 852987);
insert into CRIA (cpf, numero) values
('53485723738', 654789);


-- INSERINDO VOTA
insert into VOTA (tit_eleitor, cpf, registro) values
('147852369789', '80136955819', '2022-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('321654987987', '53485723738', '1994-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('321321321321', '95307699034', '1990-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('147852258741', '10793297222', '2020-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('357357357357', '83714792988', '2018-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('369369369369', '53485723738', '1998-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('852546951753', '92544443910', '2004-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('258789987852', '37379326627', '2000-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('159159159159', '71019001194', '1994-10-04');
insert into VOTA (tit_eleitor, cpf, registro) values
('987456321147', '35120996531', '1968-10-04');


-- INSERINDO TRAMITA
insert into TRAMITA (numero, tipo_camara, data_tramita, resultado) values
(654321, 'deputados', '15-02-2016', 'aprovado');
insert into TRAMITA (numero, tipo_camara, data_tramita, resultado) values
(987456, 'senadores', '20-01-2020', 'aprovado');
insert into TRAMITA (numero, tipo_camara, data_tramita, resultado) values
(159753, 'senadores', '19-08-2012', 'aprovado');
insert into TRAMITA (numero, tipo_camara, data_tramita, resultado) values
(123456, 'deputados', '11-01-2018', 'aprovado');
insert into TRAMITA (numero, tipo_camara, data_tramita, resultado) values
(369852, 'senadores', '09-05-2019', 'negado');



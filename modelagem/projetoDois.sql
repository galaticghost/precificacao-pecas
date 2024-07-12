CREATE SEQUENCE sessao_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE sessao (
	id BIGINT NOT NULL DEFAULT NEXTVAL('sessao_id_seq') PRIMARY KEY,
	nome_sessao VARCHAR(255) NOT NULL,
	data_cadastro_sessao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ativo (
	id BIGINT NOT NULL PRIMARY KEY,
	status VARCHAR(20) NOT NULL
);

CREATE SEQUENCE usuario_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE usuario (
	id BIGINT NOT NULL DEFAULT NEXTVAL('usuario_id_seq') PRIMARY KEY,
	ativo BIGINT NOT NULL,
	nome_usuario VARCHAR(255) NOT NULL,
	email_usuario VARCHAR(255) NOT NULL,
	login_usuario VARCHAR(255) NOT NULL,
	senha_usuario VARCHAR(255) NOT NULL,
	data_cadastro_usuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	telefone_usuario VARCHAR(40) NOT NULL,
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE perfil_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE perfil(
	id BIGINT NOT NULL DEFAULT NEXTVAL('perfil_id_seq') PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	nome_perfil VARCHAR(255) NOT NULL,
	data_cadastro_perfil TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE forma_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE forma_atendimento(
	id BIGINT NOT NULL DEFAULT NEXTVAL('forma_id_seq') PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	nome_atendimento VARCHAR(255) NOT NULL,
	data_cadastro_atendimento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE publico_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE publico(
	id BIGINT NOT NULL DEFAULT NEXTVAL('publico_id_seq') PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	nome_publico VARCHAR(255) NOT NULL,
	data_cadastro_publico TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE perfilsessao_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE perfil_sessao(
	id BIGINT NOT NULL DEFAULT NEXTVAL('perfilsessao_id_seq') PRIMARY KEY,
	id_perfil BIGINT NOT NULL,
	id_sessao BIGINT NOT NULL,
	FOREIGN KEY (id_perfil) REFERENCES perfil(id),
	FOREIGN KEY (id_sessao) REFERENCES sessao(id)
);

CREATE SEQUENCE pergunta_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE pergunta_publico(
	id BIGINT NOT NULL DEFAULT NEXTVAL('pergunta_id_seq') PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	id_publico BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	descricao_pergunta TEXT NOT NULL,
	data_cadastro_pergunta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (id_publico) REFERENCES publico(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE atendimento_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE atendimento(
	id BIGINT NOT NULL DEFAULT NEXTVAL('atendimento_id_seq') PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	id_forma BIGINT NOT NULL,
	id_pergunta BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	resposta_atendimento TEXT NOT NULL,
	data_cadastro_perfil TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (id_forma) REFERENCES forma_atendimento(id),
	FOREIGN KEY (id_pergunta) REFERENCES pergunta_publico(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

INSERT INTO ativo(id,status) VALUES (1,'Sim'),(2,'Não');

INSERT INTO usuario(ativo,nome_usuario,email_usuario,login_usuario,senha_usuario,telefone_usuario)
VALUES (1,'Carlos Eduardo Bonel Dias','Carloseduardoboneldias@gmail.com','carloseduardo7854',
'26a6d15d8c21c99dc6455f7831741db4','98922-4922'), (2,'Junior Moraes','juniormoraes@hotmail.com','juninhoCaminhão',
'bc7eb72b23843b8900446b07884db675','90483-0231'), (1,'Leonardo Loreto Machado','LeonardoMachado@gmail.com',
'dominik','25f9e794323b453885f5181f1b624d0b','98213-3921');

INSERT INTO forma_atendimento(id_usuario,ativo,nome_atendimento) VALUES (1,1,'whatsapp'),(2,2,'E-mail'),(3,1,'Presencial');

INSERT INTO perfil(id_usuario,ativo,nome_perfil) VALUES (1,1,'Empregador'),(2,2,'Trabalhador'),(3,1,'Trabalhador');

INSERT INTO sessao(nome_sessao) VALUES ('jisd382'),('sdjn482'),('jifo921');

INSERT INTO perfil_sessao(id_perfil,id_sessao) VALUES (1,1),(2,2),(3,3);

INSERT INTO publico(id_usuario,ativo,nome_publico) VALUES (1,1,'Público'),(2,2,'Privado'),(3,1,'Público');

INSERT INTO pergunta_publico(id_publico,id_usuario,ativo,descricao_pergunta) VALUES (1,1,1,'bla'),(2,2,2,'blabla'),
(3,3,1,'blablabla');

INSERT INTO atendimento(id_forma,id_pergunta,id_usuario,ativo,resposta_atendimento) VALUES(1,1,1,1,'blabla'),(2,2,2,2,'bla'),
(3,3,3,1,'blablablabla');
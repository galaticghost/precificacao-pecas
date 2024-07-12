CREATE TABLE ativo (
	id BIGINT NOT NULL PRIMARY KEY,
	status VARCHAR (20) NOT NULL
);

CREATE SEQUENCE ativo_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE ativo ALTER COLUMN id SET DEFAULT NEXTVAL('ativo_id_seq');

INSERT INTO ativo(status) VALUES ('Sim'),('Não');

CREATE TABLE perfil (
	id BIGINT NOT NULL PRIMARY KEY,
	ativo BIGINT NOT NULL,
	nome_perfil VARCHAR(200) NOT NULL,
	data_cadastro_perfil TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE perfil_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE perfil ALTER COLUMN id SET DEFAULT NEXTVAL('perfil_id_seq');

CREATE TABLE sessao (
	id BIGINT NOT NULL PRIMARY KEY,
	nome_sessao VARCHAR(200) NOT NULL,
	data_cadastro_sessao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE sessao_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE sessao ALTER COLUMN id SET DEFAULT NEXTVAL('sessao_id_seq');

CREATE TABLE perfil_sessao (
	id BIGINT NOT NULL PRIMARY KEY,
	id_perfil BIGINT NOT NULL,
	id_sessao BIGINT NOT NULL,
	FOREIGN KEY (id_perfil) REFERENCES perfil(id)
);

CREATE SEQUENCE perfil_sessao_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE perfil_sessao ALTER COLUMN id SET DEFAULT NEXTVAL('perfil_sessao_id_seq');

CREATE TABLE usuario (
	id BIGINT NOT NULL PRIMARY KEY,
	id_perfil BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	nome_usuario VARCHAR(200) NOT NULL,
	email_usuario VARCHAR(200) NOT NULL,
	login_usuario VARCHAR(200) NOT NULL,
	senha_usuario VARCHAR(200) NOT NULL,
	data_cadastro_usuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_perfil) REFERENCES perfil(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE usuario_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE usuario ALTER COLUMN id SET DEFAULT NEXTVAL('usuario_id_seq');

CREATE TABLE base (
	id BIGINT NOT NULL PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	nome_base VARCHAR(100) NOT NULL,
	data_cadastro_base TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	responsavel_base VARCHAR(200) NOT NULL,
	telefone_base VARCHAR(40) NOT NULL,
	celular_base VARCHAR(40) NOT NULL,
	email_base VARCHAR(200) NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE base_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE base ALTER COLUMN id SET DEFAULT NEXTVAL('base_id_seq');

CREATE TABLE credor (
	id BIGINT NOT NULL PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	nome_credor VARCHAR(200) NOT NULL,
	data_cadastro_credor TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	telefone_credor VARCHAR(40) NOT NULL,
	celular_credor VARCHAR(40) NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE credor_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE credor ALTER COLUMN id SET DEFAULT NEXTVAL('credor_id_seq');

CREATE TABLE despesa (
	id BIGINT NOT NULL PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	id_credor BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	nome_despesa VARCHAR(200) NOT NULL,
	data_cadastro_despesa TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_credor) REFERENCES credor(id),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE despesa_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE despesa ALTER COLUMN id SET DEFAULT NEXTVAL('despesa_id_seq');

CREATE TABLE lancamento (
	id BIGINT NOT NULL PRIMARY KEY,
	id_usuario BIGINT NOT NULL,
	id_base BIGINT NOT NULL,
	id_despesa BIGINT NOT NULL,
	ativo BIGINT NOT NULL,
	data_vencimento DATE NOT NULL,
	valor_liquido NUMERIC(10,2) NOT NULL,
	valor_multa NUMERIC(10,2) DEFAULT 0 ,
	valor_correcao NUMERIC(10,2) NOT NULL ,
	observacao TEXT,
	data_cadastro_lancamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_base) REFERENCES base(id),
	FOREIGN KEY (id_despesa) REFERENCES despesa(id),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	FOREIGN KEY (ativo) REFERENCES ativo(id)
);

CREATE SEQUENCE lancamento_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE lancamento ALTER COLUMN id SET DEFAULT NEXTVAL('lancamento_id_seq');

INSERT INTO perfil(ativo,nome_perfil) VALUES (1,'Microempreendedor'),(1,'Trabalhador'),(1,'Empresa');

INSERT INTO usuario(id_perfil,ativo,nome_usuario,email_usuario,login_usuario,senha_usuario) VALUES
(2,1,'Carlos Eduardo Bonel Dias','carloseduardoboneldias@gmail.com','Carloseduardo','26a6d15d8c21c99dc6455f7831741db4'),
(3,1,'João Teste da Silva','joaotestedasilva@gmail.com','JoaoTeste','25f9e794323b453885f5181f1b624d0b'),
(3,2,'Leonardo Loreto Machado','leozinho123@gmail.com','dominik','ef6b09a0f94320d8d33435de538b8690');

INSERT INTO credor(id_usuario,ativo,nome_credor,telefone_credor,celular_credor) VALUES 
(1,1,'Companhia Estadual de Energia Elétrica','93783-2931','Xiaomi'), 
(2,1,'Companhia Estadual de Energia Elétrica','93783-2931','Xiaomi'), 
(3,2,'Oi S/A','98922-0922','Samsung');

INSERT INTO despesa(id_usuario,id_credor,ativo,nome_despesa) 
VALUES (1,1,1,'Energia Elétrica'),(2,2,1,'Energia Elétrica'),(3,3,2,'Telefone Fixo');

INSERT INTO base(id_usuario,ativo,nome_base,responsavel_base,telefone_base,celular_base,email_base)
VALUES (1,1,'SINE - CANGUÇU','Junior Moraes','94733-2783','Xiaomi','sine@ceee.com.br'), 
(2,1,'SINE - CANGUÇU','Junior Moraes','94733-2783','Xiaomi','sine@ceee.com.br'),
(3,2,'CASA DO ARTESÃO - POA','Junior Junior Morais','99345-4353','Samsung','casadoartesao@oi.com.br');

INSERT INTO sessao(nome_sessao) VALUES ('fduh327'),('jime984'),('sdjw842');

INSERT INTO perfil_sessao(id_perfil,id_sessao) VALUES (1,1),(2,2),(3,3);

INSERT INTO lancamento(id_usuario,id_base,id_despesa,ativo,data_vencimento,valor_liquido,
valor_multa,valor_correcao,observacao) VALUES (1,1,1,1,'2024-08-02',302,48,51,'Atrasado'),
(2,2,2,1,'2024-07-30',352,null,32,), (3,3,3,2,'2023-12-12',493,null,84,null);
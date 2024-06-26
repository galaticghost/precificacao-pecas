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


INSERT INTO ativo(id,status) VALUES (1,'Sim'),(2,'Não')

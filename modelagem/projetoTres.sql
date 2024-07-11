CREATE SEQUENCE cv_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE custos_variaveis (
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('cv_id_seq'),
	total_parcial NUMERIC(10,2) NOT NULL,
    valor_embalagem NUMERIC(10,2) NOT NULL,
    pecas_embalagem BIGINT NOT NULL,
    valor_cartoes NUMERIC(10,2) NOT NULL,
    pecas_cartoes BIGINT NOT NULL,
    valor_etiquetas NUMERIC(10,2) NOT NULL,
    pecas_etiquetas BIGINT NOT NULL,
    valor_frete NUMERIC(10,2) NOT NULL,
    pecas_frete BIGINT NOT NULL,
    valor_outros NUMERIC(10,2) DEFAULT 0,
    pecas_outros BIGINT DEFAULT 1,
    valor_total NUMERIC(10,2) NOT NULL
);

CREATE SEQUENCE material_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE material (
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('material_id_seq'),
	id_custos_variaveis BIGINT NOT NULL,
    material VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    pecas INT NOT NULL,
	FOREIGN KEY (id_custos_variaveis) REFERENCES custos_variaveis(id)
);

CREATE SEQUENCE ht_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE horas_trabalhadas (
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('ht_id_seq'),
    numero_horas BIGINT NOT NULL DEFAULT 1,
    salario_desejado NUMERIC(10,2) NOT NULL DEFAULT 0,
    valor_hora NUMERIC(10,2) NOT NULL,
	valor_total_horas NUMERIC(10,2) NOT NULL
);

CREATE SEQUENCE cf_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE custos_fixos (
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('cf_id_seq'),
    aluguel NUMERIC(10,2) NOT NULL,
    agua NUMERIC(10,2) NOT NULL,
    luz NUMERIC(10,2) NOT NULL,
    telefone NUMERIC(10,2) NOT NULL,
    internet NUMERIC(10,2) NOT NULL,
    iptu NUMERIC(10,2) NOT NULL,
    valor_outros NUMERIC(10,2) NOT NULL,
    valor_parcial NUMERIC(10,2) NOT NULL,
    pecas_produzida_mes BIGINT DEFAULT 1,
    valor_total NUMERIC(10,2) NOT NULL
);

CREATE SEQUENCE of_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE outros_fixos (
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('of_id_seq'),
    id_custos_fixos BIGINT NOT NULL,
    custo_fixo VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
	FOREIGN KEY (id_custos_fixos) REFERENCES custos_fixos(id)
);

CREATE SEQUENCE usuario_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE usuario (
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('usuario_id_seq'),
	id_estado BIGINT NOT NULL,
	id_perfil BIGINT NOT NULL,
	nome_usuario VARCHAR(255) NOT NULL,
    login_usuario VARCHAR(200) NOT NULL,
    senha_usuario VARCHAR(200) NOT NULL,
    email_usuario VARCHAR(200) NOT NULL,
    endereco TEXT NOT NULL,
    municipio VARCHAR(200) NOT NULL,
	FOREIGN KEY (id_estado) REFERENCES estado(id),
	FOREIGN KEY (id_perfil) REFERENCES perfil(id)
);


CREATE SEQUENCE venda_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE venda(
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('venda_id_seq'),
    id_custos_variaveis BIGINT NOT NULL,
    id_horas_trabalhadas BIGINT NOT NULL,
	id_custos_fixos BIGINT NOT NULL,
    id_usuario BIGINT NOT NULL,
    total_parcial NUMERIC(10,2) NOT NULL,
    margem_lucro BIGINT DEFAULT 0,
    despesas_comercializacao BIGINT DEFAULT 0,
    total_venda NUMERIC(10,2) NOT NULL,
	FOREIGN KEY (id_custos_variaveis) REFERENCES custos_variaveis(id),    
	FOREIGN KEY (id_horas_trabalhadas) REFERENCES horas_trabalhadas(id),
	FOREIGN KEY (id_custos_fixos) REFERENCES custos_fixos(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE SEQUENCE estado_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE estado (
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('estado_id_seq'),
	estado VARCHAR(100) NOT NULL
);

CREATE SEQUENCE perfil_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE TABLE perfil(
	id BIGINT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('perfil_id_seq'),
	nome_perfil VARCHAR(255) NOT NULL
);




INSERT INTO perfil(nome_perfil) VALUES ('Artesão'),('Autônomo por CPF'),('Microempreendedor individual MEI');

INSERT INTO estado(id,estado) VALUES
(1, 'Acre'),
(2, 'Alagoas'),
(3, 'Amapá'),
(4, 'Amazonas'),
(5, 'Bahia'),
(6, 'Ceará'),
(7, 'Espírito Santo'),
(8, 'Goiás'),
(9, 'Maranhão'),
(10, 'Mato Grosso'),
(11, 'Mato Grosso do Sul'),
(12, 'Minas Gerais'),
(13, 'Pará'),
(14, 'Paraíba'),
(15, 'Paraná'),
(16, 'Pernambuco'),
(17, 'Piauí'),
(18, 'Rio de Janeiro'),
(19, 'Rio Grande do Norte'),
(20, 'Rio Grande do Sul'),
(21, 'Rondônia'),
(22, 'Santa Catarina'),
(23, 'São Paulo'),
(24, 'Sergipe'),
(25, 'Tocantins'),
(26, 'Distrito Federal'),
(27, 'Roraima');
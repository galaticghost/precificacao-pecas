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
    valor_total_material NUMERIC(10,2) NOT NULL,
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
    pecas_produzidas_mes BIGINT DEFAULT 1,
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

INSERT INTO custos_fixos (id, aluguel, agua, luz, telefone, internet, iptu, valor_outros, valor_parcial, pecas_produzidas_mes,valor_total) VALUES
(77, 500.00, 200.00, 200.00, 100.00, 100.00, 50.00, 300.00, 1450.00, 3, 483.33),
(78, 558.23, 232.32, 235.58, 102.24, 99.99, 321.00, 356.54, 1905.90, 4, 476.47),
(79, 750.54, 268.48, 212.34, 141.53, 199.99, 500.00, 200.00, 2272.88, 7, 324.70),
(80, 500.32, 200.42, 194.23, 102.23, 49.84, 250.00, 0.00, 1297.04, 3, 432.35);

INSERT INTO custos_variaveis (id, total_parcial, valor_embalagem, pecas_embalagem, valor_cartoes, pecas_cartoes, valor_etiquetas, pecas_etiquetas, valor_frete,pecas_frete, valor_outros, pecas_outros, valor_total) VALUES
(59, 26.50, 42.00, 2, 3.00, 55, 43.00, 3, 21.00, 4, 12.00, 2, 73.14),
(60, 2.05, 15.00, 4, 5.00, 30, 6.00, 4, 21.50, 4, 4.65, 2, 15.17),
(61, 8.08, 20.00, 7, 7.00, 24, 8.00, 7, 40.84, 7, 0.00, 1, 18.21),
(62, 1.33, 6.00, 3, 5.00, 20, 5.00, 12, 10.00, 3, 0.00, 1, 7.33);

INSERT INTO horas_trabalhadas (id, numero_horas, salario_desejado, valor_hora, valor_total_horas) VALUES
(75, 44, 1418, 8.06, 354.64),
(76, 44, 2180, 12.39, 545.16),
(77, 44, 3840, 21.82, 960.08),
(78, 40, 1418, 8.06, 322.4);

INSERT INTO material (id, id_custos_variaveis, material, valor, pecas, valor_total_material) VALUES
(83, 59, 'Madeira', 53.00, 2, 26.50),
(84, 60, 'Madeira', 12.20, 32, 0.38),
(85, 60, 'Pedra', 20.00, 12, 1.67),
(86, 61, 'Mármore', 23.40, 25, 0.94),
(87, 61, 'Quartzo', 50.00, 7, 7.14),
(88, 62, 'Madeira', 4.00, 3, 1.33);

INSERT INTO outros_fixos (id, id_custos_fixos,custo_fixo, valor) VALUES
(37, 77, 'Comida', 300.00),
(38, 78, 'Comida', 356.54),
(39, 79, 'Gasolina', 200.00);

INSERT INTO usuario (id, id_estado, id_perfil, nome_usuario, login_usuario, senha_usuario, email_usuario, endereco, municipio) VALUES
(1, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', 'carloseduardo7', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul'),
(2, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', '26a6d15d8c21c99dc6455f7831741db4', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul'),
(3, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', '202cb962ac59075b964b07152d234b70', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul');

INSERT INTO venda (id, id_custos_variaveis, id_horas_trabalhadas, id_custos_fixos, total_parcial, margem_lucro, despesas_comercializacao, total_venda, id_usuario) VALUES
(15, 59, 75, 77, 911.11, 4, 12, 1056.88, 3),
(16, 60, 76, 78, 1036.80, 20, 12, 1368.58, 3),
(17, 61, 77, 79, 1302.99, 38, 25, 2123.88, 3),
(18, 62, 78, 80, 762.08, 10, 2, 853.53, 3);
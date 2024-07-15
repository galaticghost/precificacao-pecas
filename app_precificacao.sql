-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Jul-2024 às 15:22
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `app_precificacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `custos_fixos`
--

CREATE TABLE `custos_fixos` (
  `id` bigint(20) NOT NULL,
  `aluguel` decimal(10,2) NOT NULL,
  `agua` decimal(10,2) NOT NULL,
  `luz` decimal(10,2) NOT NULL,
  `telefone` decimal(10,2) NOT NULL,
  `internet` decimal(10,2) NOT NULL,
  `iptu` decimal(10,2) NOT NULL,
  `valor_outros` decimal(10,2) NOT NULL,
  `valor_parcial` decimal(10,2) NOT NULL,
  `pecas_produzidas_mes` bigint(20) DEFAULT 1,
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `custos_fixos`
--

INSERT INTO `custos_fixos` (`id`, `aluguel`, `agua`, `luz`, `telefone`, `internet`, `iptu`, `valor_outros`, `valor_parcial`, `pecas_produzidas_mes`, `valor_total`) VALUES
(77, '500.00', '200.00', '200.00', '100.00', '100.00', '50.00', '300.00', '1450.00', 3, '483.33'),
(78, '558.23', '232.32', '235.58', '102.24', '99.99', '321.00', '356.54', '1905.90', 4, '476.47'),
(79, '750.54', '268.48', '212.34', '141.53', '199.99', '500.00', '200.00', '2272.88', 7, '324.70'),
(80, '500.32', '200.42', '194.23', '102.23', '49.84', '250.00', '0.00', '1297.04', 3, '432.35'),
(81, '536.00', '342.00', '324.00', '32.00', '23.00', '1.00', '2.00', '1260.00', 3, '420.00'),
(82, '500.00', '52.00', '25.00', '241.00', '32.00', '2.00', '3.00', '855.00', 6, '142.50'),
(83, '324.00', '532.00', '532.00', '32.00', '32.00', '2.00', '0.00', '1454.00', 3, '484.67'),
(84, '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '10.00', '40.00', 5, '8.00'),
(85, '5.00', '5.00', '5.00', '5.00', '5.00', '5.00', '10.00', '40.00', 5, '8.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `custos_variaveis`
--

CREATE TABLE `custos_variaveis` (
  `id` bigint(20) NOT NULL,
  `total_parcial` decimal(10,2) NOT NULL,
  `valor_embalagem` decimal(10,2) NOT NULL,
  `pecas_embalagem` bigint(20) NOT NULL,
  `valor_cartoes` decimal(10,2) NOT NULL,
  `pecas_cartoes` bigint(20) NOT NULL,
  `valor_etiquetas` decimal(10,2) NOT NULL,
  `pecas_etiquetas` bigint(20) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `pecas_frete` bigint(20) NOT NULL,
  `valor_outros` decimal(10,2) DEFAULT 0.00,
  `pecas_outros` bigint(20) DEFAULT 1,
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `custos_variaveis`
--

INSERT INTO `custos_variaveis` (`id`, `total_parcial`, `valor_embalagem`, `pecas_embalagem`, `valor_cartoes`, `pecas_cartoes`, `valor_etiquetas`, `pecas_etiquetas`, `valor_frete`, `pecas_frete`, `valor_outros`, `pecas_outros`, `valor_total`) VALUES
(59, '26.50', '42.00', 2, '3.00', 55, '43.00', 3, '21.00', 4, '12.00', 2, '73.14'),
(60, '2.05', '15.00', 4, '5.00', 30, '6.00', 4, '21.50', 4, '4.65', 2, '15.17'),
(61, '8.08', '20.00', 7, '7.00', 24, '8.00', 7, '40.84', 7, '0.00', 1, '18.21'),
(62, '1.33', '6.00', 3, '5.00', 20, '5.00', 12, '10.00', 3, '0.00', 1, '7.33'),
(63, '5.00', '30.00', 6, '40.00', 5, '346.00', 6, '43.00', 6, '45.00', 32, '84.24'),
(64, '32.66', '43.00', 5, '10.00', 6, '54.00', 54, '3.00', 3, '2.00', 2, '45.93'),
(65, '39.00', '76.00', 5, '75.00', 4, '54.00', 4, '34.00', 4, '3.00', 43, '95.02'),
(66, '1.00', '5.00', 5, '5.00', 5, '5.00', 5, '5.00', 5, '0.00', 1, '5.00'),
(67, '1.00', '5.00', 5, '5.00', 5, '5.00', 5, '5.00', 5, '0.00', 1, '5.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` bigint(20) NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `estado`) VALUES
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `horas_trabalhadas`
--

CREATE TABLE `horas_trabalhadas` (
  `id` bigint(20) NOT NULL,
  `numero_horas` bigint(20) NOT NULL DEFAULT 1,
  `salario_desejado` double NOT NULL DEFAULT 0,
  `valor_hora` double NOT NULL,
  `valor_total_horas` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `horas_trabalhadas`
--

INSERT INTO `horas_trabalhadas` (`id`, `numero_horas`, `salario_desejado`, `valor_hora`, `valor_total_horas`) VALUES
(75, 44, 1418, 8.06, 354.64),
(76, 44, 2180, 12.39, 545.16),
(77, 44, 3840, 21.82, 960.08),
(78, 40, 1418, 8.06, 322.4),
(79, 32, 1346, 7.65, 244.8),
(80, 44, 2028, 11.52, 506.88),
(81, 53, 1424, 8.09, 428.77),
(82, 5, 5, 0.03, 0.15),
(83, 5, 5, 0.03, 0.15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `material`
--

CREATE TABLE `material` (
  `id` bigint(20) NOT NULL,
  `id_custos_variaveis` bigint(20) NOT NULL,
  `material` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade_pecas` bigint(20) NOT NULL,
  `valor_total_material` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `material`
--

INSERT INTO `material` (`id`, `id_custos_variaveis`, `material`, `valor`, `quantidade_pecas`, `valor_total_material`) VALUES
(83, 59, 'Madeira', '53.00', 2, '26.50'),
(84, 60, 'Madeira', '12.20', 32, '0.38'),
(85, 60, 'Pedra', '20.00', 12, '1.67'),
(86, 61, 'Mármore', '23.40', 25, '0.94'),
(87, 61, 'Quartzo', '50.00', 7, '7.14'),
(88, 62, 'Madeira', '4.00', 3, '1.33'),
(89, 63, 'Madeira', '10.00', 2, '5.00'),
(90, 64, 'Madeira', '64.00', 3, '21.33'),
(91, 64, 'Pedra', '34.00', 3, '11.33'),
(92, 65, 'Madeira', '78.00', 2, '39.00'),
(93, 66, '5', '5.00', 5, '1.00'),
(94, 67, '5', '5.00', 5, '1.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `outros_fixos`
--

CREATE TABLE `outros_fixos` (
  `id` bigint(20) NOT NULL,
  `id_custos_fixos` bigint(20) NOT NULL,
  `custo_fixo` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `outros_fixos`
--

INSERT INTO `outros_fixos` (`id`, `id_custos_fixos`, `custo_fixo`, `valor`) VALUES
(37, 77, 'Comida', '300.00'),
(38, 78, 'Comida', '356.54'),
(39, 79, 'Gasolina', '200.00'),
(40, 81, 'Comida', '2.00'),
(41, 82, 'Pedra Azul', '3.00'),
(42, 84, '4', '5.00'),
(43, 84, '4', '5.00'),
(44, 85, '4', '5.00'),
(45, 85, '4', '5.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` bigint(20) NOT NULL,
  `nome_perfil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome_perfil`) VALUES
(1, 'Artesão'),
(2, 'Autônomo por CPF'),
(3, 'Microempreendedor individual MEI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `id_estado` bigint(20) NOT NULL,
  `id_perfil` bigint(20) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `login_usuario` varchar(200) NOT NULL,
  `senha_usuario` varchar(200) NOT NULL,
  `email_usuario` varchar(200) NOT NULL,
  `endereco` text NOT NULL,
  `municipio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `id_estado`, `id_perfil`, `nome_usuario`, `login_usuario`, `senha_usuario`, `email_usuario`, `endereco`, `municipio`) VALUES
(2, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', '26a6d15d8c21c99dc6455f7831741db4', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul'),
(3, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', '202cb962ac59075b964b07152d234b70', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul'),
(4, 20, 1, 'João Eduardo Rangel', 'João Eduardo', '81dc9bdb52d04dc20036dbd8313ed055', 'Bosta@gmail.com', 'rua 0 ', 'Cachoeira do Sul'),
(5, 20, 2, 'João Eduardo Rangel', 'JeRangel', '659515d082497fbd7abd0a84353b76e6', 'Bosta@gmail.com', 'Rua não sei', 'Cachoeira do Sul'),
(6, 20, 3, 'João Eduardo Steffanelo Rangel', 'jesr', '013f488108e5774cdd8d06d865d04aa8', 'Je@gmail.com', '794 Rua Aristídes Moreira', 'Cachoeira do Sul');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` bigint(20) NOT NULL,
  `id_custos_variaveis` bigint(20) NOT NULL,
  `id_horas_trabalhadas` bigint(20) NOT NULL,
  `id_custos_fixos` bigint(20) NOT NULL,
  `total_parcial` decimal(10,2) NOT NULL,
  `margem_lucro` bigint(20) DEFAULT 0,
  `despesas_comercializacao` bigint(20) DEFAULT 0,
  `total_venda` decimal(10,2) NOT NULL,
  `id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `id_custos_variaveis`, `id_horas_trabalhadas`, `id_custos_fixos`, `total_parcial`, `margem_lucro`, `despesas_comercializacao`, `total_venda`, `id_usuario`) VALUES
(15, 59, 75, 77, '911.11', 4, 12, '1056.88', 3),
(16, 60, 76, 78, '1036.80', 20, 12, '1368.58', 3),
(17, 61, 77, 79, '1302.99', 38, 25, '2123.88', 3),
(18, 62, 78, 80, '762.08', 10, 2, '853.53', 3),
(19, 63, 79, 81, '749.04', 30, 30, '1198.46', 3),
(20, 64, 80, 82, '695.31', 59, 23, '1265.46', 5),
(21, 65, 81, 83, '1008.46', 3, 3, '1068.96', 6),
(22, 66, 82, 84, '13.15', 5, 5, '14.47', 6),
(23, 67, 83, 85, '13.15', 5, 5, '14.47', 6);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `custos_fixos`
--
ALTER TABLE `custos_fixos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `custos_variaveis`
--
ALTER TABLE `custos_variaveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `horas_trabalhadas`
--
ALTER TABLE `horas_trabalhadas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCustosVariaveis` (`id_custos_variaveis`);

--
-- Índices para tabela `outros_fixos`
--
ALTER TABLE `outros_fixos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_custos_variaveis` (`id_custos_variaveis`),
  ADD KEY `id_horas_trabalhadas` (`id_horas_trabalhadas`),
  ADD KEY `id_custos_fixos` (`id_custos_fixos`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `custos_fixos`
--
ALTER TABLE `custos_fixos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `custos_variaveis`
--
ALTER TABLE `custos_variaveis`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `horas_trabalhadas`
--
ALTER TABLE `horas_trabalhadas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de tabela `material`
--
ALTER TABLE `material`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de tabela `outros_fixos`
--
ALTER TABLE `outros_fixos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`id_custos_variaveis`) REFERENCES `custos_variaveis` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_custos_variaveis`) REFERENCES `custos_variaveis` (`id`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`id_horas_trabalhadas`) REFERENCES `horas_trabalhadas` (`id`),
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`id_custos_fixos`) REFERENCES `custos_fixos` (`id`),
  ADD CONSTRAINT `venda_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

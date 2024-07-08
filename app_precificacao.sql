-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Jul-2024 às 16:22
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
(1, '500.00', '200.00', '100.00', '50.00', '25.00', '12.00', '1.00', '888.00', 3, '296.00'),
(2, '500.00', '200.00', '100.00', '50.00', '25.00', '12.00', '1.00', '888.00', 3, '296.00'),
(3, '500.00', '200.00', '100.00', '50.00', '25.00', '12.00', '1.00', '888.00', 3, '296.00'),
(4, '500.00', '200.00', '100.00', '50.00', '25.00', '12.00', '1.00', '888.00', 3, '296.00');

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
(4, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(5, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(6, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(7, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(8, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(9, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(10, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(11, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(12, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(13, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(14, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(15, '2.75', '3.00', 2, '2.00', 2, '2.00', 1, '3.00', 4, '4.00', 2, '13.00'),
(16, '4.10', '10.00', 3, '3.00', 30, '3.00', 30, '5.00', 30, '1.00', 2, '41.20'),
(17, '4.10', '10.00', 3, '3.00', 30, '3.00', 30, '5.00', 30, '1.00', 2, '41.20'),
(18, '4.10', '10.00', 3, '3.00', 30, '3.00', 30, '5.00', 30, '1.00', 2, '41.20'),
(19, '4.10', '10.00', 3, '3.00', 30, '3.00', 30, '5.00', 30, '1.00', 2, '41.20');

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
-- Estrutura da tabela `estado_id_seq`
--

CREATE TABLE `estado_id_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Extraindo dados da tabela `estado_id_seq`
--

INSERT INTO `estado_id_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1, 1, 9223372036854775806, 1, 1, 1, 0, 0);

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
(1, 1, 0, 0, 0);

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
(1, 15, 'Madeira', '3.00', 4, '0.00'),
(2, 15, 'Pedra', '4.00', 4, '0.00'),
(3, 15, 'Terra', '4.00', 4, '0.00'),
(4, 16, 'Madeira', '10.00', 5, '0.00'),
(5, 16, 'Pedra', '20.00', 10, '0.00'),
(6, 16, 'Terra', '2.00', 20, '0.00'),
(7, 17, 'Madeira', '10.00', 5, '0.00'),
(8, 17, 'Pedra', '20.00', 10, '0.00'),
(9, 17, 'Terra', '2.00', 20, '0.00'),
(10, 18, 'Madeira', '10.00', 5, '0.00'),
(11, 18, 'Pedra', '20.00', 10, '0.00'),
(12, 18, 'Terra', '2.00', 20, '0.00'),
(13, 19, 'Madeira', '10.00', 5, '0.00'),
(14, 19, 'Pedra', '20.00', 10, '0.00'),
(15, 19, 'Terra', '2.00', 20, '0.00');

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
(1, 4, 'Comida', '1.00');

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
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `custos_fixos`
--
ALTER TABLE `custos_fixos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `custos_variaveis`
--
ALTER TABLE `custos_variaveis`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `horas_trabalhadas`
--
ALTER TABLE `horas_trabalhadas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `material`
--
ALTER TABLE `material`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `outros_fixos`
--
ALTER TABLE `outros_fixos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`id_custos_variaveis`) REFERENCES `custos_variaveis` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

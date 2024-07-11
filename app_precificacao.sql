-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/07/2024 às 19:44
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
-- Estrutura para tabela `custos_fixos`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `custos_fixos`
--

INSERT INTO `custos_fixos` (`id`, `aluguel`, `agua`, `luz`, `telefone`, `internet`, `iptu`, `valor_outros`, `valor_parcial`, `pecas_produzidas_mes`, `valor_total`) VALUES
(77, 500.00, 200.00, 200.00, 100.00, 100.00, 50.00, 300.00, 1450.00, 3, 483.33);

-- --------------------------------------------------------

--
-- Estrutura para tabela `custos_variaveis`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `custos_variaveis`
--

INSERT INTO `custos_variaveis` (`id`, `total_parcial`, `valor_embalagem`, `pecas_embalagem`, `valor_cartoes`, `pecas_cartoes`, `valor_etiquetas`, `pecas_etiquetas`, `valor_frete`, `pecas_frete`, `valor_outros`, `pecas_outros`, `valor_total`) VALUES
(59, 26.50, 42.00, 2, 3.00, 55, 43.00, 3, 21.00, 4, 12.00, 2, 73.14);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `id` bigint(20) NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estado`
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
-- Estrutura para tabela `horas_trabalhadas`
--

CREATE TABLE `horas_trabalhadas` (
  `id` bigint(20) NOT NULL,
  `numero_horas` bigint(20) NOT NULL DEFAULT 1,
  `salario_desejado` double NOT NULL DEFAULT 0,
  `valor_hora` double NOT NULL,
  `valor_total_horas` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `horas_trabalhadas`
--

INSERT INTO `horas_trabalhadas` (`id`, `numero_horas`, `salario_desejado`, `valor_hora`, `valor_total_horas`) VALUES
(75, 44, 1418, 8.06, 354.64);

-- --------------------------------------------------------

--
-- Estrutura para tabela `material`
--

CREATE TABLE `material` (
  `id` bigint(20) NOT NULL,
  `id_custos_variaveis` bigint(20) NOT NULL,
  `material` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade_pecas` bigint(20) NOT NULL,
  `valor_total_material` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `material`
--

INSERT INTO `material` (`id`, `id_custos_variaveis`, `material`, `valor`, `quantidade_pecas`, `valor_total_material`) VALUES
(83, 59, 'Madeira', 53.00, 2, 26.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `outros_fixos`
--

CREATE TABLE `outros_fixos` (
  `id` bigint(20) NOT NULL,
  `id_custos_fixos` bigint(20) NOT NULL,
  `custo_fixo` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `outros_fixos`
--

INSERT INTO `outros_fixos` (`id`, `id_custos_fixos`, `custo_fixo`, `valor`) VALUES
(37, 77, 'Comida', 300.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` bigint(20) NOT NULL,
  `nome_perfil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome_perfil`) VALUES
(1, 'Artesão'),
(2, 'Autônomo por CPF'),
(3, 'Microempreendedor individual MEI');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `id_estado`, `id_perfil`, `nome_usuario`, `login_usuario`, `senha_usuario`, `email_usuario`, `endereco`, `municipio`) VALUES
(1, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', 'carloseduardo7', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul'),
(2, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', '26a6d15d8c21c99dc6455f7831741db4', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul'),
(3, 20, 3, 'Carlos Eduardo Bonel Dias', 'Carloseduardo', '202cb962ac59075b964b07152d234b70', 'carloseduardoboneldias@gmail.com', 'rua 0', 'Cachoeira do Sul');

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `venda`
--

INSERT INTO `venda` (`id`, `id_custos_variaveis`, `id_horas_trabalhadas`, `id_custos_fixos`, `total_parcial`, `margem_lucro`, `despesas_comercializacao`, `total_venda`, `id_usuario`) VALUES
(15, 59, 75, 77, 911.11, 4, 12, 1056.88, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `custos_fixos`
--
ALTER TABLE `custos_fixos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `custos_variaveis`
--
ALTER TABLE `custos_variaveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `horas_trabalhadas`
--
ALTER TABLE `horas_trabalhadas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCustosVariaveis` (`id_custos_variaveis`);

--
-- Índices de tabela `outros_fixos`
--
ALTER TABLE `outros_fixos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_custos_variaveis` (`id_custos_variaveis`),
  ADD KEY `id_horas_trabalhadas` (`id_horas_trabalhadas`),
  ADD KEY `id_custos_fixos` (`id_custos_fixos`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `custos_fixos`
--
ALTER TABLE `custos_fixos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de tabela `custos_variaveis`
--
ALTER TABLE `custos_variaveis`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `horas_trabalhadas`
--
ALTER TABLE `horas_trabalhadas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de tabela `material`
--
ALTER TABLE `material`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de tabela `outros_fixos`
--
ALTER TABLE `outros_fixos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`id_custos_variaveis`) REFERENCES `custos_variaveis` (`id`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_custos_variaveis`) REFERENCES `custos_variaveis` (`id`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`id_horas_trabalhadas`) REFERENCES `horas_trabalhadas` (`id`),
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`id_custos_fixos`) REFERENCES `custos_fixos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

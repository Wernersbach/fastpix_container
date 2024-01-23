-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 23/01/2024 às 11:50
-- Versão do servidor: 8.0.35-0ubuntu0.22.04.1
-- Versão do PHP: 7.2.34-43+ubuntu22.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fastpix`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id` int NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `validadesenha` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  `celular` varchar(14) NOT NULL,
  `status` int NOT NULL COMMENT '0- inativo 1-ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cadastro`
--

INSERT INTO `cadastro` (`id`, `cpf`, `senha`, `validadesenha`, `nome`, `celular`, `status`) VALUES
(1, '519.634.852-20', '827ccb0eea8a706c4c34a16891f84e7b', '2024-01-23', 'ORÊNCIO COUTINHO JÚNIOR', '(91)99114-6282', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estacionamento`
--

CREATE TABLE `estacionamento` (
  `id` int NOT NULL,
  `evento` int NOT NULL,
  `cliente` int NOT NULL COMMENT 'tabela cadastro',
  `tipo` int NOT NULL COMMENT '1-carro 2-moto',
  `valPago` decimal(10,2) NOT NULL,
  `datapg` date NOT NULL,
  `idpagamento` varchar(255) NOT NULL COMMENT 'resposta da plataforma de pagaqmento',
  `status` int NOT NULL COMMENT '0-aguardando pg 1-pago',
  `setor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'tabela setor estacionamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estacionamento_setor`
--

CREATE TABLE `estacionamento_setor` (
  `id` int NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `estacionamento_setor`
--

INSERT INTO `estacionamento_setor` (`id`, `descricao`) VALUES
(1, 'LADO A (Aug. Montenegro)'),
(2, 'LADO B (IML)');

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento`
--

CREATE TABLE `evento` (
  `id` int NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `status` int NOT NULL COMMENT '0- inativo 1-ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `evento`
--

INSERT INTO `evento` (`id`, `descricao`, `data`, `status`) VALUES
(1, 'TAPAJÓS x REMO (MANGUEIRÃO)', '2024-01-28', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingresso`
--

CREATE TABLE `ingresso` (
  `id` int NOT NULL,
  `evento` int NOT NULL,
  `tipo` int NOT NULL COMMENT 'tabela tipo ingresso',
  `cliente` int NOT NULL,
  `datapg` datetime NOT NULL,
  `idPagamento` varchar(255) NOT NULL COMMENT 'retorno plataforma de pagamento',
  `valorPagamento` decimal(10,2) DEFAULT NULL,
  `codigo` varchar(255) NOT NULL COMMENT 'codigo do ingresso',
  `status` int NOT NULL COMMENT '0- aguardando pg 1- pago',
  `dataBaixa` datetime DEFAULT NULL COMMENT 'data que foi usado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ingresso`
--

INSERT INTO `ingresso` (`id`, `evento`, `tipo`, `cliente`, `datapg`, `idPagamento`, `valorPagamento`, `codigo`, `status`, `dataBaixa`) VALUES
(1, 1, 1, 1, '2024-01-22 12:57:05', ' zfas fsdfds fasdfasdfasdfsfdasdfas23df1as6d5f4', 0.00, '12341234reew2421ewr2452345', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_ingresso`
--

CREATE TABLE `tipo_ingresso` (
  `id` int NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `evento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tipo_ingresso`
--

INSERT INTO `tipo_ingresso` (`id`, `descricao`, `valor`, `evento`) VALUES
(1, 'ARQUIBANCADA INTEIRA', 30.00, 1),
(2, 'ARQUIBANCADA MEIA', 15.00, 1),
(3, 'SÓCIO TORCEDOR REMO', 0.00, 1),
(4, 'CAMAROTE', 50.00, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `estacionamento`
--
ALTER TABLE `estacionamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `estacionamento_setor`
--
ALTER TABLE `estacionamento_setor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipo_ingresso`
--
ALTER TABLE `tipo_ingresso`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `estacionamento`
--
ALTER TABLE `estacionamento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estacionamento_setor`
--
ALTER TABLE `estacionamento_setor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ingresso`
--
ALTER TABLE `ingresso`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tipo_ingresso`
--
ALTER TABLE `tipo_ingresso`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

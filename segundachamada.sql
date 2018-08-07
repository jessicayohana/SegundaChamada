-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Ago-2018 às 23:44
-- Versão do servidor: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `segundachamada`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula_aluno` int(12) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `senha` varchar(80) DEFAULT NULL,
  `nome` tinytext,
  `turma` varchar(80) DEFAULT NULL,
  `cod_turma` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`matricula_aluno`, `email`, `senha`, `nome`, `turma`, `cod_turma`) VALUES
(2018, 'guilherme@gmail.com', '123456', 'guilherme', NULL, NULL),
(12345, 'jessica@gmail.com', '987654321', 'jessica', NULL, NULL),
(23765, 'yohana@otto.com', '246810', 'yohana', NULL, NULL),
(201908, 'lucas@gmail.com', 'banana', 'lucas', NULL, NULL),
(20187345, 'jair@gmail.com', '67576779', 'jair', NULL, NULL),
(20197654, 'lilian@gmail.com', 'mae', 'lilian', NULL, NULL),
(23452478, 'rex@gmail.com', 'ijiuy78y', 'rex', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordenador`
--

CREATE TABLE `coordenador` (
  `cod_coordenador` int(12) NOT NULL,
  `nome` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `cod_curso` int(12) NOT NULL,
  `nome` tinytext,
  `cod_coordenador` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `nome` tinytext,
  `cod_disciplina` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina_pedido`
--

CREATE TABLE `disciplina_pedido` (
  `cod_disciplina` int(12) DEFAULT NULL,
  `cod_pedido` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina_turma`
--

CREATE TABLE `disciplina_turma` (
  `cod_disciplina` int(12) DEFAULT NULL,
  `cod_turma` int(12) DEFAULT NULL,
  `cod_coordenador` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `curso` varchar(12) NOT NULL,
  `turma` varchar(12) NOT NULL,
  `disciplina` varchar(12) NOT NULL,
  `professor` varchar(12) NOT NULL,
  `data` varchar(12) NOT NULL,
  `motivo` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`curso`, `turma`, `disciplina`, `professor`, `data`, `motivo`) VALUES
('informatica', 'terceirao', 'matematica', 'lui', '12092012', 'fecre'),
('Quimica', 'quarto', 'quimica', 'elder', '12032012', 'naosei'),
('Quimica', 'quarto', 'quimica', 'elder', '12032012', 'naosei'),
('Quimica', 'quarto', 'quimica', 'elder', '12032012', 'naosei');

-- --------------------------------------------------------

--
-- Estrutura da tabela `segunda_chamada`
--

CREATE TABLE `segunda_chamada` (
  `cod_pedido` int(12) DEFAULT NULL,
  `cod_disciplina` int(12) DEFAULT NULL,
  `cod_coordenador` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cod_turma` int(12) NOT NULL,
  `nome` tinytext,
  `curso` varchar(80) DEFAULT NULL,
  `ano` int(12) DEFAULT NULL,
  `cod_curso` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula_aluno`),
  ADD KEY `fk_turma` (`cod_turma`);

--
-- Indexes for table `coordenador`
--
ALTER TABLE `coordenador`
  ADD PRIMARY KEY (`cod_coordenador`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cod_curso`),
  ADD KEY `fk_coordenador` (`cod_coordenador`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`cod_disciplina`);

--
-- Indexes for table `disciplina_pedido`
--
ALTER TABLE `disciplina_pedido`
  ADD KEY `fk_disciplina` (`cod_disciplina`),
  ADD KEY `fk_pedido` (`cod_pedido`);

--
-- Indexes for table `disciplina_turma`
--
ALTER TABLE `disciplina_turma`
  ADD KEY `fk_disciplinas` (`cod_disciplina`),
  ADD KEY `fk_turmas` (`cod_turma`),
  ADD KEY `fk_coordenadores` (`cod_coordenador`);

--
-- Indexes for table `segunda_chamada`
--
ALTER TABLE `segunda_chamada`
  ADD KEY `fk_pedidosss` (`cod_pedido`),
  ADD KEY `fk_disciplinasss` (`cod_disciplina`),
  ADD KEY `fk_coordenadoresss` (`cod_coordenador`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cod_turma`),
  ADD KEY `fk_curso` (`cod_curso`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_turma` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_coordenador` FOREIGN KEY (`cod_coordenador`) REFERENCES `coordenador` (`cod_coordenador`);

--
-- Limitadores para a tabela `disciplina_pedido`
--
ALTER TABLE `disciplina_pedido`
  ADD CONSTRAINT `fk_disciplina` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`),
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`cod_pedido`) REFERENCES `pedidofabio` (`cod_pedido`);

--
-- Limitadores para a tabela `disciplina_turma`
--
ALTER TABLE `disciplina_turma`
  ADD CONSTRAINT `fk_coordenadores` FOREIGN KEY (`cod_coordenador`) REFERENCES `coordenador` (`cod_coordenador`),
  ADD CONSTRAINT `fk_disciplinas` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`),
  ADD CONSTRAINT `fk_turmas` FOREIGN KEY (`cod_turma`) REFERENCES `turma` (`cod_turma`);

--
-- Limitadores para a tabela `segunda_chamada`
--
ALTER TABLE `segunda_chamada`
  ADD CONSTRAINT `fk_coordenadoresss` FOREIGN KEY (`cod_coordenador`) REFERENCES `coordenador` (`cod_coordenador`),
  ADD CONSTRAINT `fk_disciplinasss` FOREIGN KEY (`cod_disciplina`) REFERENCES `disciplina` (`cod_disciplina`),
  ADD CONSTRAINT `fk_pedidosss` FOREIGN KEY (`cod_pedido`) REFERENCES `pedidofabio` (`cod_pedido`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_curso` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

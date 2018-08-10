-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Ago-2018 às 01:07
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
-- Estrutura da tabela `admin_pedido`
--

CREATE TABLE `admin_pedido` (
  `id_pedido` int(50) DEFAULT NULL,
  `id_tip_admin` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_turma`
--

CREATE TABLE `aluno_turma` (
  `id_turma` int(50) DEFAULT NULL,
  `id_tip_aluno` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coord_curso`
--

CREATE TABLE `coord_curso` (
  `id_tip_coord` int(50) DEFAULT NULL,
  `id_curso` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coord_pedido`
--

CREATE TABLE `coord_pedido` (
  `id_pedido` int(50) DEFAULT NULL,
  `id_tip_coord` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(50) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `id_disc` int(50) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina_turma`
--

CREATE TABLE `disciplina_turma` (
  `id_disc` int(50) DEFAULT NULL,
  `id_turma` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(50) NOT NULL,
  `motivo` varchar(50) DEFAULT NULL,
  `anexo` varchar(50) DEFAULT NULL,
  `id_curso` int(50) DEFAULT NULL,
  `id_tip_aluno` int(50) DEFAULT NULL,
  `status` int(50) DEFAULT NULL,
  `dt_ausencia` int(50) DEFAULT NULL,
  `id_turma` int(50) DEFAULT NULL,
  `id_disc` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_disciplina`
--

CREATE TABLE `pedido_disciplina` (
  `id_disc` int(50) DEFAULT NULL,
  `id_pedido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_admin`
--

CREATE TABLE `tipo_admin` (
  `id_tip_admin` int(50) NOT NULL,
  `nome_tip_admin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_aluno`
--

CREATE TABLE `tipo_aluno` (
  `id_tip_aluno` int(50) NOT NULL,
  `nome_tip_aluno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_coordenador`
--

CREATE TABLE `tipo_coordenador` (
  `id_tip_coord` int(50) NOT NULL,
  `nome_tip_coord` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `id_turma` int(50) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `ano` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_curso`
--

CREATE TABLE `turma_curso` (
  `id_curso` int(50) DEFAULT NULL,
  `id_turma` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_admin`
--

CREATE TABLE `user_admin` (
  `id_tip_admin` int(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_aluno`
--

CREATE TABLE `user_aluno` (
  `email` varchar(50) DEFAULT NULL,
  `id_tip_aluno` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_coordenador`
--

CREATE TABLE `user_coordenador` (
  `id_tip_coord` int(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tipo_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_pedido`
--
ALTER TABLE `admin_pedido`
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_tip_admin` (`id_tip_admin`);

--
-- Indexes for table `aluno_turma`
--
ALTER TABLE `aluno_turma`
  ADD KEY `id_turma` (`id_turma`),
  ADD KEY `id_tip_aluno` (`id_tip_aluno`);

--
-- Indexes for table `coord_curso`
--
ALTER TABLE `coord_curso`
  ADD KEY `id_tip_coord` (`id_tip_coord`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `coord_pedido`
--
ALTER TABLE `coord_pedido`
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_tip_coord` (`id_tip_coord`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disc`);

--
-- Indexes for table `disciplina_turma`
--
ALTER TABLE `disciplina_turma`
  ADD KEY `id_disc` (`id_disc`),
  ADD KEY `id_turma` (`id_turma`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_id_disc` (`id_disc`),
  ADD KEY `fk_id_turma` (`id_turma`),
  ADD KEY `fk_id_tip_aluno` (`id_tip_aluno`),
  ADD KEY `fk_id_curso` (`id_curso`);

--
-- Indexes for table `pedido_disciplina`
--
ALTER TABLE `pedido_disciplina`
  ADD KEY `id_disc` (`id_disc`);

--
-- Indexes for table `tipo_admin`
--
ALTER TABLE `tipo_admin`
  ADD PRIMARY KEY (`id_tip_admin`);

--
-- Indexes for table `tipo_aluno`
--
ALTER TABLE `tipo_aluno`
  ADD PRIMARY KEY (`id_tip_aluno`);

--
-- Indexes for table `tipo_coordenador`
--
ALTER TABLE `tipo_coordenador`
  ADD PRIMARY KEY (`id_tip_coord`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`);

--
-- Indexes for table `turma_curso`
--
ALTER TABLE `turma_curso`
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_turma` (`id_turma`);

--
-- Indexes for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD KEY `id_tip_admin` (`id_tip_admin`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `user_aluno`
--
ALTER TABLE `user_aluno`
  ADD KEY `email` (`email`),
  ADD KEY `id_tip_aluno` (`id_tip_aluno`);

--
-- Indexes for table `user_coordenador`
--
ALTER TABLE `user_coordenador`
  ADD KEY `id_tip_coord` (`id_tip_coord`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `admin_pedido`
--
ALTER TABLE `admin_pedido`
  ADD CONSTRAINT `admin_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `admin_pedido_ibfk_2` FOREIGN KEY (`id_tip_admin`) REFERENCES `tipo_admin` (`id_tip_admin`);

--
-- Limitadores para a tabela `aluno_turma`
--
ALTER TABLE `aluno_turma`
  ADD CONSTRAINT `aluno_turma_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`),
  ADD CONSTRAINT `aluno_turma_ibfk_2` FOREIGN KEY (`id_tip_aluno`) REFERENCES `tipo_aluno` (`id_tip_aluno`);

--
-- Limitadores para a tabela `coord_curso`
--
ALTER TABLE `coord_curso`
  ADD CONSTRAINT `coord_curso_ibfk_1` FOREIGN KEY (`id_tip_coord`) REFERENCES `tipo_coordenador` (`id_tip_coord`),
  ADD CONSTRAINT `coord_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Limitadores para a tabela `coord_pedido`
--
ALTER TABLE `coord_pedido`
  ADD CONSTRAINT `coord_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `coord_pedido_ibfk_2` FOREIGN KEY (`id_tip_coord`) REFERENCES `tipo_coordenador` (`id_tip_coord`);

--
-- Limitadores para a tabela `disciplina_turma`
--
ALTER TABLE `disciplina_turma`
  ADD CONSTRAINT `disciplina_turma_ibfk_1` FOREIGN KEY (`id_disc`) REFERENCES `disciplina` (`id_disc`),
  ADD CONSTRAINT `disciplina_turma_ibfk_2` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_id_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `fk_id_disc` FOREIGN KEY (`id_disc`) REFERENCES `disciplina` (`id_disc`),
  ADD CONSTRAINT `fk_id_tip_aluno` FOREIGN KEY (`id_tip_aluno`) REFERENCES `tipo_aluno` (`id_tip_aluno`),
  ADD CONSTRAINT `fk_id_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

--
-- Limitadores para a tabela `pedido_disciplina`
--
ALTER TABLE `pedido_disciplina`
  ADD CONSTRAINT `pedido_disciplina_ibfk_1` FOREIGN KEY (`id_disc`) REFERENCES `disciplina` (`id_disc`);

--
-- Limitadores para a tabela `turma_curso`
--
ALTER TABLE `turma_curso`
  ADD CONSTRAINT `turma_curso_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `turma_curso_ibfk_2` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

--
-- Limitadores para a tabela `user_admin`
--
ALTER TABLE `user_admin`
  ADD CONSTRAINT `user_admin_ibfk_1` FOREIGN KEY (`id_tip_admin`) REFERENCES `tipo_admin` (`id_tip_admin`),
  ADD CONSTRAINT `user_admin_ibfk_2` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`);

--
-- Limitadores para a tabela `user_aluno`
--
ALTER TABLE `user_aluno`
  ADD CONSTRAINT `user_aluno_ibfk_1` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`),
  ADD CONSTRAINT `user_aluno_ibfk_2` FOREIGN KEY (`id_tip_aluno`) REFERENCES `tipo_aluno` (`id_tip_aluno`);

--
-- Limitadores para a tabela `user_coordenador`
--
ALTER TABLE `user_coordenador`
  ADD CONSTRAINT `user_coordenador_ibfk_1` FOREIGN KEY (`id_tip_coord`) REFERENCES `tipo_coordenador` (`id_tip_coord`),
  ADD CONSTRAINT `user_coordenador_ibfk_2` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

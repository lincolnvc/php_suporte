-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Máquina: localhost:3306
-- Data de Criação: 11-Jun-2016 às 14:57
-- Versão do servidor: 5.5.50-cll
-- versão do PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `suporte`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `description` text,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'Atendimento'),
(2, 'Financeiro'),
(3, 'Suporte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `generals`
--

CREATE TABLE IF NOT EXISTS `generals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `invitations`
--

CREATE TABLE IF NOT EXISTS `invitations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `client_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `invitations`
--

INSERT INTO `invitations` (`id`, `user_id`, `client_id`, `status`) VALUES
(1, 1, 4, 1),
(2, 1, 8, 1),
(3, 1, 9, 1),
(4, 1, 10, 1),
(5, 1, 11, 1),
(6, 1, 14, 1),
(7, 1, 17, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `invitation_settings`
--

CREATE TABLE IF NOT EXISTS `invitation_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `invitation_settings`
--

INSERT INTO `invitation_settings` (`id`, `title`, `content`) VALUES
(1, 'Bem vindo cliente', '<p>Ola seja bem vindo</p>\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `languages`
--

INSERT INTO `languages` (`id`, `name`, `short`) VALUES
(1, 'English', 'en'),
(4, 'Portugues', 'ptbr');

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `description` text,
  `receive_emails` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`id`, `currency_id`, `name`, `country`, `state`, `city`, `zip`, `address`, `contact`, `phone`, `email`, `website`, `bank`, `bank_account`, `description`, `receive_emails`) VALUES
(1, NULL, 'Suporte MagnisTrade', 'brasil', 'centro', 'sao paulo', '45000000', 'centro', 'brasil', '7788888888', 'contato@magnistrade.com.br', 'http://magnistrade.com.br/suporte', NULL, NULL, 'dsdss', 'contato@magnistrade.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned DEFAULT NULL,
  `client_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned NOT NULL,
  `priority_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `tickets`
--

INSERT INTO `tickets` (`id`, `staff_id`, `client_id`, `department_id`, `priority_id`, `type_id`, `status_id`, `title`, `content`, `state`, `updated_at`, `created_at`) VALUES
(1, 1, 3, 3, 3, 1, 7, 'TESTE', '<p>Ola este ticket &eacute; um tete</p>\r\n', 1, '2016-01-29', '2016-01-19'),
(2, 1, 4, 1, 1, 1, 0, 'boa tarde', '<p>boa tarde preciso saber o que esta acontecendo com o meu celular</p>\r\n', 1, '2016-01-20', '2016-01-20'),
(3, 1, 9, 3, 3, 1, 7, 'serviço de cabo de rede ', '<p>isoo</p>\r\n', 1, '2016-01-29', '2016-01-27'),
(4, 1, 10, 1, 1, 1, 0, 'computador dani reiniciando', '<p>O computador da dani esta ligando e desligando toda Hora, por favor verificar.</p>\r\n', 1, '2016-01-29', '2016-01-29'),
(5, 1, 10, 3, 3, 4, 2, 'Atualizar Sistema', '<p>Solicito que seja atualizado a Vers&atilde;o do sistema para 2016.</p>\r\n', 1, '2016-02-01', '2016-01-29'),
(6, 1, 11, 1, 2, 1, 0, 'Limpeza de lotes', '<p>Preciso da limpeza do lote na rua carmo do rio claro 200</p>\r\n', 1, '2016-02-01', '2016-02-01'),
(7, 1, 12, 2, 1, 4, 0, 'Teste Sistema', '<p>Teste teste</p>\r\n', 1, '2016-05-13', '2016-05-02'),
(8, 1, 13, 2, 3, 4, 9, 'teste', '<p>tste</p>\r\n', 1, '2016-05-25', '2016-05-20'),
(9, 1, 15, 1, 1, 4, 0, 'quero uma ajuda', '<p>sssossos</p>\r\n', 1, '2016-06-03', '2016-06-03'),
(10, 1, 16, 1, 1, 4, 2, 'ajudaaa', '<p>ajuuuda meu site nao funciona</p>\r\n', 1, '2016-06-09', '2016-06-03'),
(11, 1, 10, 1, 3, 4, 7, 'tudo parado', '<p>ok</p>\r\n', 1, '2016-06-09', '2016-06-07'),
(12, 1, 18, 1, 1, 11, 2, 'Iluminação', '<p>Exmos;<br />\r\n<br />\r\n<strong>Solicitamos a substitui&ccedil;&atilde;o da l&acirc;mpada do poste pr&oacute;xima ao port&atilde;o nas traseiras do parque # Cabra figa,</strong>&nbsp;como pode ser verificado na imagem em anexa n&atilde;o h&aacute; nenhuma visibilidade pelo lado da veda&ccedil;&atilde;o/contadores de &aacute;gua,&nbsp;<strong>como temos um final de semana prolongado pela frente, n&atilde;o &eacute; bom que esta &aacute;rea esteja sem ilumina&ccedil;&atilde;o.</strong></p>\r\n', 1, '2016-06-09', '2016-06-09'),
(13, 1, 18, 1, 1, 11, 0, ' Almerio 2016-06-09 Portão não fecha  O portão de entrada não fecha', '<table>\r\n <tbody>\r\n  <tr>\r\n   <td>Almerio2016-06-09\r\n   <p>Port&atilde;o n&atilde;o fecha</p>\r\n\r\n   <p>O port&atilde;o de entrada n&atilde;o fecha</p>\r\n   </td>\r\n  </tr>\r\n </tbody>\r\n</table>\r\n', 1, '2016-06-09', '2016-06-09'),
(14, 1, 19, 1, 1, 2, 0, 'teste', '<p>teste</p>\r\n', 1, '2016-06-09', '2016-06-09'),
(15, 1, 20, 1, 3, 2, 0, 'problemas no aparelho de celular', '<p>meu celular pifou ontem</p>\r\n', 1, '2016-06-09', '2016-06-09'),
(16, 1, 21, 1, 1, 2, 0, 'Dúvidas na operação', '<p>tenho d&uacute;vidas referente</p>\r\n', 1, '2016-06-09', '2016-06-09'),
(17, 1, 21, 3, 1, 2, 0, 'Mouse', '<p>mouse nao esta funcionando</p>\r\n', 1, '2016-06-09', '2016-06-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket_histories`
--

CREATE TABLE IF NOT EXISTS `ticket_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `from_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `ticket_histories`
--

INSERT INTO `ticket_histories` (`id`, `ticket_id`, `user_id`, `from_id`, `title`, `content`, `state`, `updated_at`, `created_at`) VALUES
(1, 2, 4, 1, 'boa tarde ', '<p>seu celular esta em manuten&ccedil;&atilde;o esperando a bateria para chegar acompanhe nos por este cana</p>\r\n', 0, '2016-01-20', '2016-01-20'),
(2, 3, 9, 1, 'Responder a ...: serviço de cabo de rede ', 'boa noite ', 1, '2016-01-27', '2016-01-27'),
(3, 4, 10, 1, 'Responder a ...: computador dani reiniciando', 'Estaremos verificando', 1, '2016-01-29', '2016-01-29'),
(4, 6, 11, 1, 'Responder a ...: Limpeza de lotes', '<p>Obrigado por sua solicita&ccedil;&atilde;o, seu lote ser&aacute; limpo em aproximadamente 10 dias &uacute;teis.</p>\r\n\r\n<p>Agradecemos seu contato.</p>\r\n', 0, '2016-02-01', '2016-02-01'),
(5, 1, 3, 1, 'Responder a ...: TESTE', '<p>ok</p>\r\n', 0, '2016-05-16', '2016-05-16'),
(6, 8, 13, 1, 'Responder a ...: teste', '<p>oi</p>\r\n', 0, '2016-05-25', '2016-05-25'),
(7, 9, 15, 1, 'Responder a ...: quero uma ajuda', 'ta', 0, '2016-06-03', '2016-06-03'),
(8, 10, 16, 1, 'Responder a ...: ajudaaa', 'ola voce quer ajuda em que?', 1, '2016-06-03', '2016-06-03'),
(9, 13, 18, 1, 'Responder a ...:  Almerio 2016-06-09 Portão não fecha  O portão de entrada não fecha', '<p>Deves verificar o sensor</p>\r\n', 0, '2016-06-09', '2016-06-09'),
(10, 14, 19, 1, 'Responder a ...: teste', '<p>teste</p>\r\n', 0, '2016-06-09', '2016-06-09'),
(11, 15, 20, 1, 'Responder a ...: problemas no aparelho de celular', '<p>D&uacute;vidas</p>\r\n', 0, '2016-06-09', '2016-06-09'),
(12, 17, 21, 1, 'Responder a ...: Mouse', '<p>estamos verificando</p>\r\n', 0, '2016-06-09', '2016-06-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket_priorities`
--

CREATE TABLE IF NOT EXISTS `ticket_priorities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `ticket_priorities`
--

INSERT INTO `ticket_priorities` (`id`, `user_id`, `name`) VALUES
(1, 1, 'Urgente'),
(2, 1, 'Emergencial'),
(3, 1, 'Normal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket_statuses`
--

CREATE TABLE IF NOT EXISTS `ticket_statuses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `ticket_statuses`
--

INSERT INTO `ticket_statuses` (`id`, `user_id`, `name`) VALUES
(2, 1, 'Aberto'),
(7, 1, 'Em Andamento'),
(9, 1, 'Fechado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticket_types`
--

CREATE TABLE IF NOT EXISTS `ticket_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `user_Id`, `name`) VALUES
(2, 1, 'Suporte Equipamento'),
(4, 1, 'Suporte Sistemas'),
(10, 1, 'Envio de Notas Fiscais'),
(11, 1, 'Dúvidas'),
(12, 1, 'Manutenção em Equipamentos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `language_id` int(11) unsigned NOT NULL DEFAULT '1',
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `role_id`, `parent_id`, `language_id`, `name`, `email`, `password`, `status`, `remember_token`, `updated_at`, `created_at`) VALUES
(1, 1, 0, 4, 'Admin', 'admin@demo.demo', '$2y$10$cEmvWwlw9o5vBubarGY69egN5gftxO82xhrLhNWiImpEbk9x/tN3C', 1, 'ie0Toli4zZjSvtJAIRC30Bon1SHn6KC8tFqh7yM8OroLr8EoxNyQfqAo4pPS', '2016-06-11', '2014-11-20'),
(2, 2, 1, 4, 'funcionario', 'funcionario@magnistrade.com.br', '$2y$10$ZS9SVJf/jpq.zfyRnFKURe9O7yS4GQsH35VUggGfU.88KAot44KYq', 1, 'AmRFw6pYkoFXSIvK45UziKjhXARlxr4dAMvs2YIYo3otIiAU4oap2w0HLLJC', '2016-06-09', '2016-01-19'),
(9, 3, 1, 2, 'alan', 'alanxmacedo@gmail.com', '$2y$10$AhUaJrRlE5c93cxaEoqwoOQi86uKFQu7f4n1TDCbNJ3wc61GOuU8i', 1, '1lKd62GgL0X10LAcGztT3tGK3Bt9aDjy8aVJBk9ZoVggnOucFbBPELwethSa', '2016-01-27', '2016-01-27'),
(10, 3, 1, 2, 'Carlão', 'carlao@teste.com', '$2y$10$hhkH8GiHnKpY8DbyEwcSZ.G8nhMYAvs3RKn5SaoqJM/EfNnV32uEG', 1, 'hzoKprpi0L56aDqUGkUVnJti7Ayo4X0UvOirzKIk6FxkdYKo9qwSpKKS70A3', '2016-06-07', '2016-01-29'),
(11, 3, 0, 1, 'BArcelos', 'falecombarcelos@gmail.com', '$2y$10$.ZDna1QinVFaRk43lodJ1OHlGNVAWIcfHqFJ1K8uQtqAvcGLItaNW', 1, NULL, '2016-02-01', '2016-02-01'),
(13, 3, 0, 1, 'Mateus', 'teste@testando.testado', '$2y$10$QY.akJJMGDR2Jc62O.xrAezVnA1w49KOvC9nJcjdx1geFdv0NepeG', 1, NULL, '2016-05-20', '2016-05-20'),
(15, 3, 0, 1, 'ismael', 'ismael@ismael.com.br', '$2y$10$Q4GwXicAYX9ykdIZO1l78OSCDMclJPrDOyhy/Q37eomPprzTwTtMu', 1, NULL, '2016-06-03', '2016-06-03'),
(16, 3, 0, 4, 'qualquer', 'qualquer@hotmail.com', '$2y$10$I5X0opLHbs5XftFn9d3VzOJY4zEoujlDZ3O9wkFegTSyskQqJ1PRy', 1, 'VnLBHcW3aAhC5GFisyeDCCu54mh4XtZusqDSpmEcqiY1SLWhwmyWnul2aOiE', '2016-06-03', '2016-06-03'),
(17, 3, 1, 1, 'deivson', 'flay.dcv@gmail.com', '$2y$10$Oij/xgcuB5n7LZHUMaTTC.SuswxI4gF.QpzZrla2GPtNRz1cYD13.', 1, NULL, '2016-06-04', '2016-06-04'),
(18, 3, 0, 1, 'Almerio', 'almerio.brasil@gmail.com', '$2y$10$AZzwri7UP/CDkoUoMu6q5.QekJU2185ev7KSL92TCfQlydVyfdK/G', 1, NULL, '2016-06-09', '2016-06-09'),
(19, 3, 0, 1, 'teste', 'teste@teste.com', '$2y$10$4YlLOdgcDVVmJD8FC1LaKeNWug7dbUr.7gwflKFj4SG/x9YLArRLi', 1, NULL, '2016-06-09', '2016-06-09'),
(20, 3, 0, 1, 'Joao', 'joao@joao.com', '$2y$10$H4Pr6setr4SeHXGiXWnkj.LXUZBJ2AFuBZYbD.m8/xOuoKHzhgnc6', 1, NULL, '2016-06-09', '2016-06-09'),
(21, 3, 0, 4, 'mark', 'mark@mark.com', '$2y$10$7a3At83MYIlp5clx3OH8R.FNDwFdbqTA/9M0.cBYWNlzKcS8cyMGi', 1, NULL, '2016-06-09', '2016-06-09'),
(22, 3, 1, 4, 'Wanderlei', 'wanderlei@wanderlei.com', '$2y$10$i9uHehiKL9Mhu7xpNw2NZ.JAFOKpWylRHOp3yOyTY.vt.CwV2xsty', 1, '7FpuHOAIjI5KL7DvdDkFt3aqXidOmYv8vFoJInbzweHyCXYpn4S1GjqecAv3', '2016-06-11', '2016-06-11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_departments`
--

CREATE TABLE IF NOT EXISTS `user_departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `department_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `user_departments`
--

INSERT INTO `user_departments` (`id`, `user_id`, `department_id`) VALUES
(1, 2, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Jul-2024 às 03:52
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vitrine`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `ativo` enum('S','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`, `ativo`) VALUES
(1, 'Celular', 'S'),
(2, 'Televisor', 'S'),
(4, 'Eletrodoméstico', 'S'),
(5, 'Vídeo Games', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` char(14) NOT NULL,
  `cep` char(9) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `estado` char(2) NOT NULL,
  `senha` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `cpf`, `cep`, `endereco`, `cidade`, `complemento`, `bairro`, `estado`, `senha`) VALUES
(1, 'Anderson Teste', 'burnes@professorburnes.com', '060.230.440-77', '87300-010', 'Avenida Irmãos Pereira 1200', 'Campo Mourão', 'Ap 101', 'Centro', 'BR', '$2y$10$LWo5TonbVq.gz/Ed7RYq9.PuKgiURoUaZ0bqvXgVD8mMCH.2VcWOK'),
(2, 'Steve Jobsson', 'steve@gmail.com', '005.569.869-70', '87300-020', 'Avenida José Custódio de Oliveira 200', 'Campo Mourão', '', 'Centro', 'PR', '$2y$10$ilUuhAtlOIKjakF4192gx.jXKeZuTOSzjanIrd0.gBjmaakDbkz5y');

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

CREATE TABLE `foto` (
  `id` int(11) NOT NULL,
  `foto` varchar(20) NOT NULL,
  `produto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `produto_id` int(11) NOT NULL,
  `venda_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `item_venda`
--

INSERT INTO `item_venda` (`produto_id`, `venda_id`, `quantidade`, `valor`) VALUES
(6, 16, 1, 1500),
(9, 16, 2, 899.9),
(9, 18, 1, 899.9),
(12, 18, 1, 2290),
(13, 17, 2, 4100),
(16, 18, 1, 2890);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `produto` varchar(250) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `foto` varchar(20) NOT NULL,
  `valor` double DEFAULT NULL,
  `ativo` enum('S','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `produto`, `categoria_id`, `descricao`, `foto`, `valor`, `ativo`) VALUES
(3, 'Micro-Ondas Philco', 4, '<p>O Micro-Ondas Philco PMO23BB Multifunções é perfeito para quem gosta de agilidade e potência. São 1100W para aquecer e descongelar diversos alimentos. Com ele seu dia a dia fica muito mais descomplicado e sua cozinha ainda mais completa.</p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Tem pintura Limpa Fácil especial que não permite que a sujeira grude nas paredes internas do micro-ondas, facilitando a limpeza.</span><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">A tecla Tira Odor é excelente para remoção de cheiro deixado pelo preparo de alimentos. Também tem a Função descongelar para descongela por tempo ou por peso.&nbsp;</span><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">É equipado também com as funções Travar que permite bloquear o teclado para mais segurança da sua família Display/Sound, que desliga o visor, se pressionar e segurar o botão por 3 segundos.&nbsp;</span><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Com o Menu FIT você cozinhará alimentos como batatas, sopas e legumes com apenas um toque.&nbsp;</span><br></p>', '1719579761.jpg', 499.9, 'S'),
(4, 'Smart Tv Led 32 Hq Hd Com Conversor Digital Externo', 2, '<p>Smart TV LED 32\" hq HD com Conversor Digital Externo 3 hdmi 2 USB wi-fi Android 11 Design Slim</p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Imagem e som com qualidade incomparável!</span></p><p><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Desfrute do hdr</span><br></p><p>Imagens com cores vivas e incríveis.</p><p>Assista vídeos em resolução HD com uma excelente qualidade de imagem.</p><p>O sistema hdr High Dynamic Range, presente na Smart TV hq HQSTV32NK, é responsável pela quantidade de cores que cada pixel pode assumir. Esse formato é capaz de deixar a imagem do televisor com excelente resultado de brilho e contraste, já que as imagens ficam com cores mais vivas, os tons mais claros possuem mais brilho e os tons pretos, mais contraste. O resultado são imagens mais realistas e uma melhor experiência para o espectador!</p><p><br></p><p>Frameless</p><p>Tela livre de bordas, a imersão é total!</p><p>Ao assistir ao seu filme, série, ou programa de TV predileto em uma tela frameless você terá a sensação de estar dentro da cena.</p><p><br></p><p>Android 11</p><p>Uma loja com milhares de aplicativos compatíveis a sua disposição.</p><p>Além disso, a sincronização com o seu Smartphone, seja ele Android ou ios, é muito simples. Espelhe a tela do seu celular na sua Smart TV hq com apenas um toque.</p><p><br></p><p>Design Slim Premium</p><p>A Smart TV hq HQSTV32NK possui acabamento ultra fino e se acomoda perfeitamente no seu ambiente. Moderna e com layout Premium ela deixará qualquer local mais requintado.</p><div><br></div>', '1719579936.jpg', 890, 'S'),
(5, 'Smart Tv 32phg6918 Hd 32 Polegadas Android Tv Philips', 2, '<p>Está à procura de uma nova TV para a sua casa? Então conheça a Smart TV Philips 32 Android TV - 32PHG6918.</p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Conta com uma plataforma fácil de usar, onde você pode personalizar a tela inicial com seus apps favoritos e controlar o que você assiste de forma rápida. Além de ter o design Borderless que deixa a tela praticamente sem bordas e fica bem em qualquer ambiente, trazendo mais sofisticação para a sua casa. E com a resolução HD você terá imagens de qualidade com detalhes nítidos, cores vivas e sombras intensas.</span><br></p>', '1719580023.jpg', 1200, 'S'),
(6, 'Smart Tv 43 Aoc Full Hd 43s5135', 2, '<p>Smart tv hd led 43 aoc 43s5135/78g - wi-fi 3 hdmi 1 usb a smart tv aoc roku 43s5135/78g chegou para inovar o conceito de tvs inteligentes. A plataforma oferece um sistema de busca entre diversos aplicativos por ator, nome ou diretor do filme para uma experiência ainda melhor e facilitando na hora de encontrar o conteúdo desejado. São milhares de canais de streaming Para você garantir a sessão pipoca com a família é só sentar no sofá e curtir músicas, séries, jogos de futebol e milhares de opções de canais gratuitos e pagos. Toda programação exibida com imagens perfeitas graças a resolução hd que oferece uma experiência visual inesquecível<br></p>', '1719580094.jpg', 1500, 'S'),
(7, 'Smart Tv 50pug7408/78 50 Polegadas 4k Uhd Google Tv Philips', 2, '<p>A Smart TV Philips 50 4K uhd Google TV - 50PUG7408/78 vai transformar sua casa em um cinema! Seu processamento de imagem HDR10 + e resolução em 4Kpara você aproveitar as imagens com detalhes mais ricos e pretos mais profundos além de seu sistema Dolby Vision Atmos que vai te permitir aproveitar seus programas com uma riqueza absurda de detalhes com Dolby Vision escute cada detalhe em uma ambientação sonora em 3D com o Dolby Atmos.</p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Seu design com a tela praticamente sem bordas e um suporte fino e alto fica bem em qualquer ambiente, trazendo mais sofisticação para a sua casa. Com Bluetooth 5.0 e Chromecast Integrado você poderá desfrutar dos seus conteúdos favoritos conectando-se a vários dispositivos diferentes com uma conexão sem fio com rápida resposta e ampla distância de sinal. Além de poder controlar sua TV ou dispositivos smartphone compatíveis com o Ok Google usando apenas a sua voz.</span><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Com muita conectividade, a Smart TV Philips 50 4K uhd conta com o Google tv, uma plataforma fácil de usar, onde você pode personalizar a tela inicial com seus apps favoritos e controlar o que você assiste de forma rápida. A Smart TV Philips é perfeita para jogos pois conta com os principais recursos para jogos, como tempo de resposta, que trazem uma experiência muito maior na hora de sua gameplay.</span><br></p>', '1719580156.jpg', 1999.9, 'S'),
(8, 'Smartphone Samsung Galaxy A05 128gb 4g Wi-Fi Tela 6.7\" Dual Chip 4gb Ram Câmera Dupla + Selfie 8mp - Preto', 1, '<p>Veja tudo com nitidez com o Smartphone Samsung Galaxy A05! Com tela continua e design elegante, você pode aproveite seus jogos, filmes e conteúdo favoritos com o vasto display HD+ de 6,7\", além de está disponível em uma estrutura resistente com um padrão linear na parte traseira.</p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Câmera dupla, o dobro da diversão</span><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Valorize as fotos que você tira com a poderosa câmera principal de 50 MP, os retratos tirados com a câmera macro de 2 MP e suas selfies favoritas com a câmera frontal de 8 MP.</span><br></p><p><br></p><p>A diversão não para&nbsp;</p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Equipado com um poderoso octa-core, 4GB de memória e 128 GB de armazenamento interno, o Galaxy A05 oferece desempenho eficiente para qualquer tarefa.</span><br></p><p><br></p><p>&nbsp;<span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Bateria duradoura&nbsp;</span></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">A bateria de 5.000 mAh (padrão)** oferece mais tempo para você fazer o que mais gosta: streaming, compartilhamento, jogos e muito mais. Com até 25W do Super Fast Charging, o Galaxy A05 estará completamente recarregado com rapidez.</span><br></p><p><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Todas as informações divulgadas são de responsabilidade do fabricante/fornecedor.</span></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Verifique com os fabricantes do produto e de seus componentes eventuais limitações à utilização de todos os recursos e funcionalidades.</span><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Imagens Meramente Ilustrativas.</span><br></p>', '1719580245.jpg', 799.9, 'S'),
(9, 'Smartphone Samsung Galaxy A14 5g 128gb Octa-Core Dual Chip 4gb Ram Câmera Tripla + Selfie 13mp - Prata', 1, '<p>Expanda sua visão para a Tela Infinity-V de 6,6 polegadas no Galaxy A14 5G e veja o que está perdendo</p><p>Experimente tudo o que você ama em cores vivas de alta definição e realistas com a tecnologia de tela FHD+</p>', '1719580316.jpg', 899.9, 'S'),
(10, 'Smartphone Samsung Galaxy A15 4g 128gb Tela 6.5\" 4gb Ram Câmera Tripla + Selfie 13mp - Azul Escuro', 1, '<p>O Smartphone Samsung Galaxy A15 é a melhor opção para você que não abre mão de um item sofisticado e tecnológico! Simples e elegante. Foi projetado para exibir seu perfil e capa traseira elegantes e um layout de câmera impecável. O display Super AMOLED de 6,5 polegadas do Galaxy A15 oferece clareza vibrante mesmo sob luz solar direta com Vision Booster, rolagem suave com taxa de atualização de 90 Hz aprimorada, brilho aprimorado de até 800 nits e conforto o dia todo com luz azul reduzida graças ao Eye Comfort Shield.</p><p><br></p><p>Escolha sua lente. Encontre seu ângulo</p><p><br></p><p>Vá em frente, expresse seu mundo. O Galaxy A15 possui uma câmera Principal de 50 MP para sua obra-prima, câmeras Ultra Wide de 5 MP e Macro de 2 MP para paisagens e close-ups, e uma câmera frontal de 13 MP para postar selfies incríveis nas redes sociais.</p><p><span style=\"font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">Faça isso com desempenho aprimorado&nbsp;</span><br></p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Seu dia fica mais tranquilo com um processador octa-core que oferece um desempenho poderoso, enquanto opções espaçosas de memória e armazenamento mantêm seus dados e conteúdos à mão.</span><br></p><p><br></p><p>&nbsp;</p><p><br></p><p>Não desligue com uma bateria que dura dois dias</p><p><br></p><p>Aproveite mais tempo de produtividade com uma bateria de 5.000 mAh (padrão) que dura dois dias e recarrega rapidamente com Carregamento Super Rápido.</p><p><br></p><p>&nbsp;</p>', '1719580407.jpg', 949.9, 'S'),
(11, 'Smartphone Moto G22 128gb 4g Wi-Fi Tela 6.5\'\' Dual Chip 4gb Ram Câmera Quádrupla + Selfie 16mp - Preto', 1, '<table class=\"src__SpecsCell-sc-10qje1m-2 bqHqeR\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; width: 1220px; color: rgb(51, 51, 51); font-family: &quot;Hind Madurai&quot;, sans-serif;\"><tbody style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline; background-color: rgb(242, 242, 242);\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Código</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">4813023357</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Código de barras</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">7892597352029</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline; background-color: rgb(242, 242, 242);\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Alimentação, tipo de bateria</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">5000 mAh</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Banda</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">\"2G - GSM 850/900/1800/1900 MHz 3G - WCDMA 850/900/1700/1900/2100 MHz 4G - LTE B1/B2/B3/B4/B5/B7/B8/B13/B26/B28/B38/B40/B66\"</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline; background-color: rgb(242, 242, 242);\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Conexões</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Wi-Fi,3G,4G</td></tr></tbody></table>', '1719580498.jpg', 999, 'S'),
(12, 'Refrigerador Electrolux Dc35a', 4, '<p>O Refrigerador Cycle Defrost DC35A Possui Um Design Único E Moderno, Com Puxador Ergonômico E Integrado. A Prateleira Porta-Latas É Reversível E Acomoda 5 Unidades, Melhorando O Aproveitamento Interno Do Refrigerador. O Super Freezer A -18º Conserva A Qualidade Dos Congelados Por Muito Mais Tempo. Design Único Com Puxador Ergonômico E Integrado Design Moderno Que Combina Com A Cozinha. Puxador Embutido, Bonito E Fácil De Limpar. Prateleira Porta-Latas Reversível Para 5 Unidades Organização E Flexibilidade Para Acomodar E Melhorar O Aproveitamento Interno Do Refrigerador. Refrigerador Com Super Freezer - 18o C Conserva A Qualidade Dos Congelados Por Mais Tempo. Este Modelo É Cyclo Defrost! A Electrolux Possui 2 Tipos De Geladeira, Cycle Defrost E Frost Free. A Diferença Entre Os 2 É Simples, A Frost Free Não Acumula Gelo, Por Isso, Você Não Precisa Descongelar Nunca. Já A Cycle Defrost Acumula Um Pouco, E Precisa Ser Descongelada Em Torno De 2 Vezes Ao Ano. Por Isso, Normalmente O Freezer Dele É Maior, Pois Tem Um Compartimento De Condensador De Gelo. Em Resumo, Se Você Quer Mais Praticidade, A Frost Free É Mais Indicada. Mas, Se Quer Economizar A Cycle Defrost É Uma Boa Opção.<br></p>', '1719602839.jpg', 2290, 'S'),
(13, 'Refrigerador/Geladeira 437l Side By Side Philco 127v Prf535i', 4, '<p>Refrigerador/Geladeira 437L Side By Side Philco 127V PRF535I</p><p>A Geladeira 437L Side By Side Philco PRF535Ivai agregar muito mais requinte e eficiência para a sua cozinha. O design side by side da Philco, em que geladeira e freezer estão lado a lado, proporciona o aproveitamento inteligente do espaço vertical e garante a alta capacidade de 437 litros. Além disso, as diferentes funções da Geladeira a tornam ainda mais moderna e indispensável na sua cozinha, como por exemplo, a função Smart Cooling que distribui de maneira uniforme a temperatura em todo o gabinete da geladeira e freezer proporcionando a conservação por igual de todos os alimentos. Elegante, ela também possui display digital que possibilita acompanhar as temperaturas individuais da geladeira e freezer, além de selecionar as funções disponíveis.</p><p>Com compressor Eco Inverter e Classificação energética a, a Geladeira Philco é mais econômica, trabalha silenciosamente e possui uma vida útil muito maior. Para armazenar seus alimentos e bebidas sem se preocupar com espaço, conte com a Geladeira 437L Side By Side Philco. - Capacidade de 437L (292L no refrigerador e 145L no freezer)- Classificação A em eficiência energética- Sistema de refrigeração Frost Free- Side by side (freezer na porta esquerda e refrigerador na porta direita)- Painel touch - Controle de temperatura do freezer e refrigerador de forma independente- Freezer com temperaturas de -14°C a -22°C- Refrigerador com temperaturas de 2 a 8°C- Funções Smart, Eco, turbo freezer e turbo refrigerador- Alarme de porta aberta- Iluminação interna led- Porta em aço com tratamento anti-corrosão- Prateleiras em vidro temperado- Divisão do refrigerador: 4 prateleiras, 1 gaveta e 3 prateleiras de porta- Divisão do freezer: 4 prateleiras, 1 gaveta e 4 prateleiras de porta- Compressor inverter.</p>', '1719602933.jpg', 4100, 'S'),
(14, 'Geladeira Frost Free Inverse 588 Litros Bre85ab Brastemp', 4, '<p>Chegou a hora de trocar sua geladeira? Nós temos a opção perfeita para você. A Geladeira / Refrigerador Brastemp Frost Free - BRE85AB é inverse e possui duas portas, facilitando a sua vida no dia a dia. Na cor branca, ela é espaçosa, tendo a capacidade de 588 litros. Dessa forma, você consegue armazenar todos os seus alimentos com tranquilidade.</p><p>Além disso, o sistema twist ice advanced facilita a formação de gelo e como se isso não fosse suficiente, a tecnologia carbon air filter neutraliza odores indesejados no interior da geladeira. Espera aí que tem mais: você pode controlar a temperatura do refrigerador com o touch black, o que garante mais praticidade. Essa geladeira é perfeita, não é mesmo? Então vem comprar!</p><div><br></div>', '1719603015.jpg', 5290, 'S'),
(15, 'Console Playstation 5 Edição Digital Slim Com 2 Jogos', 5, '<p>Jogue como nunca antes! O Playstation 5 Edição Digital com os jogos Returnal e Ratchet Clank: em uma outra dimensão. Com um console PS5, os jogadores contam com uma poderosa tecnologia de jogos em um design elegante e compacto.</p><p><span style=\"background-color: var(--bs-card-bg); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Experimente o carregamento extremamente rápido de um SSD de ultra-alta velocidade, imersão mais profunda com ajuda da resposta tátil, gatilhos adaptáveis e áudio 3D, além de uma geração totalmente nova de jogos Playstation, incríveis.</span><br></p>', '1719603117.jpg', 3999, 'S'),
(16, 'Console Xbox Series S 500gb Ssd', 5, '<table class=\"src__SpecsCell-sc-10qje1m-2 bqHqeR\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; width: 1220px; color: rgb(51, 51, 51); font-family: &quot;Hind Madurai&quot;, sans-serif;\"><tbody style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline; background-color: rgb(242, 242, 242);\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Código</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">2117190549</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Fabricante</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Microsoft</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline; background-color: rgb(242, 242, 242);\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Marca</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Microsoft</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Bluetooth</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Não</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline; background-color: rgb(242, 242, 242);\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Peso liq. do produto (Kg)</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">1,9kg</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Recursos de Áudio</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">L-PCM, até 7.1 Dolby Digital 5.1 DTS 5.1 Dolby TrueHD com Atmos</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline; background-color: rgb(242, 242, 242);\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Wi-Fi Integrado</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">Sim</td></tr><tr class=\"src__View-sc-10qje1m-3 hIUuMp\" style=\"margin: 0px; padding: 0px; border-style: initial; border-color: initial; border-image: initial; vertical-align: baseline;\"><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">HD</td><td class=\"src__Text-sc-10qje1m-4 fyapQy\" style=\"margin: 0px; padding: 10px; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; vertical-align: baseline; color: rgb(102, 102, 102);\">SSD 500 GB</td></tr></tbody></table>', '1719603190.jpg', 2890, 'S'),
(17, 'Console Nintendo Switch + Mario Kart 8 Digital - Hbdskabl3', 5, '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">Nintendo Switch é o mais novo console de videogame doméstico da nintendo. Além de proporcionar diversão em casa para um ou mais jogadores, o console nintendo switch pode ser transformando em um console portátil num piscar de olhos. Desta forma, os jogadores podem usufruir da experiência de um console doméstico completo a qualquer hora, em qualquer lugar. A flexibilidade do modo portátil foi adicionada ao poder de um console doméstico, com uma jogabilidade sem precedentes proporcionada pelos dois novos controles joy-con.</span><br style=\"color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br style=\"color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">Em casa, o console fica na base do nintendo switch, que permite a você jogar com amigos e familiares usando uma televisão, no conforto da sua sala. Ao retirar o console nintendo switch de sua base, o console passa a usar o modo portátil instantaneamente, e a mesma ótima experiência de jogo da sua casa pode ser levada aonde você for. A portabilidade do console nintendo switch é reforçada pela tela de 6,2 polegadas, que exibe jogabilidade intensa e em alta definição no parque, avião, carro ou na casa de um amigo.</span><br></p>', '1719603256.jpg', 2290, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(120) NOT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `tipo` enum('Admin','Vendedor') NOT NULL,
  `ativo` enum('S','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `foto`, `tipo`, `ativo`) VALUES
(1, 'Bill Gates', 'bill@gmail.com', '$2y$10$FZ3EGQXIRPxISYppz1y3JeYFYLvSkCM8DP46XGCL18yQVhUzhyJui', 'bill.jpg', 'Admin', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `status` enum('Cancelado','Pago','Aguardando Pagamento') NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `data`, `status`, `cliente_id`) VALUES
(16, '2024-07-01 11:34:56', 'Cancelado', 1),
(17, '2024-07-01 11:49:32', 'Pago', 2),
(18, '2024-07-01 16:08:14', 'Aguardando Pagamento', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_foto_produto1_idx` (`produto_id`);

--
-- Índices para tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`produto_id`,`venda_id`),
  ADD KEY `fk_produto_has_venda_venda1_idx` (`venda_id`),
  ADD KEY `fk_produto_has_venda_produto1_idx` (`produto_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produto_categoria_idx` (`categoria_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venda_cliente1_idx` (`cliente_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `foto`
--
ALTER TABLE `foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_foto_produto1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `fk_produto_has_venda_produto1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto_has_venda_venda1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

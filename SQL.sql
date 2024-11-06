CREATE TABLE `Obra` (
  `codigo_obra` INT PRIMARY KEY,
  `titulo` VARCHAR,
  `ano_publicacao` YEAR,
  `situacao` VARCHAR,
  `tipo_obra` VARCHAR,
  `codigo_editora` INT
);

CREATE TABLE `Exemplar` (
  `id_exemplar` INT PRIMARY KEY,
  `codigo_obra` INT,
  `numero_exemplar` INT,
  `data_aquisicao` DATE,
  `situacao` VARCHAR
);

CREATE TABLE `Editora` (
  `codigo_editora` INT PRIMARY KEY,
  `nome` VARCHAR,
  `cidade` VARCHAR
);

CREATE TABLE `Autor` (
  `codigo_autor` INT PRIMARY KEY,
  `nome_completo` VARCHAR
);

CREATE TABLE `Obra_Autor` (
  `codigo_obra` INT,
  `codigo_autor` INT,
  `ordem` INT,
  `primary` key(codigo_obra,codigo_autor)
);

CREATE TABLE `Usuario` (
  `id_usuario` INT PRIMARY KEY,
  `nome` VARCHAR,
  `endereco` VARCHAR,
  `telefone` VARCHAR,
  `cpf` VARCHAR,
  `indicado_por` INT
);

CREATE TABLE `Emprestimo` (
  `id_emprestimo` INT PRIMARY KEY,
  `id_usuario` INT,
  `id_exemplar` INT,
  `data_emprestimo` DATETIME,
  `data_prevista_devolucao` DATETIME,
  `data_devolucao` DATETIME,
  `matricula_funcionario` INT
);

CREATE TABLE `Funcionario` (
  `matricula` INT PRIMARY KEY,
  `nome` VARCHAR,
  `departamento_codigo` INT
);

CREATE TABLE `Departamento` (
  `codigo` INT PRIMARY KEY,
  `nome` VARCHAR,
  `chefe` INT
);

CREATE TABLE `Reserva` (
  `id_reserva` INT PRIMARY KEY,
  `id_usuario` INT,
  `id_exemplar` INT,
  `data_reserva` DATETIME,
  `data_retirada` DATETIME
);

CREATE TABLE `Assunto` (
  `codigo_assunto` INT PRIMARY KEY,
  `descricao` VARCHAR
);

CREATE TABLE `Obra_Assunto` (
  `codigo_obra` INT,
  `codigo_assunto` INT,
  `primary` key(codigo_obra,codigo_assunto)
);

CREATE TABLE `Fornecedor` (
  `codigo_fornecedor` INT PRIMARY KEY,
  `razao_social` VARCHAR,
  `telefone` VARCHAR
);

CREATE TABLE `Manutencao` (
  `id_manutencao` INT PRIMARY KEY,
  `id_exemplar` INT,
  `descricao` VARCHAR,
  `data_manutencao` DATETIME,
  `matricula_funcionario` INT
);

ALTER TABLE `Obra` ADD FOREIGN KEY (`codigo_editora`) REFERENCES `Editora` (`codigo_editora`);

ALTER TABLE `Exemplar` ADD FOREIGN KEY (`codigo_obra`) REFERENCES `Obra` (`codigo_obra`);

ALTER TABLE `Obra_Autor` ADD FOREIGN KEY (`codigo_obra`) REFERENCES `Obra` (`codigo_obra`);

ALTER TABLE `Obra_Autor` ADD FOREIGN KEY (`codigo_autor`) REFERENCES `Autor` (`codigo_autor`);

ALTER TABLE `Usuario` ADD FOREIGN KEY (`indicado_por`) REFERENCES `Usuario` (`id_usuario`);

ALTER TABLE `Emprestimo` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

ALTER TABLE `Emprestimo` ADD FOREIGN KEY (`id_exemplar`) REFERENCES `Exemplar` (`id_exemplar`);

ALTER TABLE `Emprestimo` ADD FOREIGN KEY (`matricula_funcionario`) REFERENCES `Funcionario` (`matricula`);

ALTER TABLE `Funcionario` ADD FOREIGN KEY (`departamento_codigo`) REFERENCES `Departamento` (`codigo`);

ALTER TABLE `Departamento` ADD FOREIGN KEY (`chefe`) REFERENCES `Funcionario` (`matricula`);

ALTER TABLE `Reserva` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

ALTER TABLE `Reserva` ADD FOREIGN KEY (`id_exemplar`) REFERENCES `Exemplar` (`id_exemplar`);

ALTER TABLE `Obra_Assunto` ADD FOREIGN KEY (`codigo_obra`) REFERENCES `Obra` (`codigo_obra`);

ALTER TABLE `Obra_Assunto` ADD FOREIGN KEY (`codigo_assunto`) REFERENCES `Assunto` (`codigo_assunto`);

ALTER TABLE `Manutencao` ADD FOREIGN KEY (`id_exemplar`) REFERENCES `Exemplar` (`id_exemplar`);

ALTER TABLE `Manutencao` ADD FOREIGN KEY (`matricula_funcionario`) REFERENCES `Funcionario` (`matricula`);

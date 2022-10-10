USE WK;

INSERT INTO
    Estados (nome_estado, sigla_estado)
VALUES
    ('Acre', 'AC'),
    ('Alagoas', 'AL'),
    ('Amapa', 'AP'),
    ('Amazonas', 'AM'),
    ('Bahia', 'BA'),
    ('Ceara', 'CE'),
    ('Espirito Santo', 'ES'),
    ('Goias', 'GO'),
    ('Maranhao', 'MA'),
    ('Mato Grosso', 'MT'),
    ('Mato Grosso do Sul', 'MS'),
    ('Minas Gerais', 'MG'),
    ('Para', 'PA'),
    ('Paraiba', 'PB'),
    ('Parana', 'PR'),
    ('Pernambuco', 'PE'),
    ('Piaui', 'PI'),
    ('Rio de Janeiro', 'RJ'),
    ('Rio Grande do Norte', 'RN'),
    ('Rio Grande do Sul', 'RS'),
    ('Rondonia', 'RO'),
    ('Roraima', 'RR'),
    ('Santa Catarina', 'SC'),
    ('Sao Paulo', 'SP'),
    ('Sergipe', 'SE'),
    ('Tocantins', 'TO'),
    ('Distrito Federal', 'DF');

INSERT INTO
    Cidades (codigo_estado, nome_cidade)
VALUES
    ((SELECT codigo_estado FROM Estados where sigla_estado='AC'), 'Rio Branco'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='AL'), 'Maceio'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='AP'), 'Macapa'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='AM'), 'Manaus'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='BA'), 'Salvador'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='CE'), 'Fortaleza'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='ES'), 'Vitoria'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='GO'), 'Goiania'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='MA'), 'Sao Luis'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='MT'), 'Cuiaba'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='MS'), 'Campo Grande'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='MG'), 'Belo Horizonte'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='PA'), 'Belem'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='PB'), 'Joao Pessoa'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='PR'), 'Curitiba'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='PE'), 'Recife'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='PI'), 'Teresina'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='RJ'), 'Rio de Janeiro'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='RN'), 'Natal'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='RS'), 'Porto Alegre'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='RO'), 'Porto Velho'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='RR'), 'Boa Vista'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='SC'), 'Florianopolis'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='SP'), 'Sao Paulo'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='SE'), 'Aracaju'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='TO'), 'Palmas'),
    ((SELECT codigo_estado FROM Estados where sigla_estado='DF'), 'Brasilia');

INSERT INTO
    Pessoas (codigo_cidade, tipo_pessoa, nome, tipo_documento, documento, data_nascimento,
             data_cadastro, email, contato)
VALUES
    ((SELECT codigo_cidade FROM Cidades where nome_cidade='Curitiba'), 'C',
    'Albert Einstein', 'C', '46026625011', CONVERT('1879-03-14', DATETIME), 
    CONVERT(NOW(), DATETIME), 'fisico_doidao.sk8@email.com', 'Telefone: XXX-XXX-XX-XXXXX'),
    
    ((SELECT codigo_cidade FROM Cidades where nome_cidade='Florianopolis'), 'C',
    'Francisco Ferdinando Carlos Luis Jose Maria', 'C', '52210656060', CONVERT('1863-12-18', DATETIME), 
    CONVERT(NOW(), DATETIME), 'nandinho.pronto_pra_guerra@email.com', 'Telefone: XXX-XXX-XX-XXXXX'),
    
    ((SELECT codigo_cidade FROM Cidades where nome_cidade='Rio de Janeiro'), 'C',
    'Oscar Ribeiro de Almeida Niemeyer Soares Filho', 'C', '41176717073', CONVERT('1907-12-15', DATETIME), 
    CONVERT(NOW(), DATETIME), 'menino_ney.arquiteto@email.com', 'Telefone: XXX-XXX-XX-XXXXX'),
    
    ((SELECT codigo_cidade FROM Cidades where nome_cidade='Rio de Janeiro'), 'C',
    'Pedro de Alcantara Francisco Antonio Joao Carlos Xavier de Paula Miguel Rafael Joaquim Jose Gonzaga Pascoal Cipriano Serafim', 'C', '28231167021', CONVERT('1798-10-12', DATETIME), 
    CONVERT(NOW(), DATETIME), 'PedrinhoPrimeiroODominador@email.com', 'Telefone: XXX-XXX-XX-XXXXX'),
    
    ((SELECT codigo_cidade FROM Cidades where nome_cidade='Natal'), 'V',
    'William Henry Gates III', 'P', 'FV120343', CONVERT('1955-10-28', DATETIME), 
    CONVERT(NOW(), DATETIME), 'BillGates.Apple@email.com', 'site: FAIL (BLUE SCREEN)'),
    
    ((SELECT codigo_cidade FROM Cidades where nome_cidade='Brasilia'), 'V',
    'Steven Paul Jobs', 'P', 'ZE011101', CONVERT('1955-02-24', DATETIME), 
    CONVERT(NOW(), DATETIME), 'Jobs.Maca@email.com', 'Site: www.tudoquevcnaopodecomprar.com'),

    ((SELECT codigo_cidade FROM Cidades where nome_cidade='Vitoria'), 'V',
    'Jeffrey Preston Bezos', 'C', '09339384032', CONVERT('1964-01-12', DATETIME), 
    CONVERT(NOW(), DATETIME), 'PoemNoSiteQueEuVendo@email.com', 'Site: www.vendetudodeAaZ.com.br');

INSERT INTO
    Clientes (codigo_pessoa, data_ultima_compra)
VALUES
    ((SELECT codigo_pessoa FROM Pessoas where documento='46026625011'), null),
    ((SELECT codigo_pessoa FROM Pessoas where documento='52210656060'), null),
    ((SELECT codigo_pessoa FROM Pessoas where documento='41176717073'), null),
    ((SELECT codigo_pessoa FROM Pessoas where documento='28231167021'), null);

INSERT INTO
    Vendedores (codigo_pessoa, data_ultimo_login, salario)
VALUES
    ((SELECT codigo_pessoa FROM Pessoas where documento='FV120343'), null, null),
    ((SELECT codigo_pessoa FROM Pessoas where documento='ZE011101'), null, null),
    ((SELECT codigo_pessoa FROM Pessoas where documento='09339384032'), null, null);

INSERT INTO
    Produtos (descricao, marca, valor_venda)
VALUES
    ('Console Xbox Series S', 'Microsoft', '2045.99'),
    ('Console Nintendo Switch - Azul Neon e Vermelho Neon', 'Nintendo', '2118.00'),
    ('Nintendo Switch Lite Turquesa', 'Nintendo', '1620.00'),
    ('Notebook Gamer Nitro 5 AN515-57-52LC', 'Acer', '4905.36'),
    ('Notebook Gamer G15-a0700-MM20P 15.6', 'Dell', '8509.00'),
    ('Notebook Gamer G15-i1200-U30P 15.6', 'Dell', '7339.00'),
    ('Notebook ideapad 82MG0009BR', 'Lenovo', '4769.10'),
    ('Notebook Gamer Legion 82QJ0000BR', 'Lenovo', '6999.98'),
    ('Controle sem fio para Xbox One ', 'Zamia Gamepad', '184.5'),
    ('Controle sem Fio Xbox Robot Branco', 'Microsoft', '529.99'),
    ('Controle Usb Com Fio Para Xbox 360', 'TechBrasil', '82.19'),
    ('JoyStick PS5 Dual Sense', 'Sony', '419.90');

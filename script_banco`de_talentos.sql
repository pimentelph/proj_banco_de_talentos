CREATE TABLE funcionarios (
                CPF NUMERIC(11) NOT NULL,
                data_de_nascimento DATE NOT NULL,
                nome VARCHAR(100) NOT NULL,
                estado_civil VARCHAR(1) NOT NULL,
                senha VARCHAR(150) NOT NULL,
                sexo VARCHAR(1) NOT NULL,
                grau_de_intituio VARCHAR(50) NOT NULL,
                amigos VARCHAR(100) NOT NULL,
                CONSTRAINT funcionarios_pk PRIMARY KEY (CPF),
		CONSTRAINT check_sexo CHECK (sexo IN('H', 'M')),
		CONSTRAINT check_estado_civil CHECK (estado_civil IN('C', 'S', 'D', 'V'))
);
COMMENT ON TABLE funcionarios IS 'Criação da tabela funcionários';
COMMENT ON COLUMN funcionarios.CPF IS 'Cria a coluna CPF para poder identificar os funcionários através do CPF de cada um, assim colocando ela como PK';
COMMENT ON COLUMN funcionarios.data_de_nascimento IS 'Cria a coluna com a data de nascimento de cada funcionário';
COMMENT ON COLUMN funcionarios.nome IS 'Cria a coluna de nomes dos funcionários';
COMMENT ON COLUMN funcionarios.estado_civil IS 'Cria a coluna de estado civil, a precision vem em 1 para que seja só coloque S para solteira, D para divorciada, C para casada e V de viúva.';
COMMENT ON COLUMN funcionarios.senha IS 'Cria a coluna da senha dos funcionários para eles poderem entrar no banco de talentos';
COMMENT ON COLUMN funcionarios.sexo IS 'Cria a coluna  de sexo, aonde a pessoa só pode colocar duas opções, sendo elas M de masculino e F de feminino';
COMMENT ON COLUMN funcionarios.grau_de_intituio IS 'Cria a coluna sobre o grau de instituição de cada funcionário';
COMMENT ON COLUMN funcionarios.amigos IS 'Cria a coluna de amigos de cada funcionário dentro do banco de talentos';


CREATE TABLE postagens (
                postagens_id NUMERIC(500) NOT NULL,
                CPF NUMERIC(11) NOT NULL,
                CONSTRAINT postagens_pk PRIMARY KEY (postagens_id, CPF)
);
COMMENT ON TABLE postagens IS 'Criar a tabela de postagens';
COMMENT ON COLUMN postagens.postagens_id IS 'Cria a coluna Posts_ID para que cada postagem tenha um ID único para fácil procura de cada um';
COMMENT ON COLUMN postagens.CPF IS 'Cria a coluna CPF para poder identificar os funcionários através do CPF de cada um, assim colocando ela como PK';


CREATE TABLE residencia (
                CPF NUMERIC(11) NOT NULL,
                logradouro VARCHAR(150) NOT NULL,
                numero NUMERIC(500) NOT NULL,
                complemento VARCHAR(500) NOT NULL,
                bairro VARCHAR(150) NOT NULL,
                cidade VARCHAR(100) NOT NULL,
                UF VARCHAR(2) NOT NULL,
                CEP NUMERIC(8) NOT NULL,
                CONSTRAINT residencia_pk PRIMARY KEY (CPF),
		CONSTRAINT check_2_letras CHECK (UF IN('AC', 'AL', 'AP', 'AM', 'BA','CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'))
);
COMMENT ON TABLE residencia IS 'A tabela da residencia de cada funcionário';
COMMENT ON COLUMN residencia.CPF IS 'Cria a coluna CPF para poder identificar os funcionários através do CPF de cada um, assim colocando ela como PK';
COMMENT ON COLUMN residencia.logradouro IS 'Cria a coluna do lofradouro da residencia do funcionário';
COMMENT ON COLUMN residencia.numero IS 'Cria a coluna dos numeros das casas ou apartamentos do funcionário';
COMMENT ON COLUMN residencia.complemento IS 'É o complemento da residencia de cada funcionário';
COMMENT ON COLUMN residencia.bairro IS 'É o bairro da residencia do funcionário';
COMMENT ON COLUMN residencia.cidade IS 'É a cidade da residência do funcionário';
COMMENT ON COLUMN residencia.UF IS 'É o estado do país em que fica a residência, aonde só pode usar duas letras como: ES, MT, SP, RJ, RS...';
COMMENT ON COLUMN residencia.CEP IS 'É o CEP da residencia do funcionário';


CREATE TABLE email (
                CPF NUMERIC(11) NOT NULL,
                emails VARCHAR(100) NOT NULL,
                CONSTRAINT email_pk PRIMARY KEY (CPF)
);
COMMENT ON TABLE email IS 'Cria a tabela de emails para os funcionários, aonde cada um deles pode ter um ou mais emails';
COMMENT ON COLUMN email.CPF IS 'Cria a coluna CPF para poder identificar os funcionários através do CPF de cada um, assim colocando ela como PK';
COMMENT ON COLUMN email.emails IS 'Coluna com os emails de cada funcionário';


CREATE TABLE telefone (
                CPF NUMERIC(11) NOT NULL,
                nmero_telefone NUMERIC(11) NOT NULL,
                CONSTRAINT telefone_pk PRIMARY KEY (CPF)
);
COMMENT ON TABLE telefone IS 'Tabela para os telefones dos funcionários';
COMMENT ON COLUMN telefone.CPF IS 'Cria a coluna CPF para poder identificar os funcionários através do CPF de cada um, assim colocando ela como PK';
COMMENT ON COLUMN telefone.nmero_telefone IS 'Número de telefones dos funcionários';


CREATE TABLE qualidades (
                CPF NUMERIC(11) NOT NULL,
                hard_skills VARCHAR(100) NOT NULL,
                soft_skills VARCHAR(100) NOT NULL,
                CONSTRAINT qualidades_pk PRIMARY KEY (CPF)
);
COMMENT ON COLUMN qualidades.CPF IS 'Cria a coluna CPF para poder identificar os funcionários através do CPF de cada um, assim colocando ela como PK';
COMMENT ON COLUMN qualidades.hard_skills IS 'Cria a coluna de hardskills para os funcionários';
COMMENT ON COLUMN qualidades.soft_skills IS 'Cria a tabela de softskills para cada funcionários';


ALTER TABLE qualidades ADD CONSTRAINT funcionarios_qualidades_fk
FOREIGN KEY (CPF)
REFERENCES funcionarios (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE telefone ADD CONSTRAINT funcionarios_telefone_fk
FOREIGN KEY (CPF)
REFERENCES funcionarios (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE email ADD CONSTRAINT funcionarios_email_fk
FOREIGN KEY (CPF)
REFERENCES funcionarios (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE residencia ADD CONSTRAINT funcionarios_residencia_fk
FOREIGN KEY (CPF)
REFERENCES funcionarios (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE postagens ADD CONSTRAINT funcionarios_postagens_fk
FOREIGN KEY (CPF)
REFERENCES funcionarios (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

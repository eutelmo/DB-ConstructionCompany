--Criar Schema
create schema construtora3;

-- Localização:
show search_path;
set search_path to "construtora3";

-- Criação a tabela de Login
CREATE TABLE if not exists login(
    userName varchar(20) primary key,
    password varchar(20),
    nivelPermissoes smallint
);

-- CRIAÇÂO DE TABELAS:
-- Criação da tabela de funcionários:
CREATE TABLE IF NOT EXISTS funcionarios(
id serial primary key,
userName varchar(20),
nome varchar(30),
cargo varchar(20),
localidade varchar(20),
dataNascimento date,
contacto varchar(15),

FOREIGN KEY(userName) REFERENCES login(userName)

);

-- Criação da tabela da fase:
CREATE table if not exists fase(
    id serial primary key,
    nome varchar(20)
);

-- Criação da tabela de projetos:
CREATE table if not exists projetos(
  id serial primary key,
  nome varchar(30),
  localizacao varchar(20),
  dataInicio timestamp,
  dataFimPrevisto timestamp
);

--Criação da tabela de especialidade:
CREATE table if not exists especialidade(
  id serial primary key,
  nome varchar(20)
);

-- Criação da tabela de equipas:
CREATE table if not exists equipas(
    id serial primary key,
    nome varchar(20),
    id_especialidade integer,
    id_fase integer,

    FOREIGN KEY(id_especialidade) REFERENCES especialidade(id),
    FOREIGN KEY(id_fase) REFERENCES fase(id)
);

-- Criação da tabela de funcionário-equipa:
CREATE table if not exists funcionario_equipa(
    id_equipa integer,
    id_funcionario integer,

    primary key (id_equipa,id_funcionario),
    foreign key(id_equipa) references equipas(id),
    foreign key (id_funcionario) references funcionarios(id)
);

--Criação da tabela de projeto-equipa:
CREATE table if not exists projeto_equipa(
    id_projeto integer,
    id_equipa integer,

    primary key (id_projeto,id_equipa),
    foreign key(id_projeto) references projetos(id),
    foreign key (id_equipa) references equipas(id)
);

--Criação da tabela de projeto-especialidade:
CREATE table if not exists projeto_especialidade(
    id serial primary key,
    id_projeto integer,
    id_especialidade integer,
    diasEstimados smallint,

    foreign key(id_projeto) references projetos(id),
    foreign key (id_especialidade) references especialidade(id)

);

--Criação da tabela de Registo diário:
create table if not exists registoDiario(
    id serial primary key,
    id_projeto integer,
    id_equipa integer,
    data timestamp,

    foreign key (id_projeto) references projetos(id),
    foreign key (id_equipa) references equipas(id)
);

-- Criar tabelas de nomes, cargos e localidades para gerar automaticamente funcionarios
create table if not exists nome_Proprio (
    id serial primary key,
    nome varchar(10)
);

CREATE table if not exists Apelido(
  id serial primary key,
  nome varchar(10)
);

CREATE table if not exists Localidade(
  id serial primary key,
  nome varchar(20)
);

CREATE table if not exists Cargo(
  id serial primary key,
  nome varchar(20)
);


--INSERÇÃO DE DADOS:
-- criar login
insert into login(userName, password, nivelPermissoes) values ('ROMAR1','admin001',5);

-- Criar funcionarios
-- NOTA:será criado através do procedimento construido

-- Criar especialidade
insert into especialidade(nome) values ('Pichelaria');
insert into especialidade(nome) values ('Eletricidade');
insert into especialidade(nome) values ('Fundação');
insert into especialidade(nome) values ('Estrutura');
insert into especialidade(nome) values ('Arquitetura');

-- Criar fase
insert into fase(nome) values('Arranque');
insert into fase(nome) values('Produção');
insert into fase(nome) values('Acabamentos');

-- Criar equipas
insert into equipas(nome, id_especialidade, id_fase) values('A',1,1);
insert into equipas(nome, id_especialidade, id_fase) values('B',1,2);
insert into equipas(nome, id_especialidade, id_fase) values('C',1,3);
insert into equipas(nome, id_especialidade, id_fase) values('D',2,1);
insert into equipas(nome, id_especialidade, id_fase) values('E',2,2);
insert into equipas(nome, id_especialidade, id_fase) values('F',2,3);
insert into equipas(nome, id_especialidade, id_fase) values('G',3,1);
insert into equipas(nome, id_especialidade, id_fase) values('H',3,2);
insert into equipas(nome, id_especialidade, id_fase) values('I',3,3);
insert into equipas(nome, id_especialidade, id_fase) values('J',4,1);
insert into equipas(nome, id_especialidade, id_fase) values('K',4,2);
insert into equipas(nome, id_especialidade, id_fase) values('L',4,3);
insert into equipas(nome, id_especialidade, id_fase) values('M',5,1);
insert into equipas(nome, id_especialidade, id_fase) values('N',5,2);
insert into equipas(nome, id_especialidade, id_fase) values('O',5,3);

-- Criar projeto
insert into projetos(nome, localizacao, dataInicio, dataFimPrevisto)
values('moradia1','Braga','2021-06-01','2021-06-30');
insert into projetos(nome, localizacao, dataInicio, dataFimPrevisto)
values('moradia2','Barcelos','2021-06-01','2021-06-30');
insert into projetos(nome, localizacao, dataInicio, dataFimPrevisto)
values('moradia3','Beja','2021-09-01','2021-09-30');
insert into projetos(nome, localizacao, dataInicio, dataFimPrevisto)
values('moradia4','Beja','2021-10-01','2021-10-30');


--Popular tabela Projeto-Especialidade
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (1,1,6);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (1,2,6);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (1,3,6);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (1,4,6);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (1,5,6);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (2,1,4);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (2,2,7);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (2,3,5);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (2,4,5);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (2,5,9);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (3,1,8);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (3,2,2);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (3,3,10);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (3,4,7);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (3,5,3);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (4,1,2);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (4,2,12);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (4,3,14);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (4,4,1);
insert into projeto_especialidade(id_projeto, id_especialidade, diasEstimados) values (4,5,1);

--Popular tabela Projeto-Equipa
insert into projeto_equipa(id_projeto, id_equipa) values (1,1);
insert into projeto_equipa(id_projeto, id_equipa) values (1,2);
insert into projeto_equipa(id_projeto, id_equipa) values (1,3);
insert into projeto_equipa(id_projeto, id_equipa) values (1,4);
insert into projeto_equipa(id_projeto, id_equipa) values (1,5);
insert into projeto_equipa(id_projeto, id_equipa) values (1,6);
insert into projeto_equipa(id_projeto, id_equipa) values (1,7);
insert into projeto_equipa(id_projeto, id_equipa) values (1,8);
insert into projeto_equipa(id_projeto, id_equipa) values (1,9);
insert into projeto_equipa(id_projeto, id_equipa) values (1,10);
insert into projeto_equipa(id_projeto, id_equipa) values (1,11);
insert into projeto_equipa(id_projeto, id_equipa) values (1,12);
insert into projeto_equipa(id_projeto, id_equipa) values (1,13);
insert into projeto_equipa(id_projeto, id_equipa) values (1,14);
insert into projeto_equipa(id_projeto, id_equipa) values (1,15);
insert into projeto_equipa(id_projeto, id_equipa) values (2,1);
insert into projeto_equipa(id_projeto, id_equipa) values (2,2);
insert into projeto_equipa(id_projeto, id_equipa) values (2,3);
insert into projeto_equipa(id_projeto, id_equipa) values (2,4);
insert into projeto_equipa(id_projeto, id_equipa) values (2,5);
insert into projeto_equipa(id_projeto, id_equipa) values (2,6);
insert into projeto_equipa(id_projeto, id_equipa) values (2,7);
insert into projeto_equipa(id_projeto, id_equipa) values (2,8);
insert into projeto_equipa(id_projeto, id_equipa) values (2,9);
insert into projeto_equipa(id_projeto, id_equipa) values (2,10);
insert into projeto_equipa(id_projeto, id_equipa) values (2,11);
insert into projeto_equipa(id_projeto, id_equipa) values (2,12);
insert into projeto_equipa(id_projeto, id_equipa) values (2,13);
insert into projeto_equipa(id_projeto, id_equipa) values (2,14);
insert into projeto_equipa(id_projeto, id_equipa) values (2,15);
insert into projeto_equipa(id_projeto, id_equipa) values (3,1);
insert into projeto_equipa(id_projeto, id_equipa) values (3,2);
insert into projeto_equipa(id_projeto, id_equipa) values (3,3);
insert into projeto_equipa(id_projeto, id_equipa) values (3,4);
insert into projeto_equipa(id_projeto, id_equipa) values (3,5);
insert into projeto_equipa(id_projeto, id_equipa) values (3,6);
insert into projeto_equipa(id_projeto, id_equipa) values (3,7);
insert into projeto_equipa(id_projeto, id_equipa) values (3,8);
insert into projeto_equipa(id_projeto, id_equipa) values (3,9);
insert into projeto_equipa(id_projeto, id_equipa) values (3,10);
insert into projeto_equipa(id_projeto, id_equipa) values (3,11);
insert into projeto_equipa(id_projeto, id_equipa) values (3,12);
insert into projeto_equipa(id_projeto, id_equipa) values (3,13);
insert into projeto_equipa(id_projeto, id_equipa) values (3,14);
insert into projeto_equipa(id_projeto, id_equipa) values (3,15);
insert into projeto_equipa(id_projeto, id_equipa) values (4,1);
insert into projeto_equipa(id_projeto, id_equipa) values (4,2);
insert into projeto_equipa(id_projeto, id_equipa) values (4,3);
insert into projeto_equipa(id_projeto, id_equipa) values (4,4);
insert into projeto_equipa(id_projeto, id_equipa) values (4,5);
insert into projeto_equipa(id_projeto, id_equipa) values (4,6);
insert into projeto_equipa(id_projeto, id_equipa) values (4,7);
insert into projeto_equipa(id_projeto, id_equipa) values (4,8);
insert into projeto_equipa(id_projeto, id_equipa) values (4,9);
insert into projeto_equipa(id_projeto, id_equipa) values (4,10);
insert into projeto_equipa(id_projeto, id_equipa) values (4,11);
insert into projeto_equipa(id_projeto, id_equipa) values (4,12);
insert into projeto_equipa(id_projeto, id_equipa) values (4,13);
insert into projeto_equipa(id_projeto, id_equipa) values (4,14);
insert into projeto_equipa(id_projeto, id_equipa) values (4,15);

--Criar registos diários
-- NOTA:será criado através do procedimento construido

--Inserir dados em tabelas para nomes próprios:
insert into nome_Proprio(nome) values ('João');
insert into nome_Proprio(nome) values ('Francisco');
insert into nome_Proprio(nome) values ('Santiago');
insert into nome_Proprio(nome) values ('Afonso');
insert into nome_Proprio(nome) values ('Duarte');
insert into nome_Proprio(nome) values ('Tomás');
insert into nome_Proprio(nome) values ('Martim');
insert into nome_Proprio(nome) values ('Rodrigo');
insert into nome_Proprio(nome) values ('Lourenço');
insert into nome_Proprio(nome) values ('Gabriel');
insert into nome_Proprio(nome) values ('Miguel');
insert into nome_Proprio(nome) values ('Lucas');
insert into nome_Proprio(nome) values ('Pedro');
insert into nome_Proprio(nome) values ('Dinis');
insert into nome_Proprio(nome) values ('Vicente');
insert into nome_Proprio(nome) values ('Guilherme');
insert into nome_Proprio(nome) values ('Salvador');
insert into nome_Proprio(nome) values ('Gonçalo');
insert into nome_Proprio(nome) values ('Rafael');
insert into nome_Proprio(nome) values ('Mateus');

--Inserir dados em tabelas para apelidos:
insert into Apelido(nome) values ('Silva');
insert into Apelido(nome) values ('Santos');
insert into Apelido(nome) values ('Ferreira');
insert into Apelido(nome) values ('Pereira');
insert into Apelido(nome) values ('Oliveira');
insert into Apelido(nome) values ('Costa');
insert into Apelido(nome) values ('Rodrigues');
insert into Apelido(nome) values ('Martins');
insert into Apelido(nome) values ('Jesus');
insert into Apelido(nome) values ('Sousa');
insert into Apelido(nome) values ('Fernandes');
insert into Apelido(nome) values ('Gonçalves');
insert into Apelido(nome) values ('Gomes');
insert into Apelido(nome) values ('Lopes');
insert into Apelido(nome) values ('Marques');
insert into Apelido(nome) values ('Alves');
insert into Apelido(nome) values ('Almeida');
insert into Apelido(nome) values ('Ribeiro');
insert into Apelido(nome) values ('Pinto');
insert into Apelido(nome) values ('Carvalho');

--Inserir dados em tabelas para cargo:
insert into cargo(nome) values ('Eletricista');
insert into cargo(nome) values ('Picheleiro');
insert into cargo(nome) values ('Pintor');
insert into cargo(nome) values ('Engenheiro Civil');
insert into cargo(nome) values ('Arquiteto');
insert into cargo(nome) values ('Canalizador');
insert into cargo(nome) values ('Trolha');
insert into cargo(nome) values ('Condutor/Manobrador');
insert into cargo(nome) values ('Armador de Ferro');
insert into cargo(nome) values ('Ladrilhador');

--Inserir dados em tabelas para localidades:
insert into localidade(nome) values ('Viana do Castelo');
insert into localidade(nome) values ('Braga');
insert into localidade(nome) values ('Vila Real');
insert into localidade(nome) values ('Bragança');
insert into localidade(nome) values ('Porto');
insert into localidade(nome) values ('Aveiro');
insert into localidade(nome) values ('Viseu');
insert into localidade(nome) values ('Guarda');
insert into localidade(nome) values ('Coimbra');
insert into localidade(nome) values ('Castelo Branco');
insert into localidade(nome) values ('Leiria');
insert into localidade(nome) values ('Santarém');
insert into localidade(nome) values ('Portalegre');
insert into localidade(nome) values ('Lisboa');
insert into localidade(nome) values ('Évora');
insert into localidade(nome) values ('Setubal');
insert into localidade(nome) values ('Beja');
insert into localidade(nome) values ('Faro');


--FUNÇÔES:
--Função para calcular o numero de Dias Trabalhados por especialidade num determinado projeto:
CREATE or replace FUNCTION calcularDiasTrabalhadosPorEspecialidade (especialidadeNome varchar, id_proj integer)
RETURNS integer
LANGUAGE plpgsql
AS
$$
DECLARE
    counter integer;
BEGIN
    select count(1)
        into counter
    from registoDiario r, equipas eq, especialidade esp
    where r.id_equipa = eq.id
        and eq.id_especialidade = esp.id
        and esp.nome = especialidadeNome
        and r.id_projeto = id_proj;

    return counter;
END;
$$;

--Função para calcular a percentagem geral executada dos projetos:
CREATE or replace FUNCTION calcPercentagemExecutadaProj (idProjeto integer)
RETURNS numeric (4,1)
LANGUAGE plpgsql
AS
$$
DECLARE
    result numeric (4,1) ;
BEGIN

select
    (select count(1)
    from registoDiario rd
    where rd.id_projeto = idProjeto)/
(   Select extract(epoch from ((p.dataFimPrevisto - p.dataInicio)/3600)/24)+1
    from projetos p
    where p.id = idProjeto)*100
        into result;

    return result;
END;
$$;

--Função para gerar passwords:
CREATE FUNCTION generate_random_password()
RETURNS text
LANGUAGE plpgsql
    AS $$
DECLARE
   j int4;
   result text;
   allowed text;
   allowed_len int4;
BEGIN
   allowed := '23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ&#%@';
   allowed_len := length(allowed);
   result := '';
   WHILE length(result) < 8 LOOP
      j := int4(random() * allowed_len);
      result := result || substr(allowed, j+1, 1);
   END LOOP;
   RETURN result;
END;
$$;

--Função para gerar data nascimento:
CREATE FUNCTION generate_dataNacimento()
RETURNS timestamp
LANGUAGE plpgsql
    AS $$
DECLARE
    dataNascimento timestamp;
BEGIN
   select timestamp '1965-01-01 20:00:00' +
       random() * (timestamp '2003-01-01 20:00:00'-timestamp '1965-12-31 10:00:00')
    into dataNascimento;
   RETURN dataNascimento ;
END;
$$;

--Função para gerar contacto:
CREATE or replace FUNCTION generate_random_contacto()
RETURNS text
LANGUAGE plpgsql
    AS $$
DECLARE
   j int4;
   result text;
   allowed text;
   allowed_len int4;
BEGIN
   allowed := '123456789';
   allowed_len := length(allowed);
   result := '91';
   WHILE length(result) < 9 LOOP
      j := int4(random() * allowed_len);
      result := result || substr(allowed, j+1, 1);
   END LOOP;
   RETURN result;
END;
$$;


--funçao para gerar nome completo aleatorio
CREATE or replace FUNCTION generate_random_nome_funcionario()
RETURNS text
LANGUAGE plpgsql
    AS $$
DECLARE
    i int4;
    j int4;
    result text;
BEGIN
    i := int4(random() * 19)+1;
    j := int4(random() * 19)+1;

  result := concat(
      (select nome from nome_Proprio where id = i),
      ' ',
      (select nome from apelido where id = j)
                );
   RETURN result;
END;
$$;

--funçao para gerar cargo de funcionario aleatoria
CREATE or replace FUNCTION generate_random_cargo_funcinario()
RETURNS text
LANGUAGE plpgsql
    AS $$
DECLARE
    i int4;
    result text;
BEGIN
    i := int4(random() * 9)+1;

    result := (select nome from cargo where id = i);
    RETURN result;
END;
$$;

--funçao para gerar localidade
CREATE or replace FUNCTION generate_random_localidade()
RETURNS text
LANGUAGE plpgsql
    AS $$
DECLARE
    i int4;
    result text;
BEGIN
    i := int4(random() * 17)+1;

    result := (select nome from localidade where id = i);
    RETURN result;
END;
$$;

--funçao para gerar username novo (vai ser sequencial e do genero: ROMARxxxx, xxxx sendo o numero sequencial apartir do ultimo user
CREATE or replace FUNCTION generate_username()
RETURNS text
LANGUAGE plpgsql
    AS $$
DECLARE
    i int4; --
    original_username text;
    new_number int4;
    result text;
BEGIN
    i := (select count(1) from login);
    select regexp_replace((select (userName) from login limit 1 offset (i-1)), '\D','','g') into original_username;
    select cast(original_username as int4)+1 into new_number;
    select concat('ROMAR',trim(to_char(new_number,'99999'))) into result;
    RETURN result;
END;
$$;


--PROCEDIMENTOS:
-- Procedure para criação de usuário(com uso da função para gerar password):
CREATE OR REPLACE PROCEDURE gerarUsuario(nomeUser varchar)
LANGUAGE plpgsql
AS
$$
DECLARE
    nivelPermissao integer;
BEGIN
    nivelPermissao = floor(random() * (5-1+1) + 1)::int;
    insert into login (userName, password, nivelPermissoes) values(nomeUser,generate_random_password(),nivelPermissao);
END;
$$;

-- Procedure Gerar n funcionarios aleatórios:
CREATE OR REPLACE PROCEDURE gerarFuncionario(numeroDeFuncionarios int)
LANGUAGE plpgsql
AS
$$
DECLARE
    i integer := 0;
    new_username text;
BEGIN
    loop
        exit when i = numeroDeFuncionarios;
        new_username := generate_username();
        call gerarUsuario(new_username);
        insert into funcionarios (userName, nome, cargo, localidade, dataNascimento, contacto)
        values(new_username,generate_random_nome_funcionario(), generate_random_cargo_funcinario(), generate_random_localidade(), generate_datanacimento(),generate_random_contacto());
        i := i + 1;
    end loop;
END;
$$;

--procedure para preencher a tabela das equipas_func com x funcionarios por fase (neste caso 1 para a 1a, 3 para a 2a e 2 para a 3a.
CREATE OR REPLACE PROCEDURE gerarEquipa_Funcionario()
LANGUAGE plpgsql
AS
$$
DECLARE
    equipa_record record;
    i integer := 0;
    j integer := 0;

BEGIN
    for equipa_record in SELECT * FROM equipas
    loop
        IF equipa_record.id_fase = 1
            then
                i := int4(random() * (select count(1)-1 from funcionarios)+1);
                insert into funcionario_equipa(id_equipa, id_funcionario)
                values (equipa_record.id, (select f.id from funcionarios f where f.id = i));
        elsif equipa_record.id_fase = 2
            then
            loop
                exit when j = 3;
                i := int4(random() * (select count(1)-1 from funcionarios)+1);
                insert into funcionario_equipa(id_equipa, id_funcionario)
                values (equipa_record.id, (select f.id from funcionarios f where f.id = i));
                j := j +1;
            end loop;
        else
            loop
                exit when j = 2;
                i := int4(random() * (select count(1)-1 from funcionarios)+1);
                insert into funcionario_equipa(id_equipa, id_funcionario)
                values (equipa_record.id, (select f.id from funcionarios f where f.id = i));
                j := j +1;
            end loop;
        end if;
        j := 0;
    end loop;
END;
$$;

--procedure para preencher automáticamente o registo diário:
--Função gerar dia para registo diário:
CREATE FUNCTION generate_dataRegisto(inicioIntervalo text, fimIntervalo text)
RETURNS timestamp
LANGUAGE plpgsql
AS
$$
DECLARE
    dataRegisto timestamp;
BEGIN
   select inicioIntervalo:: timestamp +
        random() * (fimIntervalo::timestamp - inicioIntervalo::timestamp)
        into dataRegisto;
   RETURN dataRegisto;
END;
$$;

--Procedure para gerar registos diários:
CREATE OR REPLACE PROCEDURE gerarRegistosDiarios(id_proj integer, inicioIntervalo text, fimIntervalo text, nRegistos integer)
LANGUAGE plpgsql
AS
$$
DECLARE
    equipa int4 := 0;
    i int4 = 0;
BEGIN
    if inicioIntervalo::timestamp > fimIntervalo::timestamp
    then i = nRegistos;
    end if;
    loop
        exit when i = nRegistos;
        equipa := int4(random() * 14)+1;
        insert into registoDiario(id_projeto, id_equipa, data)
        values(id_proj,equipa,generate_dataRegisto(inicioIntervalo,fimIntervalo));
        i := i + 1;
    end loop;
END;
$$;

--CRIAÇÂO DE VISTAS:
-- Criação de view com a percentagem geral executada por projeto:
CREATE OR REPLACE VIEW vista_PercentagemExecutada AS
    select nome, calcpercentagemexecutadaproj(p.id) as percentagemExecutada
    from projetos p;


--GERAR DADOS A PARTIR DE PARTIR DE PROCEDIMENTOS:
--Gerar funcionários:
call gerarFuncionario(20);

--Gerar relação equipa-funcionário:
call gerarEquipa_Funcionario();

--Gerar registosDiários aleatórios para um determinado projeto:
call gerarRegistosDiarios(2,'2021-06-01','2021-06-30',15);
call gerarRegistosDiarios(1,'2021-06-01','2021-06-30',20);
call gerarRegistosDiarios(3,'2021-09-01','2021-09-30',10);
call gerarRegistosDiarios(4,'2021-10-01','2021-10-30',33);

--SELECTS:
--selects para visualização de algumas tabelas:
select * from registoDiario
where id_projeto =2;
select * from login;
select * from equipas;
select * from funcionarios;
select * from registoDiario;

-- QUERIES:
-- 1.Quantos dias foram usados na totalidade no projeto 1?
select count(1)
from registoDiario
where id_projeto = 1;

-- 2. Quantos dias foram usados para a especialidade de pichelaria no projeto 1 até ao momento?
select count(1)
from registoDiario
inner join equipas e on e.id = registoDiario.id_equipa
inner join especialidade esp on e.id_especialidade = esp.id
where esp.nome = 'Pichelaria';
-- 2.Alternativa
select count(1)
from registoDiario r, equipas eq, especialidade esp
where r.id_equipa = eq.id
    and eq.id_especialidade = esp.id
    and esp.nome = 'Pichelaria';

--Uso da função de calcular o numero de Dias Trabalhados por especialidade num determinado projeto (exemplo: pichelaria no projeto 2):
select distinct registoDiario.id_projeto, calcularDiasTrabalhadosPorEspecialidade('Pichelaria', 2)
from registodiario
where id_projeto = 1;

select calcularDiasTrabalhadosPorEspecialidade('Pichelaria', 2);

--Cálculo da percentagem Executada num determinado projeto (exemplo: projeto 1):
select calcpercentagemexecutadaproj(1);

-- Query:3. Que projetos apresentam uma percentagem executada abaixo de 20% (usando view)?
select nome,percentagemExecutada
from vista_PercentagemExecutada vpe
where vpe.percentagemExecutada < 20;

-- Chamar pela view:
select * from vista_PercentagemExecutada;


-- Query:4. Quais os dias total trabalhados no projeto 1
select count(data) as id_project
from registoDiario r
where id_projeto = '1';

--Query5: Quantos dias a especialidade Pichelaria foi utilizada no projeto
select count(id_especialidade) as equipas
from registoDiario r
inner join equipas e on e.id = r.id_equipa
inner join especialidade e2 on e2.id = e.id_especialidade
where id_especialidade = '1'
and id_projeto = '1';


--Query6: A idade dos funcionarios das equipas A

select current_date
    AGE()
from funcionarios
inner join funcionario_equipa fe on funcionarios.id = fe.id_funcionario

















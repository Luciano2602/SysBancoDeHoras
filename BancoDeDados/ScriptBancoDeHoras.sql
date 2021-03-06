USE [master]
GO
/****** Object:  Database [DB_BANCO_DE_HORAS]    Script Date: 13/01/2018 18:49:49 ******/
CREATE DATABASE [DB_BANCO_DE_HORAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_BANCO_DE_HORAS', FILENAME = N'C:\Program Files\Microsoft SQL Server Atualizada\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_BANCO_DE_HORAS.mdf' , SIZE = 16576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_BANCO_DE_HORAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server Atualizada\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_BANCO_DE_HORAS_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_BANCO_DE_HORAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET  MULTI_USER 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_BANCO_DE_HORAS]
GO
/****** Object:  Table [dbo].[TblFuncionario]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblFuncionario](
	[Id_Func] [int] IDENTITY(1,1) NOT NULL,
	[Id_Pessoa] [int] NOT NULL,
	[Funcao] [varchar](30) NOT NULL,
	[Id_Gerente] [int] NULL,
	[Ativo] [bit] NULL,
	[Id_Loja] [int] NOT NULL,
	[DataContrato] [date] NULL,
 CONSTRAINT [PK_TblFuncionario_Id_Func] PRIMARY KEY CLUSTERED 
(
	[Id_Func] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblHoraFuncionario]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblHoraFuncionario](
	[Id_HF] [int] IDENTITY(1,1) NOT NULL,
	[Id_Func] [int] NOT NULL,
	[Data_Entrada] [date] NOT NULL,
	[Entrada] [time](7) NULL,
	[Ida_Almoco] [time](7) NULL,
	[Volta_Almoco] [time](7) NULL,
	[Saida] [time](7) NULL,
	[Qtd_Hora_Util] [int] NULL,
	[Folga] [bit] NULL,
	[observacao] [varchar](255) NULL,
 CONSTRAINT [PK_TblHoraFuncionario_Id_HF] PRIMARY KEY CLUSTERED 
(
	[Id_Func] ASC,
	[Data_Entrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblLogAcao]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblLogAcao](
	[Id_Acao] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](6) NOT NULL,
	[Nome_Anteriror] [varchar](60) NOT NULL,
	[Nome_Atual] [varchar](60) NOT NULL,
	[Tabela] [varchar](18) NOT NULL,
	[Id_HF] [int] NULL,
	[Data_Operacao] [datetime] NOT NULL,
	[Erro] [varchar](255) NULL,
	[Maquina] [varchar](50) NULL,
	[Data_HF] [datetime] NULL,
 CONSTRAINT [PK_TblLogAcao_Id_Acao] PRIMARY KEY CLUSTERED 
(
	[Id_Acao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblLogFuncionario]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblLogFuncionario](
	[Id_Log] [int] IDENTITY(1,1) NOT NULL,
	[Id_Func] [int] NOT NULL,
	[FuncaoAntiga] [varchar](30) NOT NULL,
	[FuncaoNova] [varchar](30) NOT NULL,
	[Id_GerenteAntigo] [int] NULL,
	[Id_GerenteNovo] [int] NULL,
	[AtivoAntigo] [bit] NULL,
	[AtivoNovo] [bit] NULL,
	[Id_LojaAntiga] [int] NOT NULL,
	[Id_LojaNova] [int] NOT NULL,
	[Maquina] [varchar](50) NULL,
	[Data] [datetime] NULL,
	[Tipo] [varchar](6) NULL,
 CONSTRAINT [PK_TblLogFuncionario_Id_Log] PRIMARY KEY CLUSTERED 
(
	[Id_Log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblLogin]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblLogin](
	[Id_Login] [int] IDENTITY(1,1) NOT NULL,
	[Id_Func] [int] NOT NULL,
	[Usuario] [varchar](25) NOT NULL,
	[Senha] [varchar](25) NOT NULL,
	[Perfil] [char](1) NOT NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_TblLogin] PRIMARY KEY CLUSTERED 
(
	[Id_Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TblLogin_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblLoja]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblLoja](
	[Id_Loja] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Razao] [varchar](100) NULL,
	[cnpj] [varchar](13) NULL,
	[Endereco] [varchar](100) NULL,
	[Ativo] [bit] NULL,
 CONSTRAINT [PK_TblLoja_Id_Loja] PRIMARY KEY CLUSTERED 
(
	[Id_Loja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TblLoja_Nome] UNIQUE NONCLUSTERED 
(
	[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblPessoa]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblPessoa](
	[Id_Pessoa] [int] IDENTITY(1,1) NOT NULL,
	[Cpf] [varchar](11) NOT NULL,
	[Nome] [varchar](60) NOT NULL,
	[Sexo] [char](1) NOT NULL,
 CONSTRAINT [PK_TblPessoa_Id_Pessoa] PRIMARY KEY CLUSTERED 
(
	[Id_Pessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TblPessoa_Cpf] UNIQUE NONCLUSTERED 
(
	[Cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblSexo]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblSexo](
	[Sexo] [char](1) NOT NULL,
 CONSTRAINT [PK_TblSexo_Sexo] PRIMARY KEY CLUSTERED 
(
	[Sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_FUNCIONARIOS_GERENCIADOS_POR]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_FUNCIONARIOS_GERENCIADOS_POR]
AS
SELECT
f.Id_Gerente as IdGerente, f1.Id_Pessoa ,f.Id_Func as IdSubordinado, Nome as Funcionario
from TblFuncionario f inner join TblFuncionario f1
on f.Id_Gerente = f1.Id_Func
inner join TblPessoa p 
on p.Id_Pessoa = f.Id_Pessoa
GO
/****** Object:  View [dbo].[VW_FUNCIOANARIO_GERENTE_NOMES]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_FUNCIOANARIO_GERENTE_NOMES]
AS
SELECT 
p.Nome as 'Nome Gerente',IdGerente,v.Id_Pessoa,IdSubordinado,Funcionario 
FROM VW_FUNCIONARIOS_GERENCIADOS_POR V INNER JOIN TblPessoa P on V.Id_Pessoa = p.Id_Pessoa

GO
/****** Object:  View [dbo].[VW_FUNCIONARIO_COMPLETO]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_FUNCIONARIO_COMPLETO]
AS
select 
F.Id_Func,Funcao,F.Ativo,L.Nome AS Loja, L.Id_Loja as IdLoja , F.Id_Gerente,P.Nome as NomeFuncionario,P.Cpf,P.Sexo,p.Id_Pessoa ,LG.Usuario,LG.Perfil, F.DataContrato
from TblFuncionario F 
INNER JOIN TblLoja L ON F.Id_Loja = L.Id_Loja
INNER JOIN TblPessoa P ON P.Id_Pessoa = F.Id_Pessoa 
LEFT JOIN TblLogin LG ON LG.Id_Func = F.Id_Func
GO
/****** Object:  View [dbo].[vw_HorasFuncionarios_teste]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_HorasFuncionarios_teste] 
as
select
Id_func as Funcionario,
Data_Entrada,
convert(varchar(5),Entrada,114) as Entrada,
convert(varchar(5),Ida_Almoco,114) as [Ida almoço],
convert(varchar(5),Volta_Almoco,114) as [Volta almoço],
convert(varchar(5),Saida,114) as Saida,
Qtd_Hora_Util as [Horas Uteis],
Folga,
isnull(((DATEDIFF(MI,Entrada,Ida_Almoco) + DATEDIFF(MI,Volta_Almoco,Saida)) - (Qtd_Hora_Util)),0) as 'Saldo devedor em minutos'
from TblHoraFuncionario
GO
/****** Object:  Index [UQ_TblLogin_id_Func]    Script Date: 13/01/2018 18:49:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_TblLogin_id_Func] ON [dbo].[TblLogin]
(
	[Id_Func] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_TblFuncionario_Id_Gerente] FOREIGN KEY([Id_Gerente])
REFERENCES [dbo].[TblFuncionario] ([Id_Func])
GO
ALTER TABLE [dbo].[TblFuncionario] CHECK CONSTRAINT [FK_TblFuncionario_Id_Gerente]
GO
ALTER TABLE [dbo].[TblFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_TblFuncionario_Id_Loja] FOREIGN KEY([Id_Loja])
REFERENCES [dbo].[TblLoja] ([Id_Loja])
GO
ALTER TABLE [dbo].[TblFuncionario] CHECK CONSTRAINT [FK_TblFuncionario_Id_Loja]
GO
ALTER TABLE [dbo].[TblFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_TblFuncionario_Id_Pessoa] FOREIGN KEY([Id_Pessoa])
REFERENCES [dbo].[TblPessoa] ([Id_Pessoa])
GO
ALTER TABLE [dbo].[TblFuncionario] CHECK CONSTRAINT [FK_TblFuncionario_Id_Pessoa]
GO
ALTER TABLE [dbo].[TblHoraFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_TblHoraFuncionario_Id_Func] FOREIGN KEY([Id_Func])
REFERENCES [dbo].[TblFuncionario] ([Id_Func])
GO
ALTER TABLE [dbo].[TblHoraFuncionario] CHECK CONSTRAINT [FK_TblHoraFuncionario_Id_Func]
GO
ALTER TABLE [dbo].[TblLogin]  WITH CHECK ADD  CONSTRAINT [FK_TblLogin_Id_Func] FOREIGN KEY([Id_Func])
REFERENCES [dbo].[TblFuncionario] ([Id_Func])
GO
ALTER TABLE [dbo].[TblLogin] CHECK CONSTRAINT [FK_TblLogin_Id_Func]
GO
ALTER TABLE [dbo].[TblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_TblPessoa_Sexo] FOREIGN KEY([Sexo])
REFERENCES [dbo].[TblSexo] ([Sexo])
GO
ALTER TABLE [dbo].[TblPessoa] CHECK CONSTRAINT [FK_TblPessoa_Sexo]
GO
ALTER TABLE [dbo].[TblLogin]  WITH CHECK ADD  CONSTRAINT [CK_TblLogin_Perfil_AE] CHECK  (([Perfil]='E' OR [Perfil]='A'))
GO
ALTER TABLE [dbo].[TblLogin] CHECK CONSTRAINT [CK_TblLogin_Perfil_AE]
GO
ALTER TABLE [dbo].[TblSexo]  WITH CHECK ADD  CONSTRAINT [CK_TblSexo_Sexo_MF] CHECK  (([Sexo]='F' OR [Sexo]='M'))
GO
ALTER TABLE [dbo].[TblSexo] CHECK CONSTRAINT [CK_TblSexo_Sexo_MF]
GO
/****** Object:  StoredProcedure [dbo].[PR_ALTERAR_HORA_FUNCIONARIO_ID_FUNC_DATA_ENTRADA]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_ALTERAR_HORA_FUNCIONARIO_ID_FUNC_DATA_ENTRADA]
@idFunc int,
@dataEntrada date,
@entrada time,
@idaAlmoco time,
@voltaAlmoco time,
@saida time,
@horasUteis int,
@folga bit,
@obs varchar(255)
as
	if(@horasUteis = 6)
		set @horasUteis = (@horasUteis * 60) - 15 
	else
		set @horasUteis = @horasUteis * 60 

	IF(@folga = 1)
		UPDATE TblHoraFuncionario SET
		Data_Entrada = @dataEntrada, Entrada = '00:00', Ida_Almoco = '00:00', Volta_Almoco = '00:00',Saida = '00:00', 
		Qtd_Hora_Util = @horasUteis, Folga = 1, observacao = @obs
		WHERE Id_Func = @idFunc AND Data_Entrada = @dataEntrada
	ELSE
		UPDATE TblHoraFuncionario SET
		Data_Entrada = @dataEntrada, Entrada = @entrada, Ida_Almoco = @idaAlmoco, Volta_Almoco = @voltaAlmoco,Saida = @saida, 
		Qtd_Hora_Util = @horasUteis, Folga = 0, observacao = @obs
		WHERE Id_Func = @idFunc AND Data_Entrada = @dataEntrada


GO
/****** Object:  StoredProcedure [dbo].[PR_ALTERAR_PESSOA_E_FUNCIONARIO_ID_FUNC]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_ALTERAR_PESSOA_E_FUNCIONARIO_ID_FUNC]
--pessoas 
@Cpf varchar(11),
@Nome varchar(60),
@sexo char(1),
--Funcionario
@idFunc int,
@funcao varchar(30),
@IdGerente int,
@ativo bit,
@idLoja int,
@dataContrato date

as
	BEGIN TRAN
	declare @idPessoa int = (select Id_Pessoa from TblFuncionario where Id_Func = @idFunc)

	if(@IdGerente = '')
		set @IdGerente = null;

	update TblFuncionario set 
	Funcao = @funcao, Id_Gerente = @IdGerente, Ativo = @ativo, Id_Loja = @idLoja, DataContrato = @dataContrato
	where Id_Func = @idFunc

	update TblPessoa set
	Cpf = @Cpf, Nome = @Nome,Sexo = @sexo
	where Id_Pessoa = @idPessoa

	IF @@ERROR = 0
		COMMIT
	ELSE
		ROLLBACK


GO
/****** Object:  StoredProcedure [dbo].[PR_INSERIR_HORA_FUNCIONARIO]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_INSERIR_HORA_FUNCIONARIO]
@idFunc int,
@dataEntrada date,
@entrada time,
@idaAlmoco time,
@voltaAlmoco time,
@saida time,
@horasUteis int,
@folga bit,
@obs varchar(255)
as
	
	if(@horasUteis = 6)
		set @horasUteis = (@horasUteis * 60) - 15 -- alterei aqui era +15
	else
		set @horasUteis = @horasUteis * 60 
	IF (@folga = 1)
		INSERT INTO TblHoraFuncionario (Id_Func,Data_Entrada,Entrada,Ida_Almoco,Volta_Almoco,Saida,Qtd_Hora_Util,Folga,observacao)
		VALUES
		(@idFunc,@dataEntrada,'00:00','00:00','00:00','00:00',@horasUteis,1,@obs)
	ELSE
		INSERT INTO TblHoraFuncionario (Id_Func,Data_Entrada,Entrada,Ida_Almoco,Volta_Almoco,Saida,Qtd_Hora_Util,Folga, observacao)
		VALUES
		(@idFunc,@dataEntrada,@entrada,@idaAlmoco,@voltaAlmoco,@saida,@horasUteis,0, @obs)

GO
/****** Object:  StoredProcedure [dbo].[PR_INSERIR_PESSOA_E_FUNCIONARIO]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext PR_INSERIR_PESSOA_E_FUNCIONARIO

CREATE PROC [dbo].[PR_INSERIR_PESSOA_E_FUNCIONARIO]
--pessoas 
@Cpf varchar(11),
@Nome varchar(60),
@sexo char(1),
--Funcionario
@funcao varchar(30),
@IdGerente int,
@idLoja int,
@dataContrato date
as	
	DECLARE @X TABLE (IdPessoa INT)
	--DECLARE @CONT INT = 0
	
	--VALIDANDO SE TEM GERENTE CADASTRADO NA LOJA
	--IF(@funcao = 'GERENTE')		
		--SET @CONT = (SELECT COUNT(*) FROM TblFuncionario WHERE Id_Loja = @idLoja)
		
	--IF(@CONT <= 0)
	--BEGIN		
		
		BEGIN TRAN

		INSERT INTO TblPessoa (Cpf,Nome,Sexo)
		--essa linha vai pegar o idPessoa que é gerado pelo identity e seta na table @x, no campo da tabela idPessoa
		output inserted.Id_Pessoa into @X
		VALUES
		(@Cpf,@Nome,@sexo)
	
		if(@IdGerente = '')
			set @IdGerente = null;
	
		INSERT INTO TblFuncionario (Id_Pessoa,Funcao,Id_Gerente,Ativo,Id_Loja, DataContrato)
		VALUES
		( (SELECT IdPessoa FROM @X),@funcao,@IdGerente,1,@idLoja,@dataContrato)
				
		IF @@ERROR = 0
			COMMIT
		ELSE
			ROLLBACK	

		--PRINT (SELECT IdPessoa from @X)
	--END
	


GO
/****** Object:  StoredProcedure [dbo].[PR_SALDO_EM_HORA_FUNCIONARIO]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_SALDO_EM_HORA_FUNCIONARIO]
@dataIncio date,
@dataFinal date,
@IdFunc int
as
	--VERIFICANDO SE A DATA É VALIDA, CASO OS PARAMETROS DA DATA SEJA POSTERIORES A DATA ATUAL O PROC NÃO EXECUTA
	if (@dataIncio > GETDATE() or @dataFinal < @dataIncio)
		select '(Datas) Valores inválidoS' AS ERRO
	
	ELSE
	BEGIN

		declare @qtdMinutos int = (
									select SUM( [Saldo devedor em minutos] ) 
									from vw_HorasFuncionarios_teste
									where Funcionario = @IdFunc and (Data_Entrada >= @dataIncio and Data_Entrada <= @dataFinal)
									);

		if (@qtdMinutos < 0)
		BEGIN
			--ESSE BLOCO TODO É NEGATIVO
			SET @qtdMinutos = @qtdMinutos * -1

			if(@qtdMinutos <=9)
				select 
				'-00:' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(2)),2)
				as Saldo1
			ELSE IF (@qtdMinutos <=59)
				select
					'-00:' + RIGHT(CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo2
			ELSE
				SELECT
				RIGHT('-' + CAST((@qtdMinutos / 60) as varchar(2)),3) + ':' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo3									
		END
		ELSE
		BEGIN
			-- ESSE BLOCO É POSITIVO
			if(@qtdMinutos <=9)
				select 
				'00:' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(2)),2)
				as Saldo4
			ELSE IF (@qtdMinutos <=59)
				select
					'00:' + RIGHT(CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo5
			ELSE
				SELECT
				RIGHT(CAST((@qtdMinutos / 60) as varchar(2)),2) + ':' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo6
		END
     END

GO
/****** Object:  StoredProcedure [dbo].[PR_SALDO_EM_HORA_FUNCIONARIO_INTEGRAL_Finale]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_SALDO_EM_HORA_FUNCIONARIO_INTEGRAL_Finale]  --
@IdFunc int
as
	
	BEGIN	
		declare @qtdMinutos int = (
									select SUM( [Saldo devedor em minutos] ) 
									from vw_HorasFuncionarios_teste AS HR INNER JOIN TblFuncionario AS F
									ON HR.Funcionario = F.Id_Func
									where Funcionario = @IdFunc and F.DataContrato <= GETDATE()
									);

		if (@qtdMinutos < 0)
		BEGIN
			--ESSE BLOCO TODO É NEGATIVO
			SET @qtdMinutos = @qtdMinutos * -1

			if(@qtdMinutos <=9)
				select 
				'-00:' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(2)),2)
				as Saldo1
			ELSE IF (@qtdMinutos <=59)
				select
					'-00:' + RIGHT(CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo2
			ELSE
				SELECT
				RIGHT('-' + CAST((@qtdMinutos / 60) as varchar(2)),3) + ':' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo3									
		END
		ELSE
		BEGIN
			-- ESSE BLOCO É POSITIVO
			if(@qtdMinutos <=9)
				select 
				'00:' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(2)),2)
				as Saldo4
			ELSE IF (@qtdMinutos <=59)
				select
					'00:' + RIGHT(CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo5
			ELSE
				SELECT
				RIGHT(CAST((@qtdMinutos / 60) as varchar(2)),2) + ':' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo6
		END
	END
		
GO
/****** Object:  StoredProcedure [dbo].[PR_SALDO_EM_HORA_FUNCIONARIO_POR_MES]    Script Date: 13/01/2018 18:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helpText 'PR_SALDO_EM_HORA_FUNCIONARIO_POR_MES'
--GO

-- AINDA NÃO SALVEI
CREATE PROC [dbo].[PR_SALDO_EM_HORA_FUNCIONARIO_POR_MES]
@nomeMes varchar(20),
@IdFunc int,
@ano int
as
	BEGIN

		declare @qtdMinutos int = (
									select SUM( [Saldo devedor em minutos] ) 
									from vw_HorasFuncionarios_teste
									where Funcionario = @IdFunc and DATENAME(MONTH,Data_Entrada) = @nomeMes and DATENAME(YEAR,Data_Entrada) = @ano
									);

		if (@qtdMinutos < 0)
		BEGIN
			--ESSE BLOCO TODO É NEGATIVO
			SET @qtdMinutos = @qtdMinutos * -1

			if(@qtdMinutos <=9)
				select 
				'-00:' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(2)),2)
				as Saldo1
			ELSE IF (@qtdMinutos <=59)
				select
					'-00:' + RIGHT(CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo2
			ELSE 
				SELECT
				RIGHT('-' + CAST((@qtdMinutos / 60) as varchar(2)),3) + ':' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo3									
		END
		ELSE
		BEGIN
			-- ESSE BLOCO É POSITIVO
			if(@qtdMinutos <=9)
				select 
				'00:' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(2)),2)
				as Saldo4
			ELSE IF (@qtdMinutos <=59)
				select
					'00:' + RIGHT(CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo5
			ELSE
				SELECT
				RIGHT(CAST((@qtdMinutos / 60) as varchar(2)),2) + ':' + RIGHT('0' + CAST((@qtdMinutos % 60) as varchar(3)),2)
				as Saldo6
		END
     END

GO
USE [master]
GO
ALTER DATABASE [DB_BANCO_DE_HORAS] SET  READ_WRITE 
GO

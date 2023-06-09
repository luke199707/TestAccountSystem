USE [master]
GO
/****** Object:  Database [TestAccountSystem]    Script Date: 2021/10/25 15:38:23 ******/
CREATE DATABASE [TestAccountSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestAccountSystem', FILENAME = N'D:\SQLserver2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestAccountSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestAccountSystem_log', FILENAME = N'D:\SQLserver2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestAccountSystem_log.ldf' , SIZE = 32448KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestAccountSystem] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestAccountSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestAccountSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestAccountSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestAccountSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestAccountSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestAccountSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestAccountSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestAccountSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestAccountSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestAccountSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestAccountSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestAccountSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestAccountSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestAccountSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestAccountSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestAccountSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestAccountSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestAccountSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestAccountSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestAccountSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestAccountSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestAccountSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestAccountSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestAccountSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [TestAccountSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TestAccountSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestAccountSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestAccountSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestAccountSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TestAccountSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestAccountSystem', N'ON'
GO
ALTER DATABASE [TestAccountSystem] SET QUERY_STORE = OFF
GO
USE [TestAccountSystem]
GO
/****** Object:  Table [dbo].[AllUser]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](20) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[email] [nvarchar](20) NOT NULL,
	[roleId] [int] NOT NULL,
	[state] [bit] NOT NULL,
	[isUseful] [bit] NOT NULL,
	[remark] [nvarchar](50) NULL,
	[realName] [nvarchar](20) NULL,
	[remark1] [nvarchar](50) NULL,
 CONSTRAINT [PK_AllUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessType]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessNumber] [varchar](30) NOT NULL,
	[BusinessName] [varchar](30) NOT NULL,
	[K1] [decimal](5, 3) NOT NULL,
	[K2] [decimal](5, 3) NOT NULL,
	[K3] [decimal](5, 3) NOT NULL,
	[K4] [decimal](5, 3) NOT NULL,
	[K5] [decimal](5, 3) NOT NULL,
	[C1] [decimal](5, 3) NOT NULL,
	[C2] [decimal](5, 3) NOT NULL,
	[C3] [decimal](5, 3) NOT NULL,
	[C4] [decimal](5, 3) NOT NULL,
	[C5] [decimal](5, 3) NOT NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChargeProject]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChargeProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterNumber] [varchar](30) NOT NULL,
	[BusinessNumber] [varchar](30) NOT NULL,
	[BusinessName] [varchar](30) NOT NULL,
	[ProjectNumber] [varchar](30) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[BillingUnit] [varchar](10) NOT NULL,
	[BillingPrice] [decimal](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_ChargeProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[codeRegulation]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codeRegulation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[prefix] [nvarchar](50) NULL,
	[connector1] [nvarchar](10) NULL,
	[timeType] [nvarchar](50) NULL,
	[connector2] [nvarchar](10) NULL,
	[digistNum] [int] NULL,
	[startSerial] [nvarchar](50) NULL,
	[example] [nvarchar](50) NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
 CONSTRAINT [PK_codeRegulation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](15) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[email] [nvarchar](20) NOT NULL,
	[customerNumber] [nvarchar](15) NULL,
	[address] [nvarchar](50) NULL,
	[companyName] [nvarchar](50) NULL,
	[openUnit] [nvarchar](20) NULL,
	[bankAccount] [nvarchar](20) NULL,
	[legalPerson] [nvarchar](10) NULL,
	[phone] [nvarchar](11) NULL,
	[state] [bit] NOT NULL,
	[isUseFul] [bit] NOT NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dId] [nvarchar](50) NOT NULL,
	[unitId] [nvarchar](50) NOT NULL,
	[dName] [nvarchar](20) NOT NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DictInfo]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DictInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
 CONSTRAINT [PK_DictInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunctionModel]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionModel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[currentId] [nvarchar](10) NOT NULL,
	[url] [nvarchar](50) NOT NULL,
	[css] [nvarchar](50) NULL,
	[target] [nvarchar](10) NOT NULL,
	[remark] [nvarchar](50) NULL,
 CONSTRAINT [PK_FunctionModel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionRegistration]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionRegistration](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RegisterNumber] [varchar](30) NULL,
	[ShipRegistrationNumber] [varchar](30) NULL,
	[ApplicantCompany] [varchar](50) NULL,
	[Applicant] [varchar](50) NULL,
	[ApplicationProject] [varchar](30) NULL,
	[TaxpayerIdentificationNumber] [varchar](30) NULL,
	[ApplicantCompanyAddress] [varchar](30) NULL,
	[ApplicantPhone] [varchar](30) NULL,
	[BankAccount] [varchar](30) NULL,
	[BusinessName] [varchar](30) NULL,
	[InspectionName] [varchar](30) NULL,
	[InspectionDate] [datetime] NULL,
	[OrderDate] [datetime] NULL,
	[Currency] [varchar](10) NULL,
	[Amount] [decimal](12, 2) NULL,
	[Surveyor] [varchar](10) NULL,
	[Status] [varchar](10) NULL,
	[Reviewer] [varchar](10) NULL,
	[Remark] [varchar](50) NULL,
	[cashier] [varchar](50) NULL,
	[reason] [nvarchar](500) NULL,
	[payer] [nvarchar](50) NULL,
	[payTime] [datetime] NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
 CONSTRAINT [PK_InspectionRegistration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectLog]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogNumber] [varchar](30) NOT NULL,
	[RegisterNumber] [varchar](30) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Location] [varchar](30) NOT NULL,
	[Inspector] [varchar](30) NOT NULL,
	[InspectionContent] [varchar](max) NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_InspectLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectProject]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessNumber] [varchar](30) NOT NULL,
	[BusinessName] [varchar](30) NOT NULL,
	[ProjectNumber] [varchar](30) NOT NULL,
	[ProjectName] [varchar](50) NOT NULL,
	[BillingUnit] [varchar](10) NOT NULL,
	[BillingPrice] [decimal](10, 2) NOT NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_InspectProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QandA]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QandA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](500) NULL,
	[answer] [nvarchar](500) NULL,
	[remark1] [nvarchar](500) NULL,
	[remark2] [nvarchar](500) NULL,
	[remark3] [nvarchar](500) NULL,
 CONSTRAINT [PK_QandA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleInfo]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NOT NULL,
	[roleName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_RoleInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleRightInfo]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleRightInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NOT NULL,
	[rightCode] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_RoleRightInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipInfo]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterNumber] [varchar](30) NULL,
	[ShipRegistrationNumber] [varchar](30) NULL,
	[ShipName] [varchar](30) NULL,
	[Flag] [varchar](30) NULL,
	[ShipClass] [varchar](30) NULL,
	[SailArea] [varchar](30) NULL,
	[SeaRiverShip] [varchar](10) NULL,
	[OrdinanceShip] [varchar](30) NULL,
	[CompletionDate] [datetime] NULL,
	[ShipType] [varchar](30) NULL,
	[GrossTonnage] [varchar](30) NULL,
	[Deadweight] [varchar](30) NULL,
	[ShipLength] [varchar](30) NULL,
	[TypeWidth] [varchar](30) NULL,
	[TypeDepth] [varchar](30) NULL,
	[TotalHostPower] [varchar](30) NULL,
	[TotalPower] [varchar](30) NULL,
	[HostType] [varchar](30) NULL,
	[ShipMaterial] [varchar](30) NULL,
	[IceStrengthening] [varchar](30) NULL,
	[SidePushDevice] [varchar](30) NULL,
	[PropellerType] [varchar](30) NULL,
	[Gearbox] [varchar](30) NULL,
	[HydraulicTransmission] [varchar](30) NULL,
	[AutomationPower] [varchar](30) NULL,
	[AutomationLevel] [varchar](30) NULL,
	[TotalRefrigeratedVolume] [varchar](30) NULL,
	[NumberOfRefrigeratedCompartments] [varchar](30) NULL,
	[NumberOfRefrigeratedUnits] [varchar](30) NULL,
	[BallastTankCapacity] [varchar](30) NULL,
	[NumberOfCrew] [varchar](30) NULL,
	[NumberOfPassengers] [varchar](30) NULL,
	[TotalVolumeOfLiquefiedGasTank] [varchar](30) NULL,
	[AdditionalSign] [varchar](30) NULL,
	[FireProofLevel] [varchar](30) NULL,
	[DynamicPositioningSystem] [varchar](30) NULL,
	[AdjustmentFactor] [varchar](30) NULL,
	[OtherInformation] [varchar](max) NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_ShipInfo_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipInfoOld]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipInfoOld](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterNumber] [varchar](30) NULL,
	[ShipRegistrationNumber] [varchar](30) NULL,
	[ShipName] [varchar](30) NULL,
	[Flag] [varchar](30) NULL,
	[ShipClass] [varchar](30) NULL,
	[SailArea] [varchar](30) NULL,
	[SeaRiverShip] [varchar](10) NULL,
	[OrdinanceShip] [varchar](10) NULL,
	[CompletionDate] [date] NULL,
	[ShipType] [varchar](30) NULL,
	[GrossTonnage] [decimal](10, 1) NULL,
	[Deadweight] [decimal](10, 1) NULL,
	[ShipLength] [decimal](6, 2) NULL,
	[TypeWidth] [decimal](6, 2) NULL,
	[TypeDepth] [decimal](5, 2) NULL,
	[TotalHostPower] [decimal](10, 1) NULL,
	[TotalPower] [decimal](10, 1) NULL,
	[HostType] [varchar](30) NULL,
	[ShipMaterial] [varchar](30) NULL,
	[IceStrengthening] [varchar](10) NULL,
	[SidePushDevice] [varchar](10) NULL,
	[PropellerType] [varchar](10) NULL,
	[Gearbox] [varchar](10) NULL,
	[HydraulicTransmission] [varchar](10) NULL,
	[AutomationPower] [varchar](10) NULL,
	[AutomationLevel] [varchar](10) NULL,
	[TotalRefrigeratedVolume] [decimal](10, 1) NULL,
	[NumberOfRefrigeratedCompartments] [int] NULL,
	[NumberOfRefrigeratedUnits] [int] NULL,
	[BallastTankCapacity] [decimal](10, 1) NULL,
	[NumberOfCrew] [int] NULL,
	[NumberOfPassengers] [int] NULL,
	[TotalVolumeOfLiquefiedGasTank] [decimal](10, 1) NULL,
	[AdditionalSign] [varchar](30) NULL,
	[FireProofLevel] [varchar](10) NULL,
	[DynamicPositioningSystem] [varchar](30) NULL,
	[AdjustmentFactor] [decimal](6, 3) NULL,
	[OtherInformation] [varchar](max) NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_ShipInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TALog]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TALog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Operation] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Time1] [datetime] NULL,
	[Ip] [nvarchar](50) NULL,
	[Remark] [nvarchar](50) NULL,
	[IpDesc] [nvarchar](50) NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
 CONSTRAINT [PK_TALog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitInfo]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unitId] [nvarchar](50) NOT NULL,
	[unitName] [nvarchar](50) NOT NULL,
	[unitLevel] [nvarchar](10) NULL,
	[superiorUnits] [nvarchar](50) NULL,
	[postalCode] [nvarchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[rmbOpenUnit] [nvarchar](20) NULL,
	[rankAccount] [nvarchar](20) NULL,
	[wOpenUnit] [nvarchar](50) NULL,
	[wbankAccount] [nvarchar](50) NULL,
	[faxNumber] [nvarchar](20) NULL,
	[unitEmaill] [nvarchar](20) NULL,
	[person] [nvarchar](20) NULL,
	[pPhone] [nvarchar](11) NULL,
	[bankOfDeposit] [nvarchar](50) NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
	[remark3] [nvarchar](50) NULL,
	[remark4] [nvarchar](50) NULL,
	[remark5] [nvarchar](50) NULL,
	[remark6] [nvarchar](50) NULL,
	[remark7] [nvarchar](50) NULL,
 CONSTRAINT [PK_UnitInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](18) NOT NULL,
	[userName] [nvarchar](20) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[realName] [nvarchar](20) NULL,
	[Sex] [bit] NULL,
	[pNumber] [nvarchar](20) NULL,
	[email] [nvarchar](20) NULL,
	[phone] [nvarchar](11) NULL,
	[createTime] [datetime] NOT NULL,
	[roleId] [int] NULL,
	[dId] [int] NULL,
	[delState] [bit] NOT NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRight]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](18) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[remark1] [nvarchar](50) NULL,
	[remark2] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserRight] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AllUser] ON 

INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (2, N'sa             ', N'202cb962ac59075b964b07152d234b70', N'sasa@qq.com', 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (3, N'zhw            ', N'202cb962ac59075b964b07152d234b70', N'1429180372@qq.com', 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (5, N'admin', N'202cb962ac59075b964b07152d234b70', N'admin@163.com', 5, 1, 1, NULL, N'管理员', NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (41, N'ycs', N'202cb962ac59075b964b07152d234b70', N'318636483@126.com', 2, 1, 1, N'35', N'验船师2', NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (54, N'leader', N'202cb962ac59075b964b07152d234b70', N'67336523@163.com', 3, 1, 1, NULL, N'单位领导', NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (78, N'ycs1', N'202cb962ac59075b964b07152d234b70', N'2217084568@163.com', 2, 1, 1, N'35', N'验船师1', NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (79, N'cw', N'202cb962ac59075b964b07152d234b70', N'354847666@qq.com', 4, 1, 1, N'36', N'财务1', NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (81, N'cw1', N'202cb962ac59075b964b07152d234b70', N'2234843242@163.com', 4, 1, 1, N'36', N'财务2', NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (82, N'yph', N'202cb962ac59075b964b07152d234b70', N'462274623@163.com', 2, 1, 1, N'35', N'于普贺', NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (83, N'zjh', N'82b5f6802b727b0d948d38cbccd48904', N'2509824873@qq.com', 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (84, N'luke', N'202cb962ac59075b964b07152d234b70', N'250982483@qq.com', 0, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[AllUser] ([id], [userName], [pwd], [email], [roleId], [state], [isUseful], [remark], [realName], [remark1]) VALUES (89, N'996', N'0b8aff0438617c055eb55f0ba5d226fa', N'18296137364@126.com', 0, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AllUser] OFF
SET IDENTITY_INSERT [dbo].[BusinessType] ON 

INSERT [dbo].[BusinessType] ([ID], [BusinessNumber], [BusinessName], [K1], [K2], [K3], [K4], [K5], [C1], [C2], [C3], [C4], [C5], [Remark]) VALUES (5, N'003', N'初次入级（国轮）', CAST(0.900 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), CAST(1.000 AS Decimal(5, 3)), N'')
INSERT [dbo].[BusinessType] ([ID], [BusinessNumber], [BusinessName], [K1], [K2], [K3], [K4], [K5], [C1], [C2], [C3], [C4], [C5], [Remark]) VALUES (6, N'004', N'初次入级外（国轮）', CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), CAST(0.900 AS Decimal(5, 3)), N'')
SET IDENTITY_INSERT [dbo].[BusinessType] OFF
SET IDENTITY_INSERT [dbo].[ChargeProject] ON 

INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (147, N'IRF20210126000013', N'003', N'初次入级（国轮）', N'003.005', N'货物冷藏装置建造检验（Ref.install S.during con.）', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (148, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (149, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (150, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (151, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (152, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (153, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (154, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (155, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (156, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (157, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (158, N'IRF20210130000015', N'004', N'初次入级外（国轮）', N'004.011', N'货船船员舱室设备建造检验', N'次', CAST(4300.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (159, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.014', N'货船设备安全建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (160, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.015', N'航行安全证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (161, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.016', N'客船安全建造检验', N'次', CAST(5800.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (162, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.017', N'客船乘客定额及舱室设备建造检验', N'次', CAST(6400.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (163, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.018', N'原油洗舱效用建造检验', N'次', CAST(3600.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (164, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.019', N'国际防止生活污水污染建造检验', N'次', CAST(6300.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (165, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.020', N'散装危险化学品建造检验', N'次', CAST(6200.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (166, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.021', N'SOLAS II-2危险货物适装建造检验', N'次', CAST(6800.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (167, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.022', N'船舶IMSBC建造检验', N'次', CAST(3500.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (168, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.023', N'船舶PSPC建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (169, N'IRF20210130000016', N'003', N'初次入级（国轮）', N'003.024', N'压载水管理证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (170, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.027', N'签发试航证书检验', N'次', CAST(1100.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (171, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.028', N'客船船员舱室设备建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (172, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.029', N'国际防止油污建造检验', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (173, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.031', N'国际防止生活垃圾污染建造检验', N'次', CAST(4900.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (174, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.032', N'液化气体载运建造检验', N'次', CAST(4600.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (175, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.033', N'船舶防污底系统建造检验', N'次', CAST(5500.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (176, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.034', N'船舶有害物质检验发证建造检验', N'次', CAST(3900.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (177, N'IRF20210130000017', N'003', N'初次入级（国轮）', N'003.035', N'IAPP检验', N'次', CAST(2600.00 AS Decimal(10, 2)), 1, N'管理员')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (178, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (179, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (180, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (181, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (182, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (183, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (184, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (185, N'IRF20210130000018', N'004', N'初次入级外（国轮）', N'004.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (186, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (187, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (188, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (189, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (190, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (191, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (192, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (193, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (194, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (195, N'IRF20210130000019', N'003', N'初次入级（国轮）', N'003.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (196, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (197, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (198, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (199, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (200, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (201, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (202, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (203, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (204, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (205, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (206, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.011', N'货船船员舱室设备建造检验', N'次', CAST(4300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (207, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.012', N'货船构造安全建造检验', N'次', CAST(3300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (208, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.013', N'货船无线电安全建造检验', N'次', CAST(2900.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (209, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.014', N'货船设备安全建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (210, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.015', N'航行安全证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (211, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.016', N'客船安全建造检验', N'次', CAST(5800.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (212, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.017', N'客船乘客定额及舱室设备建造检验', N'次', CAST(6400.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (213, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.018', N'原油洗舱效用建造检验', N'次', CAST(3600.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (214, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.019', N'国际防止生活污水污染建造检验', N'次', CAST(6300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (215, N'IRF20210130000020', N'004', N'初次入级外（国轮）', N'004.020', N'散装危险化学品建造检验', N'次', CAST(6200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (216, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (217, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (218, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (219, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (220, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (221, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (222, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (223, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (224, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (225, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (226, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.011', N'货船船员舱室设备建造检验', N'次', CAST(4300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (227, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.012', N'货船构造安全建造检验', N'次', CAST(3300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (228, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.013', N'货船无线电安全建造检验', N'次', CAST(2900.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (229, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.014', N'货船设备安全建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (230, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.015', N'航行安全证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (231, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.016', N'客船安全建造检验', N'次', CAST(5800.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (232, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.017', N'客船乘客定额及舱室设备建造检验', N'次', CAST(6400.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (233, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.018', N'原油洗舱效用建造检验', N'次', CAST(3600.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (234, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.019', N'国际防止生活污水污染建造检验', N'次', CAST(6300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (235, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.020', N'散装危险化学品建造检验', N'次', CAST(6200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (236, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.021', N'SOLAS II-2危险货物适装建造检验', N'次', CAST(6800.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (237, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.022', N'船舶IMSBC建造检验', N'次', CAST(3500.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (238, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.023', N'船舶PSPC建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (239, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.024', N'压载水管理证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (240, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.025', N'签发新造船EEDI符合声明', N'次', CAST(1200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (241, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.026', N'船舶起重设备建造检验', N'次', CAST(3700.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (242, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.027', N'签发试航证书检验', N'次', CAST(1100.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (243, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.028', N'客船船员舱室设备建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (244, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.029', N'国际防止油污建造检验', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (245, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.030', N'国际控制散装有毒液体物质污染建造检验', N'次', CAST(6600.00 AS Decimal(10, 2)), 1, N'张俊辉')
GO
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (246, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.031', N'国际防止生活垃圾污染建造检验', N'次', CAST(4900.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (247, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.032', N'液化气体载运建造检验', N'次', CAST(4600.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (248, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.033', N'船舶防污底系统建造检验', N'次', CAST(5500.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (249, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.034', N'船舶有害物质检验发证建造检验', N'次', CAST(3900.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (250, N'IRF20210130000021', N'003', N'初次入级（国轮）', N'003.035', N'IAPP检验', N'次', CAST(2600.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (251, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.019', N'国际防止生活污水污染建造检验', N'次', CAST(6300.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (252, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.020', N'散装危险化学品建造检验', N'次', CAST(6200.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (253, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.021', N'SOLAS II-2危险货物适装建造检验', N'次', CAST(6800.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (254, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.022', N'船舶IMSBC建造检验', N'次', CAST(3500.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (255, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.023', N'船舶PSPC建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (256, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.024', N'压载水管理证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (257, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.025', N'签发新造船EEDI符合声明', N'次', CAST(1200.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (258, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.026', N'船舶起重设备建造检验', N'次', CAST(3700.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (259, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.027', N'签发试航证书检验', N'次', CAST(1100.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (260, N'IRF20210130000022', N'003', N'初次入级（国轮）', N'003.028', N'客船船员舱室设备建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (261, N'IRF20210127000014', N'003', N'初次入级（国轮）', N'003.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (262, N'IRF20210127000014', N'003', N'初次入级（国轮）', N'003.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (263, N'IRF20210127000014', N'003', N'初次入级（国轮）', N'003.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (264, N'IRF20210127000014', N'003', N'初次入级（国轮）', N'003.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (265, N'IRF20210127000014', N'003', N'初次入级（国轮）', N'003.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (266, N'IRF20210127000014', N'003', N'初次入级（国轮）', N'003.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (267, N'IRF20210127000014', N'003', N'初次入级（国轮）', N'003.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'周宏旺')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (268, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (269, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (270, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (271, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (272, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (273, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (274, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (275, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (276, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (277, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (278, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.011', N'货船船员舱室设备建造检验', N'次', CAST(4300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (279, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.012', N'货船构造安全建造检验', N'次', CAST(3300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (280, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.013', N'货船无线电安全建造检验', N'次', CAST(2900.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (281, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.014', N'货船设备安全建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (282, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.015', N'航行安全证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (283, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.016', N'客船安全建造检验', N'次', CAST(5800.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (284, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.017', N'客船乘客定额及舱室设备建造检验', N'次', CAST(6400.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (285, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.018', N'原油洗舱效用建造检验', N'次', CAST(3600.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (286, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.019', N'国际防止生活污水污染建造检验', N'次', CAST(6300.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (287, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.020', N'散装危险化学品建造检验', N'次', CAST(6200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (288, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.021', N'SOLAS II-2危险货物适装建造检验', N'次', CAST(6800.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (289, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.022', N'船舶IMSBC建造检验', N'次', CAST(3500.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (290, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.023', N'船舶PSPC建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (291, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.024', N'压载水管理证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (292, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.025', N'签发新造船EEDI符合声明', N'次', CAST(1200.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (293, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.026', N'船舶起重设备建造检验', N'次', CAST(3700.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (294, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.027', N'签发试航证书检验', N'次', CAST(1100.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (295, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.028', N'客船船员舱室设备建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (296, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.029', N'国际防止油污建造检验', N'次', CAST(2000.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (297, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.030', N'国际控制散装有毒液体物质污染建造检验', N'次', CAST(6600.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (298, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.031', N'国际防止生活垃圾污染建造检验', N'次', CAST(4900.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (299, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.032', N'液化气体载运建造检验', N'次', CAST(4600.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (300, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.033', N'船舶防污底系统建造检验', N'次', CAST(5500.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (301, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.034', N'船舶有害物质检验发证建造检验', N'次', CAST(3900.00 AS Decimal(10, 2)), 1, N'张俊辉')
INSERT [dbo].[ChargeProject] ([ID], [RegisterNumber], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Quantity], [Remark]) VALUES (302, N'IRF20210131000024', N'003', N'初次入级（国轮）', N'003.035', N'IAPP检验', N'次', CAST(2600.00 AS Decimal(10, 2)), 1, N'张俊辉')
SET IDENTITY_INSERT [dbo].[ChargeProject] OFF
SET IDENTITY_INSERT [dbo].[codeRegulation] ON 

INSERT [dbo].[codeRegulation] ([id], [name], [prefix], [connector1], [timeType], [connector2], [digistNum], [startSerial], [example], [remark1], [remark2]) VALUES (8, N'分社编码规则', N'UN', N'_', N'yyyyMM', N'_', 4, N'0001', N'UN_202011_0001', NULL, NULL)
INSERT [dbo].[codeRegulation] ([id], [name], [prefix], [connector1], [timeType], [connector2], [digistNum], [startSerial], [example], [remark1], [remark2]) VALUES (9, N'部门编码规则', N'DP', N'', N'yyyyMM', N'', 4, N'0001', N'DP2020120001', NULL, NULL)
INSERT [dbo].[codeRegulation] ([id], [name], [prefix], [connector1], [timeType], [connector2], [digistNum], [startSerial], [example], [remark1], [remark2]) VALUES (10, N'检验登记单编码规则', N'IRF', N'', N'yyyyMMdd', N'', 6, N'000001', N'IRF20201213000001', NULL, NULL)
SET IDENTITY_INSERT [dbo].[codeRegulation] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [userName], [pwd], [email], [customerNumber], [address], [companyName], [openUnit], [bankAccount], [legalPerson], [phone], [state], [isUseFul], [roleId]) VALUES (17, N'sa', N'202cb962ac59075b964b07152d234b70', N'sasa@qq.com', N'HB00212', N'天津市', N'河北省海运总公司', N'建设银行', N'6217000210057896', N'周今铭', N'18888888888', 1, 1, 1)
INSERT [dbo].[Customer] ([id], [userName], [pwd], [email], [customerNumber], [address], [companyName], [openUnit], [bankAccount], [legalPerson], [phone], [state], [isUseFul], [roleId]) VALUES (18, N'zhw', N'202cb962ac59075b964b07152d234b70', N'1429180372@qq.com', N'HB00218', N'河北省', N'保定腾飞石油机械有限公司', N'建设银行', N'6217000210057812', N'周宏旺', N'13888888888', 1, 1, 1)
INSERT [dbo].[Customer] ([id], [userName], [pwd], [email], [customerNumber], [address], [companyName], [openUnit], [bankAccount], [legalPerson], [phone], [state], [isUseFul], [roleId]) VALUES (56, N'zjh', N'82b5f6802b727b0d948d38cbccd48904', N'2509824873@qq.com', N'3301255', N'厦门', N'深夏彩虹集团', N'545422452135123', N'2545421520265', N'张俊辉', N'18296137364', 1, 1, 1)
INSERT [dbo].[Customer] ([id], [userName], [pwd], [email], [customerNumber], [address], [companyName], [openUnit], [bankAccount], [legalPerson], [phone], [state], [isUseFul], [roleId]) VALUES (57, N'luke', N'202cb962ac59075b964b07152d234b70', N'250982483@qq.com', NULL, NULL, NULL, NULL, NULL, N'luke', NULL, 1, 1, 1)
INSERT [dbo].[Customer] ([id], [userName], [pwd], [email], [customerNumber], [address], [companyName], [openUnit], [bankAccount], [legalPerson], [phone], [state], [isUseFul], [roleId]) VALUES (58, N'996', N'0b8aff0438617c055eb55f0ba5d226fa', N'18296137364@126.com', N'996', N'996', N'996', N'996', N'996', N'996', N'996', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([id], [dId], [unitId], [dName], [remark1], [remark2]) VALUES (35, N'DP2020120001', N'UN_202011_0001', N'验船部', N'', NULL)
INSERT [dbo].[Department] ([id], [dId], [unitId], [dName], [remark1], [remark2]) VALUES (36, N'DP2020120002', N'UN_202011_0001', N'财务部', N'', NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[DictInfo] ON 

INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (1, N'0', N'数据字典根节点', N'00', NULL, NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (18, N'1', N'货币种类', N'002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (19, N'18', N'人民币', N'002001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (20, N'18', N'美元', N'002002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (21, N'18', N'欧元', N'002003', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (22, N'1', N'业务分类', N'003', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (23, N'22', N'初次检验', N'003001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (24, N'22', N'中间检查', N'003002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (25, N'1', N'船旗', N'004', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (26, N'25', N'China', N'004001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (27, N'25', N'America', N'004002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (28, N'1', N'船级', N'005', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (29, N'28', N'CCS', N'005001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (30, N'28', N'CSAD', N'005002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (31, N'1', N'航区', N'006', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (32, N'31', N'近海', N'006001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (33, N'31', N'远海', N'006002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (34, N'1', N'海河船', N'007', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (35, N'34', N'海船', N'007001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (36, N'34', N'河船', N'007002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (37, N'1', N'是否条例船', N'008', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (38, N'37', N'条例船', N'008001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (39, N'37', N'非条例船', N'008002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (41, N'1', N'船型', N'009', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (42, N'41', N'驳船', N'009001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (43, N'41', N'电缆船', N'009002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (44, N'41', N'帆船', N'009003', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (46, N'1', N'船体材料', N'010', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (47, N'46', N'不锈钢', N'010001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (48, N'46', N'其他', N'010002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (49, N'1', N'冰区加强', N'011', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (50, N'49', N'加强', N'011001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (51, N'49', N'不加强', N'011002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (52, N'1', N'侧推装置', N'012', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (53, N'52', N'有', N'012001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (54, N'52', N'无', N'012002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (55, N'1', N'推进器种类', N'013', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (56, N'55', N'不适用', N'013001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (57, N'55', N'其它', N'013002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (58, N'1', N'变速齿轮箱', N'014', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (59, N'58', N'有', N'014001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (60, N'58', N'无', N'014002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (61, N'1', N'液力传动', N'015', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (62, N'61', N'不适用', N'015001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (63, N'61', N'其它', N'015002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (64, N'1', N'自动化功率', N'016', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (65, N'64', N'0', N'016001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (66, N'64', N'1', N'016002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (68, N'1', N'自动化等级', N'017', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (69, N'68', N'0', N'017001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (70, N'68', N'1', N'017002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (72, N'68', N'test', N'017003', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (73, N'1', N'常见问题', N'018', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (74, N'73', N'登记单常见问题', N'018001', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (75, N'73', N'数据库常见问题', N'018002', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (76, N'73', N'系统常见问题', N'018003', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (77, N'22', N'年度检验', N'003003', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (78, N'22', N'工厂认可', N'003004', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (79, N'22', N'型式认可', N'003005', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (80, N'22', N'加强检验程序', N'003006', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (81, N'22', N'展期检验', N'003007', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (82, N'22', N'临时检验', N'003008', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (83, N'22', N'防油污中间', N'003009', N'', NULL)
INSERT [dbo].[DictInfo] ([id], [parentId], [name], [code], [remark1], [remark2]) VALUES (85, N'18', N'英镑', N'002004', N'', NULL)
SET IDENTITY_INSERT [dbo].[DictInfo] OFF
SET IDENTITY_INSERT [dbo].[FunctionModel] ON 

INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (1, N'1', N'个人信息管理', N'001', N'01', N'#', N'fa fa-users fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (2, N'01', N'个人信息更新', N'001.001', N'001001', N'../CustomerPages/UpdateCustomerMsg.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (3, N'01', N'修改密码', N'001.002', N'001002', N'../CustomerPages/UpdatePwd.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (4, N'1', N'检验项目管理', N'002', N'02', N'#', N'fa fa-list fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (5, N'02', N'检验业务设置', N'002.001', N'002001', N'../AdminPages/BusinessTypeManagementForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (6, N'02', N'检验项目设置', N'002.002', N'002002', N'../AdminPages/InspectProjectManagementForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (7, N'1', N'检验计费测算', N'003', N'03', N'#', N'fa fa-list fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (8, N'1', N'检验登记单管理', N'004', N'04', N'#', N'fa fa-tasks fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (9, N'1', N'计费管理', N'005', N'05', N'#', N'fa fa-list fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (10, N'03', N'检验计费测算', N'003.001', N'003001', N'../AdminPages/InspectionBillingMeasureForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (15, N'04', N'检验登记单填写', N'004.001', N'004001', N'../AdminPages/RegistrationForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (18, N'05', N'检验计费', N'005.001', N'005001', N'../AdminPages/InspectionBillingForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (27, N'0', N'所有模块', N'0', N'1', N'#', NULL, N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (80, N'1', N'查询统计', N'008', N'08', N'#', N'fa fa-bar-chart-o fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (81, N'08', N'登记单柱形图查询', N'0008001', N'008001', N'../AdminPages/InfoStatistics.aspx?page=1', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (102, N'08', N'金额柱形图统计', N'0008002', N'008002', N'../AdminPages/InfoStatistics.aspx?page=2', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (103, N'08', N'验船师统计页面', N'0008003', N'008003', N'../AdminPages/StatisticsInfo.aspx?page=2', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (104, N'04', N'检验登记单查询', N'0004002', N'004002', N'../AdminPages/QueryRegistrationForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (105, N'04', N'检验登记单审核', N'0004003', N'004003', N'../AdminPages/CheckRegisterForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (106, N'1', N'系统用户管理', N'009', N'09', N'#', N'fa fa-users fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (107, N'09', N'分社管理', N'0009001', N'009001', N'../unitManager.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (108, N'1', N'日志管理', N'010', N'10', N'#', N'fa fa-cogs fa-fw ', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (109, N'10', N'系统日志', N'0010001', N'010001', N'../LogManager.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (112, N'1', N'编码管理', N'011', N'11', N'#', N'fa fa-list fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (113, N'11', N'设置编码规则', N'0011001', N'011001', N'../CodeRegulation.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (120, N'1', N'数据维护', N'012', N'12', N'#', N'fa fa-desktop fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (121, N'12', N'数据库备份', N'0012001', N'012001', N'../BackUpDataBase.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (122, N'12', N'数据库还原', N'0012002', N'012002', N'../RestoreDataBase.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (123, N'1', N'权限管理', N'013', N'13', N'#', N'fa fa-wrench fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (124, N'13', N'系统模块设置', N'0013001', N'013001', N'../SystemModuleSetting.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (129, N'12', N'数据库删除', N'0012003', N'012003', N'../DeleteDataBase.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (130, N'1', N'系统管理', N'014', N'14', N'#3', N'fa fa-cogs fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (131, N'14', N'数据字典', N'0014001', N'014001', N'../DataDictionary.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (132, N'14', N'密码重置', N'0014002', N'014002', N'../UpdatePwd.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (135, N'1', N'帮助中心', N'015', N'15', N'#', N'fa fa-question-circle fa-fw', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (136, N'15', N'使用帮助维护', N'0015001', N'015001', N'../QandAEdit.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (137, N'15', N'使用帮助', N'0015002', N'015002', N'../QandAList.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (138, N'04', N'检验船舶日志管理', N'0004004', N'004004', N'../AdminPages/InspectionStatusManagementForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (139, N'04', N'检验项目明细查询', N'0004005', N'004005', N'../AdminPages/InspectionProjectDetailPrt.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (140, N'04', N'检验登记单统计', N'0004006', N'004006', N'../AdminPages/RegistrationStatisticForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (141, N'04', N'检验订单清理', N'0004007', N'004007', N'../AdminPages/RegistrationDeleForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (142, N'04', N'收费明细', N'0004008', N'004008', N'../AdminPages/InspectionChargeForm.aspx?flag1=1', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (143, N'05', N'检验收费', N'0005002', N'005002', N'../AdminPages/InspectionChargeForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (144, N'05', N'缴费订单统计', N'0005003', N'005003', N'../AdminPages/TotalChargeForm.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (149, N'08', N'财务统计页面', N'0008004', N'008004', N'../AdminPages/StatisticsInfo.aspx?page=4', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (150, N'09', N'部门管理', N'0009002', N'009002', N'../department.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (151, N'09', N'角色管理', N'0009003', N'009003', N'../roleUIInfo.aspx?Id=1', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (152, N'09', N'用户管理', N'0009004', N'009004', N'../UserList.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (153, N'09', N'客户管理', N'0009005', N'009005', N'../CustomerManager.aspx', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (154, N'13', N'角色权限分配', N'0013002', N'013002', N'../roleUIInfo.aspx?Id=2', N'', N'right', NULL)
INSERT [dbo].[FunctionModel] ([id], [parentId], [name], [code], [currentId], [url], [css], [target], [remark]) VALUES (155, N'13', N'用户附加权限', N'0013003', N'013003', N'../UserAddRight.aspx', N'', N'right', NULL)
SET IDENTITY_INSERT [dbo].[FunctionModel] OFF
SET IDENTITY_INSERT [dbo].[InspectionRegistration] ON 

INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (97, N'IRF20210126000013', N'xvv', N'保定腾飞石油机械有限公司', N'周宏旺', N'中间检查', N'asd', N'河北省', N'13888888888', N'6217000210057812', N'财务2', N'', CAST(N'2021-01-26T14:47:34.393' AS DateTime), CAST(N'2021-01-26T14:47:34.393' AS DateTime), N'人民币', CAST(3499.20 AS Decimal(12, 2)), N'于普贺', N'待验船', N'于普贺', N'周宏旺', N'财务2', NULL, N'', CAST(N'2021-01-30T12:54:18.247' AS DateTime), N'', NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (98, N'IRF20210127000014', N'36HW0001', N'保定腾飞石油机械有限公司', N'周宏旺', N'中间检查', N'qwe', N'河北省', N'13888888888', N'6217000210057812', N'财务2', N'常检', CAST(N'2021-01-27T15:58:46.383' AS DateTime), CAST(N'2021-01-30T12:45:09.460' AS DateTime), N'人民币', CAST(19699.20 AS Decimal(12, 2)), N'于普贺', N'待缴费', N'于普贺', N'周宏旺', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (102, N'IRF20210130000015', N'14A6004', N'中远海运散货运输有限公司', N'张三', N'初次检验', N'9654821244113', N'广州市南沙区港162号', N'020-84108686', N'6217002020055343658', N'财务2', N'鹏德', CAST(N'2021-01-30T01:36:42.997' AS DateTime), CAST(N'2021-01-30T01:36:42.997' AS DateTime), N'人民币', CAST(7631.87 AS Decimal(12, 2)), N'于普贺', N'待缴费', N'于普贺', N'管理员', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (103, N'IRF20210130000016', N'17N0074', N'广州海运股份有限公司', N'李四', N'加强检验程序', N'654461131552131', N'广州', N'1829613364', N'5464646314683135', N'财务2', N'广信', CAST(N'2021-01-30T11:15:07.547' AS DateTime), CAST(N'2021-01-30T11:15:07.547' AS DateTime), N'美元', CAST(19620.00 AS Decimal(12, 2)), N'验船师1', N'待缴费', N'验船师1', N'管理员', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (104, N'IRF20210130000017', N'2010K00013', N'神华中海航运公司', N'王五', N'临时检验', N'1655546462265652', N'珠海', N'17732907013', N'213165654498533', N'财务2', N'新世纪168', CAST(N'2021-01-30T11:18:20.463' AS DateTime), CAST(N'2021-01-30T11:18:20.463' AS DateTime), N'欧元', CAST(15840.00 AS Decimal(12, 2)), N'验船师2', N'待缴费', N'验船师2', N'管理员', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (105, N'IRF20210130000018', N'15S0032', N'保定腾飞石油机械有限公司', N'周宏旺', N'初次检验', N'3213111321323212', N'河北省', N'13888888888', N'6217000210057812', N'财务1', N'腾飞', CAST(N'2021-01-31T11:30:35.523' AS DateTime), CAST(N'2021-01-30T11:26:32.393' AS DateTime), N'人民币', CAST(6655.57 AS Decimal(12, 2)), N'于普贺', N'验船中', N'于普贺', N'周宏旺', N'财务1', NULL, N'XXX', CAST(N'2021-01-30T12:55:46.413' AS DateTime), N'', NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (106, N'IRF20210130000019', N'65F0014', N'深夏彩虹集团', N'张俊辉', N'初次检验', N'12165GF564131', N'厦门', N'18296137364', N'2545421520265', N'财务1', N'入水', CAST(N'2021-01-30T12:33:48.400' AS DateTime), CAST(N'2021-01-30T12:33:48.400' AS DateTime), N'人民币', CAST(19699.20 AS Decimal(12, 2)), N'于普贺', N'待验船', N'于普贺', N'张俊辉', N'财务1', NULL, N'XXX', CAST(N'2021-01-30T12:55:34.430' AS DateTime), N'', NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (107, N'IRF20210130000020', N'97JH064', N'深夏彩虹集团', N'张俊辉', N'年度检验', N'132156556423', N'厦门', N'18296137364', N'2545421520265', N'财务1', N'年检', CAST(N'2021-01-30T12:35:48.473' AS DateTime), CAST(N'2021-01-30T12:35:48.473' AS DateTime), N'人民币', CAST(7631.87 AS Decimal(12, 2)), N'验船师1', N'待验船', N'验船师1', N'张俊辉', N'财务1', NULL, N'XXX', CAST(N'2021-01-30T12:55:07.207' AS DateTime), N'', NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (108, N'IRF20210130000021', N'33NC0001', N'深夏彩虹集团', N'张俊辉', N'中间检查', N'2154654981651', N'厦门', N'18296137364', N'2545421520265', N'财务1', N'中间检查', CAST(N'2021-01-31T11:30:31.087' AS DateTime), CAST(N'2021-01-30T12:37:52.247' AS DateTime), N'美元', CAST(19699.20 AS Decimal(12, 2)), N'于普贺', N'验船中', N'于普贺', N'张俊辉', N'财务2', NULL, N'', CAST(N'2021-01-30T12:54:32.343' AS DateTime), N'', NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (109, N'IRF20210130000022', N'12QD0002', N'保定腾飞石油机械有限公司', N'周宏旺', N'工厂认可', N'5649981313', N'河北省', N'13888888888', N'6217000210057812', N'财务1', N'工厂认可', CAST(N'2021-01-30T12:56:14.573' AS DateTime), CAST(N'2021-01-30T12:42:33.363' AS DateTime), N'美元', CAST(23400.00 AS Decimal(12, 2)), N'验船师2', N'完成', N'验船师2', N'周宏旺', N'财务2', NULL, N'XXX', CAST(N'2021-01-30T12:53:46.603' AS DateTime), N'', NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (110, N'IRF20210131000023', N'45GH0023', N'白星航运公司', N'赵六', N'初次检验', N'23143245345', N'英国', N'21123113122', N'1211512', NULL, N'年检', CAST(N'2021-01-31T13:30:41.423' AS DateTime), CAST(N'2021-01-31T13:30:41.423' AS DateTime), N'人民币', NULL, N'于普贺', N'保存', NULL, N'管理员', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (111, N'IRF20210131000024', N'02KL0023', N'深夏彩虹集团', N'张俊辉', N'初次检验', N'154684546413', N'厦门', N'18296137364', N'2545421520265', NULL, N'出海测试', CAST(N'2021-01-31T13:36:40.830' AS DateTime), CAST(N'2021-01-31T13:36:40.830' AS DateTime), N'人民币', NULL, N'于普贺', N'待审核', NULL, N'张俊辉', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (112, N'IRF20210131000025', N'99KI0061', N'深夏彩虹集团', N'张俊辉', N'初次检验', N'132146563225', N'厦门', N'18296137364', N'2545421520265', NULL, N'维护', CAST(N'2021-01-31T14:03:14.870' AS DateTime), CAST(N'2021-01-31T14:03:14.870' AS DateTime), N'人民币', NULL, N'于普贺', N'保存', NULL, N'张俊辉', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[InspectionRegistration] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ApplicantCompany], [Applicant], [ApplicationProject], [TaxpayerIdentificationNumber], [ApplicantCompanyAddress], [ApplicantPhone], [BankAccount], [BusinessName], [InspectionName], [InspectionDate], [OrderDate], [Currency], [Amount], [Surveyor], [Status], [Reviewer], [Remark], [cashier], [reason], [payer], [payTime], [remark1], [remark2]) VALUES (113, N'IRF20210906000026', N'123131', N'123', N'123', N'中间检查', N'123', N'213', N'123', N'123', NULL, N'123123', CAST(N'2021-09-06T19:45:05.103' AS DateTime), CAST(N'2021-09-06T19:45:05.103' AS DateTime), N'美元', NULL, N'验船师1', N'保存', NULL, N'管理员', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InspectionRegistration] OFF
SET IDENTITY_INSERT [dbo].[InspectLog] ON 

INSERT [dbo].[InspectLog] ([ID], [LogNumber], [RegisterNumber], [Time], [Location], [Inspector], [InspectionContent], [Remark]) VALUES (23, N'2021/1/30 12:57:15', N'IRF20210130000022', CAST(N'2021-01-30T12:57:19.480' AS DateTime), N'秦皇岛', N'验船师2', N'推进器检查合格', NULL)
INSERT [dbo].[InspectLog] ([ID], [LogNumber], [RegisterNumber], [Time], [Location], [Inspector], [InspectionContent], [Remark]) VALUES (24, N'2021/1/31 13:43:43', N'IRF20210130000021', CAST(N'2021-01-31T13:43:43.227' AS DateTime), N'秦皇岛', N'于普贺', N'船体货仓安全性检验', N'20210131014359725.jpg')
SET IDENTITY_INSERT [dbo].[InspectLog] OFF
SET IDENTITY_INSERT [dbo].[InspectProject] ON 

INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (1, N'003', N'初次入级（国轮）', N'003.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (2, N'003', N'初次入级（国轮）', N'003.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (3, N'003', N'初次入级（国轮）', N'003.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (4, N'004', N'初次入级外（国轮）', N'004.001', N'轮机装置建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (5, N'004', N'初次入级外（国轮）', N'004.002', N'电气装置建造检验', N'次', CAST(3000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (6, N'004', N'初次入级外（国轮）', N'004.003', N'机舱自动化装置建造检验', N'次', CAST(4000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (7, N'003', N'初次入级（国轮）', N'003.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (8, N'004', N'初次入级外（国轮）', N'004.004', N'船体及舾装建造检验', N'次', CAST(6000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (9, N'003', N'初次入级（国轮）', N'003.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (10, N'004', N'初次入级外（国轮）', N'004.005', N'货物冷藏装置建造检验', N'次', CAST(3888.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (22, N'003', N'初次入级（国轮）', N'003.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (23, N'004', N'初次入级外（国轮）', N'004.006', N'液化气船货物维护装置建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (24, N'003', N'初次入级（国轮）', N'003.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (25, N'004', N'初次入级外（国轮）', N'004.007', N'船体结构建造监控CM', N'次', CAST(2000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (26, N'003', N'初次入级（国轮）', N'003.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (27, N'004', N'初次入级外（国轮）', N'004.008', N'船舶能效实施在线综合监控EOM', N'次', CAST(2000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (28, N'003', N'初次入级（国轮）', N'003.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (29, N'004', N'初次入级外（国轮）', N'004.009', N'视情维护CBM(X)', N'次', CAST(1000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (30, N'003', N'初次入级（国轮）', N'003.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (31, N'004', N'初次入级外（国轮）', N'004.010', N'国际船舶载重线建造检验', N'次', CAST(3100.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (32, N'003', N'初次入级（国轮）', N'003.011', N'货船船员舱室设备建造检验', N'次', CAST(4300.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (33, N'004', N'初次入级外（国轮）', N'004.011', N'货船船员舱室设备建造检验', N'次', CAST(4300.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (34, N'003', N'初次入级（国轮）', N'003.012', N'货船构造安全建造检验', N'次', CAST(3300.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (35, N'004', N'初次入级外（国轮）', N'004.012', N'货船构造安全建造检验', N'次', CAST(3300.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (36, N'003', N'初次入级（国轮）', N'003.013', N'货船无线电安全建造检验', N'次', CAST(2900.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (37, N'004', N'初次入级外（国轮）', N'004.013', N'货船无线电安全建造检验', N'次', CAST(2900.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (38, N'003', N'初次入级（国轮）', N'003.014', N'货船设备安全建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (39, N'004', N'初次入级外（国轮）', N'004.014', N'货船设备安全建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (40, N'003', N'初次入级（国轮）', N'003.015', N'航行安全证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (41, N'004', N'初次入级外（国轮）', N'004.015', N'航行安全证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (42, N'003', N'初次入级（国轮）', N'003.016', N'客船安全建造检验', N'次', CAST(5800.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (43, N'004', N'初次入级外（国轮）', N'004.016', N'客船安全建造检验', N'次', CAST(5800.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (44, N'004', N'初次入级外（国轮）', N'004.017', N'客船乘客定额及舱室设备建造检验', N'次', CAST(6400.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (45, N'003', N'初次入级（国轮）', N'003.017', N'客船乘客定额及舱室设备建造检验', N'次', CAST(6400.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (46, N'003', N'初次入级（国轮）', N'003.018', N'原油洗舱效用建造检验', N'次', CAST(3600.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (47, N'004', N'初次入级外（国轮）', N'004.018', N'原油洗舱效用建造检验', N'次', CAST(3600.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (48, N'003', N'初次入级（国轮）', N'003.019', N'国际防止生活污水污染建造检验', N'次', CAST(6300.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (49, N'004', N'初次入级外（国轮）', N'004.019', N'国际防止生活污水污染建造检验', N'次', CAST(6300.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (50, N'003', N'初次入级（国轮）', N'003.020', N'散装危险化学品建造检验', N'次', CAST(6200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (51, N'004', N'初次入级外（国轮）', N'004.020', N'散装危险化学品建造检验', N'次', CAST(6200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (52, N'003', N'初次入级（国轮）', N'003.021', N'SOLAS II-2危险货物适装建造检验', N'次', CAST(6800.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (53, N'004', N'初次入级外（国轮）', N'004.021', N'SOLAS II-2危险货物适装建造检验', N'次', CAST(6800.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (54, N'003', N'初次入级（国轮）', N'003.022', N'船舶IMSBC建造检验', N'次', CAST(3500.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (55, N'004', N'初次入级外（国轮）', N'004.022', N'船舶IMSBC建造检验', N'次', CAST(3500.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (56, N'003', N'初次入级（国轮）', N'003.023', N'船舶PSPC建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (57, N'004', N'初次入级外（国轮）', N'004.023', N'船舶PSPC建造检验', N'次', CAST(3200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (58, N'003', N'初次入级（国轮）', N'003.024', N'压载水管理证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (59, N'004', N'初次入级外（国轮）', N'004.024', N'压载水管理证书建造检验', N'次', CAST(1000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (60, N'003', N'初次入级（国轮）', N'003.025', N'签发新造船EEDI符合声明', N'次', CAST(1200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (61, N'004', N'初次入级外（国轮）', N'004.025', N'签发新造船EEDI符合声明', N'次', CAST(1200.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (62, N'003', N'初次入级（国轮）', N'003.026', N'船舶起重设备建造检验', N'次', CAST(3700.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (63, N'004', N'初次入级外（国轮）', N'004.026', N'船舶起重设备建造检验', N'次', CAST(3700.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (64, N'003', N'初次入级（国轮）', N'003.027', N'签发试航证书检验', N'次', CAST(1100.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (65, N'004', N'初次入级外（国轮）', N'004.027', N'签发试航证书检验', N'次', CAST(1100.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (66, N'003', N'初次入级（国轮）', N'003.028', N'客船船员舱室设备建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (67, N'004', N'初次入级外（国轮）', N'004.028', N'客船船员舱室设备建造检验', N'次', CAST(5000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (68, N'003', N'初次入级（国轮）', N'003.029', N'国际防止油污建造检验', N'次', CAST(2000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (69, N'004', N'初次入级外（国轮）', N'004.029', N'国际防止油污建造检验', N'次', CAST(2000.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (70, N'003', N'初次入级（国轮）', N'003.030', N'国际控制散装有毒液体物质污染建造检验', N'次', CAST(6600.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (71, N'004', N'初次入级外（国轮）', N'004.030', N'国际控制散装有毒液体物质污染建造检验', N'次', CAST(6600.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (72, N'003', N'初次入级（国轮）', N'003.031', N'国际防止生活垃圾污染建造检验', N'次', CAST(4900.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (73, N'004', N'初次入级外（国轮）', N'004.031', N'国际防止生活垃圾污染建造检验', N'次', CAST(4900.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (74, N'003', N'初次入级（国轮）', N'003.032', N'液化气体载运建造检验', N'次', CAST(4600.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (75, N'004', N'初次入级外（国轮）', N'004.032', N'液化气体载运建造检验', N'次', CAST(4600.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (76, N'003', N'初次入级（国轮）', N'003.033', N'船舶防污底系统建造检验', N'次', CAST(5500.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (77, N'004', N'初次入级外（国轮）', N'004.033', N'船舶防污底系统建造检验', N'次', CAST(5500.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (78, N'003', N'初次入级（国轮）', N'003.034', N'船舶有害物质检验发证建造检验', N'次', CAST(3900.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (79, N'004', N'初次入级外（国轮）', N'004.034', N'船舶有害物质检验发证建造检验', N'次', CAST(3900.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (80, N'003', N'初次入级（国轮）', N'003.035', N'IAPP检验', N'次', CAST(2600.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[InspectProject] ([ID], [BusinessNumber], [BusinessName], [ProjectNumber], [ProjectName], [BillingUnit], [BillingPrice], [Remark]) VALUES (81, N'004', N'初次入级外（国轮）', N'004.035', N'IAPP检验', N'次', CAST(2600.00 AS Decimal(10, 2)), N'')
SET IDENTITY_INSERT [dbo].[InspectProject] OFF
SET IDENTITY_INSERT [dbo].[QandA] ON 

INSERT [dbo].[QandA] ([id], [question], [answer], [remark1], [remark2], [remark3]) VALUES (8, N'系统功能模块设置问题', N'只能添加到二级菜单，不能在向下添加菜单。', N'2021/1/14 20:07:50', N'系统常见问题', NULL)
INSERT [dbo].[QandA] ([id], [question], [answer], [remark1], [remark2], [remark3]) VALUES (9, N'用户附加权限', N'给某个用户附加权限后，该用户拥有对应角色的权限和单独附加的权限，两个权限的并集。', N'2021/1/14 20:07:43', N'系统常见问题', NULL)
INSERT [dbo].[QandA] ([id], [question], [answer], [remark1], [remark2], [remark3]) VALUES (12, N'数据库备份', N'定期备份数据库，在系统出现问题时，可以快速恢复到一个正常运转的状态。', N'2021/1/14 20:10:09', N'数据库常见问题', NULL)
INSERT [dbo].[QandA] ([id], [question], [answer], [remark1], [remark2], [remark3]) VALUES (13, N'填写登记单问题', N'直接点击下一步会自动保存填写的信息，也可以先点击保存按钮，登记单在保存状态时可以再次编辑登记单，提交登记单后用户不能够再次更改登记单，只能够查看已经填写好的登记单，等待验船。', N'2021/1/14 20:14:20', N'登记单常见问题', NULL)
INSERT [dbo].[QandA] ([id], [question], [answer], [remark1], [remark2], [remark3]) VALUES (14, N'登记单查询', N'登记单审核完成后，用户在查询页面能够查看提交的检验登记单状态', N'2021/1/28 12:42:09', N'登记单常见问题', NULL)
INSERT [dbo].[QandA] ([id], [question], [answer], [remark1], [remark2], [remark3]) VALUES (15, N'系统使用流程', N'客户提交检验登记单，等待验船师审核，审核通过后等待财务计费，客户缴费完成，验船师开始验船，客户能够查看该登记单的检验进度，能够导出收费明细', N'2021/1/28 12:44:32', N'系统常见问题', NULL)
SET IDENTITY_INSERT [dbo].[QandA] OFF
SET IDENTITY_INSERT [dbo].[RoleInfo] ON 

INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (1, 1, N'客户')
INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (2, 2, N'验船师')
INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (3, 3, N'单位领导')
INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (4, 4, N'财务')
INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (5, 5, N'系统管理员')
INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (33, 6, N'123')
INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (34, 7, N'测试')
INSERT [dbo].[RoleInfo] ([id], [roleId], [roleName]) VALUES (35, 8, N'阿萨德')
SET IDENTITY_INSERT [dbo].[RoleInfo] OFF
SET IDENTITY_INSERT [dbo].[RoleRightInfo] ON 

INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (29, 6, N'001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (30, 6, N'001001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (31, 6, N'001002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1465, 5, N'002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1466, 5, N'002001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1467, 5, N'002002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1468, 5, N'003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1469, 5, N'003001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1470, 5, N'004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1471, 5, N'004001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1472, 5, N'004002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1473, 5, N'004003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1474, 5, N'004004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1475, 5, N'004005')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1476, 5, N'004006')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1477, 5, N'004007')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1478, 5, N'004008')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1479, 5, N'005')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1480, 5, N'005001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1481, 5, N'005002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1482, 5, N'005003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1483, 5, N'008')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1484, 5, N'008001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1485, 5, N'008002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1486, 5, N'008003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1487, 5, N'008004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1488, 5, N'009')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1489, 5, N'009001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1490, 5, N'009002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1491, 5, N'009003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1492, 5, N'009004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1493, 5, N'009005')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1494, 5, N'010')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1495, 5, N'010001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1496, 5, N'011')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1497, 5, N'011001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1498, 5, N'012')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1499, 5, N'012001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1500, 5, N'012002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1501, 5, N'012003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1502, 5, N'013')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1503, 5, N'013001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1504, 5, N'013002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1505, 5, N'013003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1506, 5, N'014')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1507, 5, N'014001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1508, 5, N'014002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1511, 5, N'015')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1512, 5, N'015001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1513, 5, N'015002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1518, 1, N'001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1519, 1, N'001001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1520, 1, N'001002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1521, 1, N'003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1522, 1, N'003001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1523, 1, N'004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1524, 1, N'004001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1525, 1, N'004002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1526, 1, N'004005')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1527, 1, N'004008')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1528, 1, N'015')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1529, 1, N'015002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1538, 2, N'004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1539, 2, N'004003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1540, 2, N'004004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1541, 2, N'004006')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1542, 2, N'014')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1543, 2, N'014002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1544, 2, N'015')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1545, 2, N'015002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1546, 4, N'005')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1547, 4, N'005001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1548, 4, N'005002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1549, 4, N'005003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1550, 4, N'014')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1551, 4, N'014002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1552, 4, N'015')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1553, 4, N'015002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1572, 3, N'004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1573, 3, N'004002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1574, 3, N'005')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1575, 3, N'005002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1576, 3, N'005003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1577, 3, N'008')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1578, 3, N'008001')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1579, 3, N'008002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1580, 3, N'008003')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1581, 3, N'008004')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1582, 3, N'014')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1583, 3, N'014002')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1584, 3, N'015')
INSERT [dbo].[RoleRightInfo] ([id], [roleId], [rightCode]) VALUES (1585, 3, N'015002')
SET IDENTITY_INSERT [dbo].[RoleRightInfo] OFF
SET IDENTITY_INSERT [dbo].[ShipInfo] ON 

INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (46, N'IRF20210126000013', N'xvv', N'dad', N'China', N'CCS', N'远海', N'河船', N'条例船', CAST(N'2021-01-26T00:00:00.000' AS DateTime), N'驳船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (47, N'IRF20210130000015', N'14A6004', N'鹏德号', N'China', N'CCS', N'远海', N'海船', N'条例船', CAST(N'2017-01-14T00:00:00.000' AS DateTime), N'电缆船', N'180000', N'100000', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'1.3', N'1，1，0，0，0，0，0，0，1，1，0，0，0，0，0，0，0，1，1，0，0，1，0，0，0，0，1，1，0，0，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (48, N'IRF20210130000016', N'17N0074', N'企业号', N'China', N'CCS', N'远海', N'海船', N'非条例船', CAST(N'2014-01-04T00:00:00.000' AS DateTime), N'电缆船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'1', N'0，1，1，0，0，0，0，0，0，0，1，0，0，0，0，0，0，0，0，1，0，0，0，0，0，0，0，0，0，0，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (49, N'IRF20210130000017', N'2010K00013', N'长顺号', N'China', N'CCS', N'近海', N'海船', N'非条例船', CAST(N'2015-12-31T00:00:00.000' AS DateTime), N'驳船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，1，1，0，0，0，0，0，0，1，1，0，0，0，0，0，0，0，1，1，0，0，0，0，0，0，0，0，0，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (50, N'IRF20210130000018', N'15S0032', N'宏光号', N'China', N'CSAD', N'近海', N'海船', N'条例船', CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'电缆船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，0，1，1，0，0，0，0，0，0，1，1，0，0，0，0，0，0，0，1，0，1，0，0，0，0，0，0，1，1，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (51, N'IRF20210130000019', N'65F0014', N'辉煌号', N'China', N'CCS', N'请选择', N'海船', N'非条例船', CAST(N'2020-01-16T00:00:00.000' AS DateTime), N'驳船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'1，1，1，0，0，0，0，0，1，1，1，0，0，0，0，1，0，1，1，1，0，1，0，0，0，0，1，1，1，0，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (52, N'IRF20210130000020', N'97JH064', N'奥林帕斯山号', N'America', N'CSAD', N'远海', N'海船', N'非条例船', CAST(N'2015-01-20T00:00:00.000' AS DateTime), N'驳船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，1，0，0，0，0，0，0，0，1，0，0，0，0，1，0，0，0，1，0，0，0，0，0，0，0，0，1，0，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (53, N'IRF20210130000021', N'33NC0001', N'南昌号', N'China', N'CSAD', N'远海', N'海船', N'非条例船', CAST(N'2014-01-15T00:00:00.000' AS DateTime), N'电缆船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，0，0，1，1，0，0，0，0，0，0，1，1，0，0，0，0，0，0，0，0，1，1，0，0，0，0，0，0，1，1', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (54, N'IRF20210130000022', N'12QD0002', N'青岛号', N'China', N'CCS', N'远海', N'海船', N'非条例船', CAST(N'2010-12-09T00:00:00.000' AS DateTime), N'帆船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，0，1，1，0，0，0，0，0，0，1，1，0，0，0，0，0，0，0，1，0，1，0，0，0，0，0，0，1，1，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (55, N'IRF20210127000014', N'36HW0001', N'宏光号', N'China', N'CCS', N'远海', N'海船', N'条例船', CAST(N'2014-01-09T00:00:00.000' AS DateTime), N'驳船', N'', N'', N'', N'', N'', N'', N'', N'', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，0，1，0，0，0，0，0，0，0，1，0，0，0，0，0，0，0，0，1，0，0，0，0，0，0，0，0，1，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (56, N'IRF20210131000023', N'45GH0023', N'TITANIC', N'America', N'CCS', N'远海', N'海船', N'非条例船', CAST(N'1997-01-07T00:00:00.000' AS DateTime), N'电缆船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，0，1，0，0，0，0，0，0，0，1，0，0，0，0，0，0，0，0，1，0，0，0，0，0，0，0，0，1，0，0', N'')
INSERT [dbo].[ShipInfo] ([ID], [RegisterNumber], [ShipRegistrationNumber], [ShipName], [Flag], [ShipClass], [SailArea], [SeaRiverShip], [OrdinanceShip], [CompletionDate], [ShipType], [GrossTonnage], [Deadweight], [ShipLength], [TypeWidth], [TypeDepth], [TotalHostPower], [TotalPower], [HostType], [ShipMaterial], [IceStrengthening], [SidePushDevice], [PropellerType], [Gearbox], [HydraulicTransmission], [AutomationPower], [AutomationLevel], [TotalRefrigeratedVolume], [NumberOfRefrigeratedCompartments], [NumberOfRefrigeratedUnits], [BallastTankCapacity], [NumberOfCrew], [NumberOfPassengers], [TotalVolumeOfLiquefiedGasTank], [AdditionalSign], [FireProofLevel], [DynamicPositioningSystem], [AdjustmentFactor], [OtherInformation], [Remark]) VALUES (57, N'IRF20210131000024', N'02KL0023', N'辉煌号', N'China', N'CCS', N'远海', N'海船', N'非条例船', CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'电缆船', N'', N'', N'', N'', N'', N'', N'0', N'电缆船', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'请选择', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'0，0，1，0，0，0，0，0，0，0，1，0，0，0，0，1，0，0，0，1，0，0，0，0，0，0，0，0，1，0，0，0', N'')
SET IDENTITY_INSERT [dbo].[ShipInfo] OFF
SET IDENTITY_INSERT [dbo].[TALog] ON 

INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (741, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T18:15:12.217' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (742, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T18:15:22.547' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (743, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T18:15:26.417' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (744, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T18:32:42.353' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (745, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T18:33:37.960' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (746, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T18:34:02.803' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (747, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T18:34:09.043' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (748, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T18:35:21.003' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (749, N'test123', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T18:35:25.767' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (750, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:11:16.240' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (751, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:22:20.043' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (752, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:22:30.530' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (753, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:22:35.547' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (754, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:23:26.067' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (755, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:23:31.253' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (756, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:24:34.650' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (757, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:24:38.143' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (758, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:24:58.803' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (759, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:25:02.513' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (760, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:26:23.003' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (761, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:26:27.100' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (762, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:26:39.443' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (763, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:26:43.563' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (764, N'admin', N'修改节点', N'修改了节点信息-收费明细', CAST(N'2020-12-27T19:27:43.327' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (765, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:28:11.073' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (766, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:28:14.837' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (767, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:31:17.807' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (768, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:35:24.147' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (769, N'sa', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:35:27.903' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (770, N'sa', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:40:39.250' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (771, N'sa', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:41:50.330' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (772, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:42:04.000' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (773, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:42:18.777' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (774, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:42:58.937' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (775, N'admin', N'修改节点', N'修改了节点信息-检验项目明细导出', CAST(N'2020-12-27T19:44:57.303' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (776, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:45:05.490' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (777, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:45:19.317' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (778, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:55:40.673' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (779, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:58:16.667' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (780, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:59:13.857' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (781, N'sa', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:59:20.997' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (782, N'sa', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:59:34.643' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (783, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T19:59:38.017' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (784, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T19:59:46.760' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (785, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T20:00:05.167' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (786, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T20:53:14.497' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (787, N'admin', N'备份数据库', N'备份了数据库', CAST(N'2020-12-27T20:53:22.123' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (788, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T20:57:49.953' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (789, N'zhw', N'修改密码', N'修改密码', CAST(N'2020-12-27T20:58:39.803' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (790, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T20:58:48.803' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (791, N'zhw', N'修改密码', N'修改密码', CAST(N'2020-12-27T20:58:56.183' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (792, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T20:59:06.700' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (793, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:01:44.707' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (794, N'test123', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:01:49.237' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (795, N'test123', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:01:54.177' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (796, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:01:58.637' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (797, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:02:29.833' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (798, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:02:33.700' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (799, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:03:25.017' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (800, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:03:28.613' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (801, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:05:10.570' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (802, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:05:15.550' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (803, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:07:45.940' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (804, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:07:49.253' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (805, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:09:25.483' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (806, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:09:30.583' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (807, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:10:21.153' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (808, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:10:36.427' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (809, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:10:53.040' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (810, N'test123', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:11:14.253' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (811, N'test123', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:11:28.747' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (812, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:11:53.263' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (813, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:21:08.967' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (814, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:21:27.490' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (815, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:21:39.877' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (816, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:26:06.377' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (817, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:28:27.180' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (818, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:31:02.583' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (819, N'admin', N'添加分社信息', N'添加分社信息成功：秦皇岛分社', CAST(N'2020-12-27T21:33:54.490' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (820, N'admin', N'添加部门', N'添加了一个部门信息：检验', CAST(N'2020-12-27T21:34:09.893' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (821, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:39:15.047' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (822, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:39:42.030' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (823, N'admin', N'删除部门', N'删除了一个部门信息：33', CAST(N'2020-12-27T21:40:36.503' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (824, N'admin', N'删除分社', N'删除分社成功:18', CAST(N'2020-12-27T21:40:39.823' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (825, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-27T21:53:24.173' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (826, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-27T21:54:19.420' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (827, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:24:42.890' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (828, N'admin', N'添加分社信息', N'添加分社信息成功：aaa', CAST(N'2020-12-28T10:25:28.390' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (829, N'admin', N'添加部门', N'添加了一个部门信息：aaaaaaa', CAST(N'2020-12-28T10:25:39.143' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (830, N'admin', N'添加用户', N'添加了一个用户信息', CAST(N'2020-12-28T10:26:13.363' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (831, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:26:18.333' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (832, N'aaa', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:26:23.307' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (833, N'aaa', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:26:52.663' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (834, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:27:04.967' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (835, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:27:20.140' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (836, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:27:26.223' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (837, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:27:32.357' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (838, N'aaaaa', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:27:37.453' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (839, N'aaaaa', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:27:51.703' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (840, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:27:59.870' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (841, N'admin', N'删除用户', N'删除了一个用户信息', CAST(N'2020-12-28T10:28:07.417' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (842, N'admin', N'删除用户', N'删除了一个用户信息', CAST(N'2020-12-28T10:28:12.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (843, N'admin', N'删除用户', N'删除了一个用户信息', CAST(N'2020-12-28T10:28:15.327' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (844, N'admin', N'删除用户', N'删除了一个用户信息', CAST(N'2020-12-28T10:28:17.250' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (845, N'admin', N'删除用户', N'删除了一个用户信息', CAST(N'2020-12-28T10:28:19.637' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (846, N'admin', N'删除用户', N'删除了一个用户信息', CAST(N'2020-12-28T10:28:24.203' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (847, N'admin', N'删除部门', N'删除了一个部门信息：34', CAST(N'2020-12-28T10:28:39.357' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (848, N'admin', N'删除分社', N'删除分社成功:19', CAST(N'2020-12-28T10:28:42.817' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (849, N'admin', N'删除客户', N'删除客户：dsdtnew', CAST(N'2020-12-28T10:28:52.283' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (850, N'admin', N'删除客户', N'删除客户：customer', CAST(N'2020-12-28T10:28:56.300' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (851, N'admin', N'删除客户', N'删除客户：test11', CAST(N'2020-12-28T10:28:58.607' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (852, N'admin', N'删除客户', N'删除客户：242', CAST(N'2020-12-28T10:29:02.890' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (853, N'admin', N'删除客户', N'删除客户：aaa', CAST(N'2020-12-28T10:29:04.990' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (854, N'admin', N'删除客户', N'删除客户：bbb', CAST(N'2020-12-28T10:29:06.353' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (855, N'admin', N'修改节点', N'修改了节点信息-用户附加权限', CAST(N'2020-12-28T10:30:47.430' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (856, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:33:54.020' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (857, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:33:58.697' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (858, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:34:04.693' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (859, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:34:14.390' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (860, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:34:30.070' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (861, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:34:35.270' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (862, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:34:41.563' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (863, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:34:46.927' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (864, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:36:04.847' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (865, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:40:43.913' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (866, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:41:21.417' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (867, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:48:54.377' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (868, N'zhw', N'修改密码', N'修改密码', CAST(N'2020-12-28T10:49:02.543' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (869, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T10:49:12.283' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (870, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T10:56:45.117' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (871, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T14:58:05.890' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (872, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T14:58:18.410' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (873, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T14:58:22.253' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (874, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T14:59:10.260' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (875, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T15:45:34.223' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (876, N'admin', N'添加分社信息', N'添加分社信息成功：秦皇岛分社', CAST(N'2020-12-28T15:49:34.550' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (877, N'admin', N'添加部门', N'添加了一个部门信息：验船部', CAST(N'2020-12-28T15:49:55.660' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (878, N'admin', N'添加用户', N'添加了一个用户信息', CAST(N'2020-12-28T15:50:32.227' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (879, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T15:53:03.607' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (880, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T15:53:07.693' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (881, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T15:53:41.727' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (882, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T15:53:45.517' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (883, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T15:56:11.153' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (884, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T15:56:18.220' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (885, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T15:59:35.240' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (886, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T15:59:39.470' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (887, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:01:37.590' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (888, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:01:43.143' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (889, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:03:21.783' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (890, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:03:26.850' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (891, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:11:38.920' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (892, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:11:44.227' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (893, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:12:50.463' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (894, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:12:54.217' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (895, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:37:04.287' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (896, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:39:29.923' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (897, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:39:35.233' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (898, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:43:08.553' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (899, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:43:14.627' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (900, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:45:25.660' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (901, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:45:30.830' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (902, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:45:37.747' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (903, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:45:42.163' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (904, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-28T16:46:45.043' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (905, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-28T16:46:49.097' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (906, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T09:54:21.013' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (907, N'admin', N'添加部门', N'添加了一个部门信息：财务部', CAST(N'2020-12-29T09:56:06.243' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (908, N'admin', N'添加用户', N'添加了一个用户信息', CAST(N'2020-12-29T09:56:47.690' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (909, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T09:56:53.313' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (910, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T09:56:59.593' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (911, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T09:57:02.173' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (912, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T09:57:06.070' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (913, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T09:58:00.860' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (914, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T09:58:05.757' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (915, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:00:01.533' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (916, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:00:10.497' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (917, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:01:32.580' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (918, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:01:42.170' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (919, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:02:05.197' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (920, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:02:13.817' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (921, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:02:47.910' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (922, N'sa', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:03:00.277' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (923, N'sa', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:05:36.590' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (924, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:05:41.160' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (925, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:07:15.643' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (926, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:07:21.977' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (927, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:07:44.637' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (928, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:07:49.607' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (929, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:08:01.710' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (930, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:08:07.363' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (931, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:08:29.513' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (932, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:08:41.007' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (933, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:24:06.530' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (934, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:24:10.103' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (935, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:27:36.117' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (936, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:28:09.807' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (937, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:28:16.237' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (938, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:28:32.893' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (939, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:28:40.047' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (940, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:31:49.260' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (941, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:31:53.740' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (942, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:36:06.287' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (943, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:36:09.960' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (944, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:38:22.050' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (945, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:39:06.703' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (946, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:39:16.920' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (947, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:39:26.820' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (948, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:39:33.443' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (949, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:48:28.670' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (950, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:48:34.167' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (951, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T10:49:25.877' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (952, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T10:49:44.957' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (953, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:07:32.423' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (954, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:14:48.630' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (955, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:15:36.957' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (956, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:15:42.500' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (957, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:16:10.573' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (958, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:16:15.713' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (959, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:16:52.620' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (960, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:16:57.420' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (961, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:17:24.447' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (962, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:17:30.247' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (963, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:18:17.980' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (964, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:18:23.023' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (965, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:18:40.470' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (966, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:18:45.963' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (967, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:19:00.107' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (968, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:21:18.963' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (969, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-29T11:23:20.523' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (970, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-29T11:23:25.140' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (971, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:01:34.287' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (972, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:03:15.980' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (973, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:03:20.263' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (974, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:03:48.033' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (975, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:03:52.290' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (976, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:04:29.277' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (977, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:04:34.550' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (978, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:05:07.723' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (979, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:05:11.390' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (980, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:09:49.990' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (981, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:16:07.147' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (982, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:16:11.077' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (983, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:18:00.363' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (984, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:18:04.333' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (985, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:25:08.457' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (986, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:30:50.710' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (987, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:30:57.983' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (988, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:39:11.507' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (989, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:42:48.057' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (990, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:43:30.003' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (991, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:43:33.693' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (992, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:49:22.233' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (993, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T15:50:10.507' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (994, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:50:14.593' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (995, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T15:53:55.513' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (996, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:02:24.737' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (997, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:16:57.697' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (998, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:17:42.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (999, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:22:02.387' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1000, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:24:30.657' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1001, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:28:35.673' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1002, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:41:50.470' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1003, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:54:19.257' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1004, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T16:57:01.417' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1005, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:02:41.923' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1006, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:05:30.773' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1007, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:14:35.967' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1008, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:31:24.557' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1009, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T17:31:36.547' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1010, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:31:47.470' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1011, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T17:31:54.603' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1012, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:32:19.230' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1013, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:33:34.117' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1014, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:35:08.017' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1015, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:36:04.330' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1016, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T17:36:11.373' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1017, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:36:16.567' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1018, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:36:53.127' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1019, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:47:43.347' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1020, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T17:47:55.060' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1021, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:48:00.883' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1022, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T17:48:07.637' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1023, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:48:30.620' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1024, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:50:53.760' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1025, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:53:00.037' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1026, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:56:19.497' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1027, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:57:31.127' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1028, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T17:59:00.613' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1029, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T18:00:18.323' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1030, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T18:00:41.827' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1031, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T18:00:46.893' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1032, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-30T18:00:56.357' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1033, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-30T18:01:01.790' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1034, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T10:44:09.077' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1035, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2020-12-31T10:44:56.733' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1036, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T10:45:00.307' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1037, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-31T10:46:12.233' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1038, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T10:46:16.993' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1039, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2020-12-31T10:47:15.900' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1040, N'cw', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T10:47:20.807' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1041, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-31T10:53:06.607' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1042, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T10:53:10.697' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1043, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2020-12-31T11:00:38.947' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1044, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T11:00:46.350' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1045, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T14:31:42.673' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1046, N'admin', N'登录系统', N'登录系统成功', CAST(N'2020-12-31T15:00:01.890' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1047, N'admin', N'删除编码规则', N'删除编码规则：', CAST(N'2020-12-31T15:26:18.927' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1048, N'admin', N'删除编码规则', N'删除编码规则：', CAST(N'2020-12-31T15:26:24.793' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1049, N'admin', N'删除编码规则', N'删除编码规则：', CAST(N'2020-12-31T15:26:27.817' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1050, N'admin', N'删除编码规则', N'删除编码规则：', CAST(N'2020-12-31T15:26:30.560' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1051, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-01T16:04:58.370' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1052, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-01T17:14:38.190' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1053, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T08:47:33.583' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1054, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-02T09:27:51.367' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1055, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T10:08:38.623' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1056, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T11:43:32.953' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1057, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T12:19:10.607' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1058, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T15:07:36.023' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1059, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T16:19:09.050' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1060, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T17:45:32.390' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1061, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-02T20:05:45.067' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1062, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-02T20:06:08.360' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1063, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-06T17:18:18.293' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1064, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-06T17:59:03.060' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1065, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-07T11:17:09.480' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1066, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-07T11:45:21.973' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1067, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-07T11:46:09.257' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1068, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-07T17:52:40.073' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1069, N'admin', N'备份数据库', N'备份了数据库', CAST(N'2021-01-07T17:52:49.517' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1070, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T10:53:25.920' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1071, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T16:54:07.383' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1072, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:02:34.437' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1073, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:09:39.717' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1074, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:13:35.643' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1075, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:24:25.217' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1076, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:26:05.897' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1077, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:33:33.730' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1078, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:40:24.433' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1079, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:41:54.437' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1080, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:46:49.433' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1081, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-09T17:51:02.747' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1082, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-11T15:25:29.730' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1083, N'admin', N'添加角色', N'添加角色成功：test', CAST(N'2021-01-11T15:33:45.247' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1084, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-11T15:40:37.323' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1085, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-11T15:40:41.903' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1086, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-11T15:46:03.880' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1087, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-11T15:46:12.463' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1088, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-11T15:57:11.870' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1089, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-11T15:57:19.803' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1090, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-11T16:03:32.663' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1091, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-11T16:03:39.240' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1092, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T09:09:58.550' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1093, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T09:11:27.557' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1094, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T09:11:33.913' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1095, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T09:12:22.163' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1096, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T09:12:26.920' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1097, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T09:12:42.037' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1098, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T09:12:51.033' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1099, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T09:17:30.860' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1100, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T09:17:35.107' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1101, N'admin', N'修改角色信息', N'修改了一个角色信息:财务1', CAST(N'2021-01-13T09:18:58.027' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1102, N'admin', N'修改角色信息', N'修改了一个角色信息:财务', CAST(N'2021-01-13T09:19:03.380' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1103, N'admin', N'添加角色', N'添加角色成功：jsfsfc', CAST(N'2021-01-13T09:19:13.600' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1104, N'admin', N'删除角色', N'删除角色成功:32', CAST(N'2021-01-13T09:19:19.440' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1105, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:01:37.367' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1106, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:08:02.857' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1107, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T10:09:21.450' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1108, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:09:35.300' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1109, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:13:47.807' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1110, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:16:18.577' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1111, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T10:16:38.643' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1112, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:16:52.937' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1113, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T10:17:00.377' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1114, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:17:05.673' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1115, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T10:17:07.667' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1116, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:17:11.740' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1117, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:27:36.343' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1118, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:32:43.600' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1119, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:36:03.760' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1120, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T10:36:17.980' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1121, N'sa', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:36:28.090' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1122, N'sa', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T10:36:31.047' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1123, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:36:34.823' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1124, N'admin', N'添加用户', N'添加了一个用户信息', CAST(N'2021-01-13T10:44:36.707' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1125, N'admin', N'删除用户', N'删除了一个用户信息', CAST(N'2021-01-13T10:44:42.340' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1126, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:51:02.487' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1127, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:53:01.633' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1128, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T10:55:14.140' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1129, N'admin', N'添加分社信息', N'添加分社信息成功：ad', CAST(N'2021-01-13T10:56:12.677' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1130, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:00:24.473' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1131, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:05:04.127' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1132, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:12:04.433' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1135, N'admin', N'添加部门', N'添加了一个部门信息：sfdsfsdf', CAST(N'2021-01-13T11:24:21.700' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1136, N'admin', N'删除部门', N'删除了一个部门信息：37', CAST(N'2021-01-13T11:24:30.640' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1137, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:35:40.290' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1138, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:36:38.260' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1139, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:37:38.290' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1140, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:40:49.943' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1141, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T11:43:29.167' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1142, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T13:51:19.197' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1143, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T13:52:38.170' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1144, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T13:52:42.937' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1145, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T13:56:31.497' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1146, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T13:56:35.910' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1147, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T14:06:17.753' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1148, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T14:06:22.813' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1149, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T14:21:37.377' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1150, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T14:57:14.817' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1151, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:11:07.887' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1152, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:16:30.707' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1153, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:20:14.703' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1154, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:22:18.537' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1155, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:27:38.890' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1156, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:33:21.980' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1157, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:38:57.747' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1158, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:39:59.367' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1159, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:41:31.760' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1160, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:43:37.547' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1161, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:54:15.493' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1162, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T15:55:12.023' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1163, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:03:01.160' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1164, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:05:01.453' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1165, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:07:49.370' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1166, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:21:42.647' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1167, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:28:08.637' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1168, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:39:06.527' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1169, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:41:59.683' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1170, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:43:34.480' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1171, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:45:15.743' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1172, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:47:12.277' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1173, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T16:48:33.543' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1174, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T17:05:42.520' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1175, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T17:08:14.337' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1176, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T19:17:19.533' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1177, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T19:21:50.307' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1178, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T19:25:24.810' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1179, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T19:59:50.793' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1180, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T20:02:39.810' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1181, N'sa', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:02:44.353' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1182, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:13:12.633' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1183, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:16:06.330' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1184, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:17:29.157' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1185, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:21:47.543' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1186, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:28:13.650' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1187, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:30:03.263' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1188, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:32:18.063' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1189, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T20:32:40.233' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1190, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:32:45.280' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1191, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T20:44:22.067' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1192, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T20:44:26.447' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1193, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T21:14:01.070' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1194, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T21:19:51.387' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1195, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T21:27:28.023' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1196, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T21:36:31.507' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1197, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-13T21:40:13.537' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1198, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-13T21:40:18.977' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1199, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T09:20:23.187' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1200, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T09:35:35.810' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1201, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-14T09:36:56.783' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1202, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T09:37:01.853' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1203, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T09:51:08.437' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1204, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T10:02:21.527' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1205, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T10:09:55.867' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1206, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-14T10:12:31.717' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1207, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T10:13:01.813' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1208, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T10:31:09.093' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1209, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T12:14:39.327' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1210, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T12:38:51.113' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1211, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T12:44:44.463' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1212, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T12:54:41.837' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1213, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T19:19:48.467' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1214, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T20:41:01.110' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1215, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T20:48:38.627' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1216, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T20:50:28.990' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1217, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T20:51:45.403' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1218, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-14T21:25:21.460' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1219, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T09:27:17.243' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1220, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T09:35:34.097' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1221, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T09:41:08.540' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1222, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T09:43:10.310' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1223, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T09:51:32.723' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1224, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T09:52:07.627' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1225, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T09:55:23.893' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1226, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T10:01:03.763' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1227, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T10:06:46.393' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1228, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T10:11:08.090' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1229, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T10:20:11.883' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1230, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T10:20:16.303' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1231, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T10:26:03.827' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1232, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T10:26:08.453' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1233, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T10:31:34.563' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1234, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T10:31:38.537' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1235, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-16T10:38:13.003' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1236, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-16T10:38:30.567' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1237, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-16T10:39:36.677' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1238, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-16T10:39:58.340' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1239, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-16T10:40:12.557' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1240, N'admin', N'修改分社信息', N'修改分社信息成功：20', CAST(N'2021-01-16T10:48:04.020' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1241, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T10:54:51.420' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1242, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:03:15.393' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1243, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T11:03:39.570' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1244, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:03:46.600' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1245, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:06:14.193' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1246, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T11:16:04.423' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1247, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:16:08.433' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1248, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:18:22.603' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1249, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T11:18:32.403' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1250, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:18:37.823' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1251, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:21:30.600' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1252, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:29:52.627' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1253, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T11:31:23.670' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1254, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T11:31:27.990' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1255, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:00:17.807' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1256, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T14:06:31.763' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1257, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:06:36.257' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1258, N'admin', N'修改节点', N'修改了节点信息-检验登记单填写', CAST(N'2021-01-16T14:07:02.540' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1259, N'admin', N'修改节点', N'修改了节点信息-检验日志管理', CAST(N'2021-01-16T14:10:30.643' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1260, N'admin', N'修改节点', N'修改了节点信息-检验项目明细查询', CAST(N'2021-01-16T14:13:04.523' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1261, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T14:19:23.210' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1262, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:19:30.813' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1263, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T14:22:31.417' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1264, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:22:35.870' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1265, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T14:23:53.920' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1266, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:23:59.227' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1267, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T14:24:05.823' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1268, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:24:10.023' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1269, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T14:26:50.823' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1270, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:26:56.750' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1271, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:40:10.837' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1272, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T14:58:59.107' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1273, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:01:24.200' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1274, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:06:27.400' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1275, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:15:55.730' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1276, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T15:16:43.343' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1277, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:16:48.060' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1278, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T15:18:26.080' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1279, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:18:30.157' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1280, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T15:18:43.860' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1281, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:18:47.537' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1282, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:29:51.393' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1283, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T15:31:34.493' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1284, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T20:03:25.797' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1285, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T20:28:15.397' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1286, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T20:37:26.580' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1287, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T20:39:13.913' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1288, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T20:55:08.423' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1289, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T20:55:27.777' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1290, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T20:55:33.877' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1291, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T21:06:50.240' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1292, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T21:07:25.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1293, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T21:07:34.503' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1294, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T21:07:38.567' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1295, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-16T21:07:44.353' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1296, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-16T21:07:49.183' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1297, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:17:48.373' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1298, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T09:23:13.900' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1299, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:23:19.043' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1300, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:44:46.810' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1301, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:46:28.797' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1302, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:48:18.250' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1303, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:49:38.763' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1304, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:51:21.057' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1305, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:56:37.023' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1306, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T09:58:17.443' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1307, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:00:32.283' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1308, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:15:39.250' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1309, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T10:15:57.280' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1310, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:16:02.993' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1311, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:21:13.180' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1312, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T10:21:16.390' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1313, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:21:20.640' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1314, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:23:15.597' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1315, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:27:54.763' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1316, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:31:34.263' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1317, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T10:47:40.607' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1318, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:47:46.267' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1319, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:50:06.567' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1320, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:50:49.903' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1321, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:52:51.837' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1322, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T10:53:18.660' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1323, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:53:23.097' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1324, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T10:55:19.477' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1325, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T10:55:24.977' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1326, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:00:01.040' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1327, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:31:10.540' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1328, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T11:31:23.863' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1329, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:31:28.270' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1330, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T11:45:14.073' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1331, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:45:20.687' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1332, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T11:45:33.623' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1333, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:45:38.797' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1334, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:48:50.370' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1335, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T11:49:16.953' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1336, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:49:23.493' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1337, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T11:49:56.217' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1338, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T11:50:00.707' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1339, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T12:39:14.803' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1340, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T12:44:10.350' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1341, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T12:44:15.927' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1342, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T12:44:49.613' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1343, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T12:44:54.900' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1344, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:08:07.197' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1345, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:10:30.003' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1346, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T13:10:35.193' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1347, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:10:40.630' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1348, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:13:55.987' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1349, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T13:17:29.417' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1350, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:17:32.850' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1351, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T13:18:54.953' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1352, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:18:59.763' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1353, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T13:24:08.320' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1354, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:24:13.697' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1355, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T13:34:37.937' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1356, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:34:42.817' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1357, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T13:34:53.993' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1358, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:34:57.797' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1359, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:36:14.977' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1360, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T13:50:07.127' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1361, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:01:03.050' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1362, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:01:07.240' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1363, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:01:14.290' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1364, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:01:20.333' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1365, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:03:19.933' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1366, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:03:24.367' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1367, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:04:59.097' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1368, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:05:04.830' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1369, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:14:10.400' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1370, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:14:16.317' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1371, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:14:29.080' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1372, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:14:33.430' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1373, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:17:20.880' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1374, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:21:33.633' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1375, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:27:09.017' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1376, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:27:13.877' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1377, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:28:04.357' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1378, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:28:10.723' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1379, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:28:48.567' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1380, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:28:53.967' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1381, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:29:09.677' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1382, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:29:14.233' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1383, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:29:39.293' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1384, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:29:44.030' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1385, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:30:16.590' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1386, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:30:21.027' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1387, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:33:46.327' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1388, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:46:13.760' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1389, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:48:21.700' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1390, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T14:49:26.173' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1391, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:49:32.283' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1392, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:57:01.350' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1393, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T14:57:56.683' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1394, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:01:54.560' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1395, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:01:59.023' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1396, N'admin', N'修改节点', N'修改了节点信息-收费明细', CAST(N'2021-01-17T15:02:27.040' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1397, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:02:34.113' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1398, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:03:01.643' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1399, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:03:52.357' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1400, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:03:57.200' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1401, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:04:07.890' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1402, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:04:13.423' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1403, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:05:47.900' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1404, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:05:52.827' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1405, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:05:57.343' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1406, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:06:30.930' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1407, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:10:23.940' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1408, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:19:13.760' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1409, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:19:25.083' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1410, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:21:15.720' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1411, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:21:26.330' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1412, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:21:30.777' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1413, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:21:37.233' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1414, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T15:21:41.633' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1415, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T15:21:57.250' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1416, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:12:32.200' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1417, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:20:31.367' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1418, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T16:21:32.063' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1419, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:21:38.497' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1420, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T16:29:38.977' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1421, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:29:43.150' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1422, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T16:34:03.970' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1423, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:34:09.327' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1424, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T16:34:13.207' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1425, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:34:32.317' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1426, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:52:29.403' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1427, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T16:56:26.923' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1428, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T17:01:48.817' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1429, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T17:22:38.647' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1430, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T17:32:16.330' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1431, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T17:32:21.130' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1432, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T17:41:04.083' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1433, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T17:41:16.123' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1434, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T17:41:21.243' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1435, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T17:41:47.873' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1436, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T17:42:16.177' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1437, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T17:42:36.427' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1438, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:12:49.237' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1439, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:14:56.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1440, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:29:18.693' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1441, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T21:29:43.693' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1442, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:29:54.897' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1443, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:49:18.867' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1444, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:51:18.093' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1445, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:53:41.720' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1446, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T21:55:09.247' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1447, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:12:56.613' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1448, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T22:14:01.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1449, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:14:07.390' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1450, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T22:14:23.850' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1451, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:14:29.000' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1452, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T22:14:36.787' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1453, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:14:45.247' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1454, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T22:14:52.513' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1455, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:14:57.483' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1456, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T22:16:27.890' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1457, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:16:32.927' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1458, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:33:12.917' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1459, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-17T22:33:25.803' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1460, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-17T22:33:31.283' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1461, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T08:33:52.237' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1462, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T08:45:18.823' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1463, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T08:49:04.380' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1464, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:07:10.913' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1465, N'admin', N'备份数据库', N'备份了数据库', CAST(N'2021-01-18T09:07:26.720' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1469, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:29:26.047' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1470, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T09:32:00.897' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1471, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:32:04.700' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1472, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:43:51.723' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1473, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:48:12.297' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1474, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:50:13.023' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1475, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:51:40.487' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1476, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T09:56:48.177' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1477, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T10:31:07.800' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1478, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T10:54:12.360' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1479, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T10:54:30.307' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1480, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T10:54:34.523' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1481, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T10:56:15.923' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1482, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T10:56:20.767' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1483, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T10:56:43.740' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1484, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T10:56:47.460' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1485, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T10:58:46.587' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1486, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:02:12.257' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1487, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T11:02:37.623' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1488, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:02:42.163' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1489, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:03:31.673' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1490, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T11:03:39.363' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1491, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:03:43.547' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1492, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:20:05.173' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1493, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T11:20:19.267' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1494, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:20:24.280' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1495, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T11:20:51.553' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1496, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:20:55.247' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1497, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T11:22:48.403' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1498, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:36:29.710' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1499, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:37:18.650' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1500, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:41:36.677' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1501, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:46:02.837' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1502, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T12:46:21.463' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1503, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:46:27.203' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1504, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T12:46:33.910' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1505, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:46:37.577' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1506, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T12:47:12.177' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1507, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:47:16.480' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1508, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T12:47:32.207' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1509, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:47:37.707' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1510, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T12:47:58.343' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1511, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:48:06.130' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1512, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:56:28.500' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1513, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T12:59:58.687' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1514, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:01:20.437' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1515, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:05:35.797' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1516, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:08:32.020' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1517, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:14:39.113' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1518, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:18:48.263' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1519, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:19:40.557' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1520, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:26:04.977' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1521, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:38:33.520' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1522, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T13:40:14.997' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1523, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:40:19.357' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1524, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T13:43:01.717' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1525, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:43:06.580' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1526, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:50:23.663' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1527, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:53:23.813' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1528, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:54:36.950' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1529, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T13:56:56.293' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1530, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:57:02.233' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1531, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T13:57:37.363' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1532, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:57:43.063' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1533, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T13:57:47.940' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1534, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:57:51.997' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1535, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T13:59:08.837' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1536, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T13:59:53.487' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1537, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:00:39.700' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1538, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:00:44.927' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1539, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:03:32.923' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1540, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:03:38.453' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1541, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:04:16.993' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1542, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:04:28.103' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1543, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:04:52.097' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1544, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:04:59.583' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1545, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:05:29.017' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1546, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:05:34.947' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1547, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:15:34.817' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1548, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:15:42.030' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1549, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:15:55.600' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1550, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:16:00.900' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1551, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:17:32.640' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1552, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:17:38.097' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1553, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:17:59.460' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1554, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:18:03.643' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1555, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:18:15.387' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1556, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:18:20.423' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1557, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:21:17.550' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1558, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:22:30.387' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1559, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:23:04.003' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1560, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:25:07.293' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1561, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:26:58.623' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1562, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:27:28.833' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1563, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:27:38.447' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1564, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:28:49.057' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1565, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:28:53.780' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1566, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:28:58.290' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1567, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T14:29:02.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1568, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T14:29:19.897' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1569, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:47:32.977' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1570, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:51:55.190' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1571, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T15:52:01.750' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1572, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:52:06.013' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1573, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T15:52:14.357' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1574, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:52:19.403' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1575, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:54:59.777' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1576, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T15:55:05.513' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1577, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:55:12.333' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1578, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T15:55:26.420' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1579, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:55:42.050' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1580, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T15:55:48.433' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1581, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T15:55:51.777' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1582, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:18:09.307' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1583, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:18:48.627' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1584, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:20:25.117' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1585, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:27:19.640' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1586, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:30:11.370' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1587, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:35:28.553' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1588, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:48:57.403' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1589, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T16:53:54.370' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1590, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:07:38.400' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1591, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:21:31.873' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1592, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:24:53.947' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1593, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:24:59.050' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1594, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:32:39.697' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1595, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:33:19.877' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1596, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:33:24.560' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1597, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:34:18.413' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1598, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:34:33.413' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1599, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:34:38.203' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1600, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:35:12.437' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1601, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:35:16.663' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1602, N'admin', N'修改节点', N'修改了节点信息-检验船舶日志管理', CAST(N'2021-01-18T17:35:35.507' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1603, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:35:39.717' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1604, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:35:49.933' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1605, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:40:47.090' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1606, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:40:50.960' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1607, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:41:02.613' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1608, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:41:07.787' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1609, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:41:17.980' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1610, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:41:29.460' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1611, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:42:08.803' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1612, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:42:12.963' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1613, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-18T17:42:49.827' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1614, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:42:57.750' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1615, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-18T17:59:08.430' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1616, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:39:24.090' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1617, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:42:51.240' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1618, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:42:57.650' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1619, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:45:44.733' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1620, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:45:49.240' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1621, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:48:28.727' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1622, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:48:39.463' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1623, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:51:49.453' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1624, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:51:55.053' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1625, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:53:01.713' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1626, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:53:06.467' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1627, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:55:00.703' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1628, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:55:07.637' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1629, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:56:55.177' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1630, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:56:59.073' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1631, N'admin', N'修改节点', N'修改了节点信息-收费明细', CAST(N'2021-01-19T08:57:16.290' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1632, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T08:57:18.247' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1633, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T08:58:18.740' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1634, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:07:21.120' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1635, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:07:52.560' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1636, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:08:02.717' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1637, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:08:11.197' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1638, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:08:15.217' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1639, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:08:33.853' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1640, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:08:42.907' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1641, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:15:40.590' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1642, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:15:45.373' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1643, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:16:40.517' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1644, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:16:52.407' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1645, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:16:56.727' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1646, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:17:28.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1647, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:17:33.743' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1648, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:20:50.650' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1649, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:20:57.950' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1650, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:22:05.957' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1651, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:22:10.763' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1652, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:22:22.820' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1653, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:22:27.860' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1654, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:22:35.693' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1655, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:23:04.007' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1656, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:30:34.677' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1657, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:31:18.677' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1658, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:31:22.527' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1659, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:31:34.757' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1660, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:31:39.237' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1661, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:33:34.123' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1662, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:33:37.720' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1663, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:35:19.700' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1664, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:35:35.513' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1665, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T09:39:31.397' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1666, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:39:35.610' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1667, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:52:16.603' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1668, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T09:53:25.793' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1669, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:11:59.273' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1670, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T10:12:26.793' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1671, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:12:31.223' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1672, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T10:13:35.720' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1673, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:13:39.800' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1674, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T10:15:04.890' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1675, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:15:08.850' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1676, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T10:21:17.570' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1677, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:21:21.673' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1678, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:27:29.667' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1679, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T10:28:02.593' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1680, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:28:06.967' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1681, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:34:15.740' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1682, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:36:03.823' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1683, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T10:37:44.100' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1684, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T10:37:49.193' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1685, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:10:00.990' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1686, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:15:54.407' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1687, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:22:51.367' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1688, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:32:06.090' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1689, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:37:48.210' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1690, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T12:38:12.463' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1691, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:38:16.350' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1692, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:40:41.860' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1693, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T12:42:20.183' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1694, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:42:25.813' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1695, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T12:42:37.537' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1696, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:42:41.850' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1697, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T12:44:09.280' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1698, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:44:36.707' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1699, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-19T12:46:15.817' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1700, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:46:19.780' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1701, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-19T12:48:54.573' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1702, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:04:25.193' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1703, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:12:59.847' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1704, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:13:04.633' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1705, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:13:23.293' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1706, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:13:27.787' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1707, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:14:36.790' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1708, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:14:40.563' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1709, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:15:14.693' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1710, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:15:19.453' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1711, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:16:27.503' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1712, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:16:31.160' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1713, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:16:56.743' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1714, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:17:02.550' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1715, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:17:49.777' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1716, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:17:54.310' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1717, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:18:05.870' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1718, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:18:10.023' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1719, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:22:41.070' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1720, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:22:54.867' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1721, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:24:00.583' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1722, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:24:06.240' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1723, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:24:30.087' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1724, N'sa', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:24:37.087' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1725, N'sa', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:26:59.097' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1726, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:27:03.610' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1727, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:27:13.063' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1728, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:27:16.667' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1729, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:27:34.783' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1730, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:27:40.770' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1731, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:33:36.197' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1732, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:33:47.543' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1733, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:33:54.187' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1734, N'sa', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:34:00.793' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1735, N'sa', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:34:25.280' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1736, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:34:43.690' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1737, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:34:56.897' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1738, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:35:01.893' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1739, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:35:50.080' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1740, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:36:00.907' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1741, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:36:08.427' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1742, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:36:12.337' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1743, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:36:28.743' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1744, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:36:34.730' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1745, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:36:37.503' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1746, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:36:41.983' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1747, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:36:59.883' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1748, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:37:08.273' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1749, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:43:05.677' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1750, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:57:45.843' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1751, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:57:55.283' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1752, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:58:00.497' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1753, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:58:05.513' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1754, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:58:10.897' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1755, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T08:58:19.277' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1756, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T08:58:37.663' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1757, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:18:17.040' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1758, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T10:18:22.107' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1759, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:18:27.113' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1760, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T10:19:18.433' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1761, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:19:24.073' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1762, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T10:19:30.833' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1763, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:19:35.707' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1764, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T10:20:28.467' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1765, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:20:31.923' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1766, N'admin', N'修改节点', N'修改了节点信息-全部订单', CAST(N'2021-01-20T10:21:35.423' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1767, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:43:30.310' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1768, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T10:43:38.453' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1769, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:43:42.493' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1770, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T10:43:54.030' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1771, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T10:44:48.457' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1772, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T11:02:48.200' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1773, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:03:40.417' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1774, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:03:44.343' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1775, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:03:49.267' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1776, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:03:55.140' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1777, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:04:05.490' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1778, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:15:33.763' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1779, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:15:41.687' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1780, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:15:46.370' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1781, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:15:51.647' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1782, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:15:55.233' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1783, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:16:07.543' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1784, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:16:12.770' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1785, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:16:38.430' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1786, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:16:45.417' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1787, N'admin', N'修改节点', N'修改了节点信息-收费完成订单', CAST(N'2021-01-20T13:17:44.003' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1788, N'admin', N'修改节点', N'修改了节点信息-收费完成订单统计', CAST(N'2021-01-20T13:18:00.600' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1789, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:18:14.560' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1790, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:18:19.513' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1791, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:18:45.470' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1792, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:18:50.487' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1793, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:27:54.043' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1794, N'admin', N'修改节点', N'修改了节点信息-数据维护', CAST(N'2021-01-20T13:28:17.953' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1795, N'admin', N'备份数据库', N'备份了数据库', CAST(N'2021-01-20T13:28:28.857' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1796, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:40:20.067' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1797, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:40:23.087' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1798, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:40:27.503' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1799, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:40:38.697' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1800, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:40:49.153' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1801, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:55:50.587' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1802, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:55:54.747' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1803, N'zhw', N'修改密码', N'修改密码', CAST(N'2021-01-20T13:56:11.817' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1804, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:56:27.827' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1805, N'zhw', N'修改密码', N'修改密码', CAST(N'2021-01-20T13:56:37.573' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1806, N'zhw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:56:42.873' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1807, N'zhw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T13:57:06.257' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1808, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T13:57:10.267' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1809, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:17:28.770' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1810, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-20T14:18:03.670' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1811, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-20T14:20:17.423' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1812, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-20T14:20:37.917' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1813, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-20T14:20:51.953' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1814, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-20T14:20:59.383' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1815, N'admin', N'修改用户', N'修改了一个用户信息', CAST(N'2021-01-20T14:21:52.957' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1816, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:23:56.343' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1817, N'admin', N'修改节点', N'修改了节点信息-缴费订单统计', CAST(N'2021-01-20T14:28:21.420' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1818, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T14:28:31.853' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1819, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:28:40.750' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1820, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:32:55.657' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1821, N'管理员', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:34:39.073' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1822, N'管理员', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T14:34:42.143' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1823, N'周宏旺', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:37:08.253' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1824, N'周宏旺', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T14:37:40.343' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1825, N'管理员', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:37:44.150' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1826, N'管理员', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T14:37:46.710' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1827, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:41:43.323' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1828, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T14:41:46.953' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1829, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T14:41:50.623' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1830, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T14:41:52.973' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1831, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:04:03.907' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1832, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:36:33.560' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1833, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:43:11.597' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1834, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:47:24.957' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1835, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:50:16.493' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1836, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T15:50:54.773' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1837, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:51:00.357' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1838, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:53:31.033' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1839, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:57:42.200' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1840, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T15:58:22.797' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1841, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:58:27.080' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1842, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T15:59:01.637' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1843, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T15:59:08.303' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1844, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:07:12.883' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1845, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T16:08:01.473' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1846, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:08:06.227' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1847, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:13:13.917' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1848, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T16:18:25.743' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1849, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:18:29.650' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1850, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:38:19.437' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1851, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:44:52.837' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1852, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T16:47:48.250' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1853, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:48:24.017' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1854, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T16:51:51.067' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1855, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:51:59.313' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1856, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T16:57:57.973' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1857, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:02:24.010' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1858, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:02:29.380' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1859, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:05:01.803' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1860, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:05:25.957' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1861, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:05:31.153' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1862, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:07:32.357' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1863, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:08:02.187' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1864, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:08:07.410' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1865, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:08:40.987' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1866, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:08:45.450' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1867, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:09:28.107' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1868, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:09:36.933' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1869, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:09:46.717' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1870, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:11:55.877' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1871, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:12:06.340' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1872, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:12:12.253' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1873, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:12:30.307' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1874, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:12:34.693' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1875, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:14:58.630' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1876, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:16:15.830' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1877, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:16:20.840' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1878, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:16:56.043' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1879, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:17:00.740' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1880, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:19:38.403' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1881, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:20:04.460' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1882, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:20:09.427' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1883, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:25:37.613' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1884, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:26:40.773' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1885, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:26:45.690' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1886, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:27:07.340' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1887, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:27:12.193' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1888, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:27:19.280' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1889, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:27:26.740' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1890, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:27:45.773' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1891, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:27:49.977' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1892, N'admin', N'添加用户', N'添加了一个用户信息', CAST(N'2021-01-20T17:29:23.780' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1893, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:30:02.950' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1894, N'cw1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:30:09.237' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1895, N'cw1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:30:15.497' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1896, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:30:21.153' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1897, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:33:17.503' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1898, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:33:22.063' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1899, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:33:54.820' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1900, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:33:58.590' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1901, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:34:08.927' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1902, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:34:14.057' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1903, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:34:44.837' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1904, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:34:48.973' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1905, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:34:53.047' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1906, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:34:57.427' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1907, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:35:33.047' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1908, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:35:38.253' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1909, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:35:55.943' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1910, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:36:02.420' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1911, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:36:17.693' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1912, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:36:22.120' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1913, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:36:43.583' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1914, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:36:49.227' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1915, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:37:48.697' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1916, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:37:53.650' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1917, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:38:07.663' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1918, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:38:12.327' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1919, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:39:02.190' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1920, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:39:06.013' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1921, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:39:25.293' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1922, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:39:35.107' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1923, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:39:52.797' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1924, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:40:45.147' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1925, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:40:49.527' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1926, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:40:54.143' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1927, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:40:56.630' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1928, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:41:01.120' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1929, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:41:03.910' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1930, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:41:13.737' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1931, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:41:32.173' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1932, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:42:07.460' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1933, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:51:39.700' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1934, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:51:50.703' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1935, N'cw1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:51:58.207' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1936, N'cw1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:52:10.477' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1937, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:52:29.587' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1938, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:53:37.127' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1939, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:53:42.033' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1940, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:54:31.047' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1941, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:54:35.060' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1942, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:55:03.530' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1943, N'cw1', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:55:10.577' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1944, N'cw1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:55:43.943' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1945, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:55:48.077' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1946, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:57:02.747' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1947, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:57:23.790' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1948, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:57:33.657' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1949, N'sa             ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:57:39.617' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1950, N'sa             ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:58:45.760' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1951, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:58:50.437' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1952, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T17:59:25.143' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1953, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T17:59:29.687' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1954, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:00:15.170' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1955, N'sa             ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:00:25.367' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1956, N'sa             ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:01:49.367' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1957, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:01:54.237' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1958, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:02:05.970' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1959, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:02:30.207' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1960, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:20:06.557' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1961, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:20:22.187' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1962, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:22:17.163' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1963, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:23:08.820' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1964, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:25:02.103' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1965, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:25:14.340' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1966, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:25:18.967' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1967, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:26:15.130' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1968, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:26:19.373' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1969, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:30:25.070' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1970, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:31:23.763' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1971, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:31:28.433' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1972, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:31:41.110' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1973, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:31:45.333' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1974, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:32:25.050' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1975, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:32:29.590' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1976, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:37:22.377' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1977, N'admin', N'修改节点', N'修改了节点信息-个人信息管理', CAST(N'2021-01-20T18:37:45.643' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1978, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:37:47.290' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1979, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:37:51.253' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1980, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:38:43.027' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1981, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:38:47.117' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1982, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:39:13.533' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1983, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:39:49.017' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1984, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:44:37.677' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1985, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:44:42.933' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1986, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:44:45.147' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1987, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:44:50.863' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1988, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:44:55.700' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1989, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:45:00.007' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1990, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:45:19.683' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1991, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:45:23.827' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1992, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:46:25.990' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1993, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:46:29.697' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1994, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T18:47:10.357' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1995, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T18:47:15.020' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1996, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:09:25.290' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1997, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:11:00.553' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1998, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:11:05.527' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (1999, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:11:26.690' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2000, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:11:31.700' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2001, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:12:36.597' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2002, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:12:40.883' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2003, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:13:02.507' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2004, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:13:06.517' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2005, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:13:18.393' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2006, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:13:22.917' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2007, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:13:49.240' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2008, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:13:54.970' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2009, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:14:09.890' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2010, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:14:13.727' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2011, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:14:40.450' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2012, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:14:44.410' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2013, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:21:59.463' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2014, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:26:36.750' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2015, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:26:42.367' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2016, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-20T21:26:46.713' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2017, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:26:52.437' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2018, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-20T21:28:35.193' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2019, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:26:12.800' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2020, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:26:22.707' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2021, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:26:26.910' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2022, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:27:09.840' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2023, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:27:15.173' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2024, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:27:27.273' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2025, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:27:31.890' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2026, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:27:59.073' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2027, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:28:03.587' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2028, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:28:19.300' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2029, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:33:45.287' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2030, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:39:47.653' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2031, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:39:51.790' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2032, N'admin', N'添加用户', N'添加了一个用户信息', CAST(N'2021-01-21T16:40:47.193' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2033, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:40:51.517' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2034, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:40:57.227' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2035, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T16:54:25.070' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2036, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T16:54:30.370' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2037, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:06:28.443' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2038, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:06:33.337' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2039, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:07:39.630' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2040, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:07:44.343' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2041, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:09:13.457' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2042, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:09:34.587' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2043, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:12:35.070' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2044, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:12:40.997' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2045, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:13:46.697' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2046, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:13:52.047' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2047, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:24:25.997' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2048, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:24:34.877' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2049, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:28:21.773' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2050, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:28:26.703' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2051, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:29:58.760' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2052, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:30:08.097' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2053, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:32:40.073' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2054, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:32:45.557' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2055, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-21T17:42:13.647' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2056, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-21T17:42:17.680' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2057, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T08:38:49.053' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2058, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T08:39:35.077' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2059, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T08:39:40.523' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2060, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T08:40:35.013' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2061, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T08:40:46.073' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2062, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T08:41:25.797' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2063, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T08:41:30.930' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2064, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T08:50:29.110' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2065, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T08:50:33.527' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2066, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T08:59:57.087' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2067, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T09:07:27.250' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2068, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T09:27:29.940' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2069, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T09:37:52.557' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2070, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T10:08:22.703' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2071, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T10:19:55.430' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2072, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T10:20:30.477' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2073, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T10:37:24.633' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2074, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T10:52:09.893' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2075, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T12:49:44.740' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2076, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T12:55:22.157' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2077, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:11:08.187' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2078, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:15:37.600' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2079, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:16:22.203' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2080, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:19:54.163' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2081, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:27:26.930' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2082, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:28:28.463' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2083, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:29:25.997' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2084, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:34:24.680' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2085, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T13:36:37.710' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2086, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:36:48.277' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2087, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T13:39:57.463' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2088, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:40:01.860' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2089, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:46:56.577' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2090, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:47:56.727' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2091, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:51:14.290' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2092, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T13:51:23.980' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2093, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:51:29.147' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2094, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T13:51:35.153' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2095, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:51:41.623' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2096, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T13:52:00.127' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2097, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:52:03.423' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2098, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T13:53:34.313' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2099, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:53:38.963' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2100, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:58:38.493' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2101, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T13:58:42.823' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2102, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T13:58:46.813' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2103, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:04:43.467' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2104, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:04:46.920' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2105, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:04:56.600' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2106, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:05:09.557' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2107, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:12:41.493' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2108, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:12:45.450' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2109, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:12:52.250' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2110, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:14:27.083' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2111, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:14:32.723' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2112, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:14:40.673' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2113, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:14:44.650' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2114, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:14:51.130' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2115, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:14:55.053' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2116, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:19:25.440' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2117, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:21:18.433' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2118, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:22:03.187' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2119, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:22:11.787' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2120, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:22:22.007' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2121, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:22:30.670' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2122, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:30:52.810' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2123, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:31:08.267' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2124, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:31:15.427' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2125, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:40:47.523' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2126, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:43:27.660' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2127, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:43:56.590' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2128, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T14:44:02.283' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2129, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T14:44:25.390' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2130, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:44:30.717' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2131, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:44:54.513' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2132, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:45:00.477' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2133, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:46:02.573' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2134, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:46:06.950' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2135, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:46:16.987' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2136, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:46:24.247' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2137, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:46:39.067' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2138, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:46:44.380' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2139, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:46:47.460' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2140, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:46:51.493' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2141, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:49:57.643' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2142, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:50:27.860' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2143, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:50:36.097' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2144, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:50:45.033' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2145, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:50:48.683' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2146, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:55:30.190' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2147, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:55:48.650' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2148, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:55:52.797' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2149, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:55:58.293' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2150, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:56:26.627' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2151, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:56:32.127' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2152, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:57:50.100' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2153, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:57:54.823' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2154, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T15:58:02.783' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2155, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T15:58:08.740' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2156, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:04:44.247' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2157, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T16:04:54.613' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2158, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:05:01.407' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2159, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:07:44.053' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2160, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T16:07:50.813' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2161, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:07:56.870' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2162, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:10:03.240' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2163, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T16:10:27.853' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2164, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:10:33.190' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2165, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:12:34.040' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2166, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:12:57.127' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2167, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:16:54.980' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2168, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:18:16.677' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2169, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:20:14.000' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2170, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:20:42.487' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2171, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:22:39.837' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2172, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:26:23.360' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2173, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T16:26:48.200' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2174, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:26:52.500' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2175, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T16:28:48.337' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2176, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:28:52.423' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2177, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:46:44.323' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2178, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:57:16.253' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2179, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T16:58:15.833' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2180, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:03:30.330' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2181, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:04:10.307' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2182, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:09:30.757' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2183, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T17:13:00.027' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2184, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:13:08.710' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2185, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T17:13:31.053' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2186, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:13:45.830' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2187, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T17:13:51.473' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2188, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:13:55.773' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2189, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T17:14:16.440' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2190, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:14:19.987' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2191, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T17:14:44.010' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2192, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:14:48.947' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2193, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:23:52.023' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2194, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:24:47.773' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2195, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T17:25:43.500' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2196, N'cw1', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T17:25:48.940' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2197, N'cw1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T17:26:02.210' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2198, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T18:37:17.170' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2199, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T18:43:21.043' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2200, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T18:43:31.763' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2201, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T18:43:35.627' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2202, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T18:45:28.497' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2203, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T18:45:32.460' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2204, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T18:45:36.453' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2205, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T18:48:26.380' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2206, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T18:49:06.277' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2207, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T18:49:12.017' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2208, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T18:49:32.077' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2209, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:37:02.120' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2210, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T20:40:45.160' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2211, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:40:51.433' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2212, N'yph', N'修改密码', N'修改密码成功', CAST(N'2021-01-24T20:41:11.763' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2213, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:41:32.790' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2214, N'yph', N'修改密码', N'修改密码成功', CAST(N'2021-01-24T20:41:56.030' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2215, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:42:19.697' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2216, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T20:43:07.017' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2217, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:43:11.683' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2218, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T20:43:57.400' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2219, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:44:00.940' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2220, N'cw', N'修改密码', N'修改密码成功', CAST(N'2021-01-24T20:44:09.750' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2221, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:44:18.177' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2222, N'cw', N'修改密码', N'修改密码成功', CAST(N'2021-01-24T20:44:26.117' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2223, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:44:44.427' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2224, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-24T20:44:52.057' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2225, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:45:04.967' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2226, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T20:53:34.520' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2227, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:04:50.937' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2228, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:11:58.413' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2229, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:29:51.377' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2230, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:32:38.170' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2231, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:33:42.640' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2232, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:40:14.723' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2233, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:41:08.070' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2234, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:48:43.413' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2235, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T21:52:12.633' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2236, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-24T22:00:01.730' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2237, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:25:57.013' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2238, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T08:26:07.590' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2239, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:26:13.680' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2240, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:30:12.480' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2241, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:35:10.527' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2242, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T08:36:11.133' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2243, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:36:14.577' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2244, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:42:39.017' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2245, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:44:25.027' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2246, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T08:45:56.077' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2247, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:45:59.800' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2248, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T08:47:24.653' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2249, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:47:28.393' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2250, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T08:48:36.327' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2251, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:48:40.120' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2252, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T08:55:03.737' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2253, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:08:37.487' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2254, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:12:30.923' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2255, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:12:59.583' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2256, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:13:04.840' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2257, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:13:18.497' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2258, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:13:22.850' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2259, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:13:28.183' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2260, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:13:32.317' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2261, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:13:58.960' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2262, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:14:03.890' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2263, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:14:11.440' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2264, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:14:26.747' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2265, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:14:30.130' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2266, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:15:56.577' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2267, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:16:17.247' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2268, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:16:20.697' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2269, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:18:23.277' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2270, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:21:07.193' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2271, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:25:09.067' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2272, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:26:02.483' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2273, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:26:08.117' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2274, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:26:18.050' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2275, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T09:26:22.547' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2276, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-25T09:26:45.743' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2277, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T14:23:25.987' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2278, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T22:20:14.163' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2279, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-25T22:36:33.800' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2280, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:39:01.347' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2281, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:49:59.227' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2282, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T08:50:13.583' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2283, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:50:17.597' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2284, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T08:50:53.277' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2285, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:50:58.723' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2286, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T08:51:18.950' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2287, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:51:22.967' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2288, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T08:51:43.297' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2289, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:51:47.537' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2290, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T08:51:57.247' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2291, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:52:01.307' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2292, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T08:53:04.543' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2293, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:53:08.480' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2294, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T08:53:38.600' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2295, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T08:53:50.473' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2296, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T09:16:37.497' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2297, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T09:20:34.270' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2298, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T09:29:21.850' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2299, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T10:47:02.823' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2300, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T10:48:52.287' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2301, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T10:52:17.470' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2302, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T11:00:57.350' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2303, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T11:06:14.647' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2304, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T11:11:16.953' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2305, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T11:16:48.750' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2306, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T12:43:15.417' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2307, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T12:54:39.043' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2308, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T12:59:00.217' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2309, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T13:08:11.597' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2310, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T13:09:34.190' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2311, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T13:23:53.913' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2312, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T13:30:33.277' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2313, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T13:33:29.253' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2314, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T13:33:33.643' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2315, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T13:33:48.607' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2316, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T14:47:17.490' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2317, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T14:48:09.093' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2318, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T14:48:13.740' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2319, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T14:59:56.607' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2320, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T18:26:25.890' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2321, N'admin', N'修改节点', N'修改了节点信息-柱形图查询', CAST(N'2021-01-26T18:27:18.967' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2322, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T18:47:37.263' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2323, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T18:50:09.600' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2324, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T18:51:00.637' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2325, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T19:03:35.313' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2326, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T23:08:53.903' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2327, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T23:22:52.427' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2328, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-26T23:27:42.807' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2329, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-26T23:27:47.663' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2330, N'admin', N'修改节点', N'修改了节点信息-检验登记单统计', CAST(N'2021-01-26T23:28:04.520' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2331, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T08:23:55.250' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2332, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T08:28:40.720' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2333, N'admin', N'修改节点', N'修改了节点信息-登记单柱形图查询', CAST(N'2021-01-27T08:33:18.720' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2334, N'admin', N'修改节点', N'修改了节点信息-金额柱形图统计', CAST(N'2021-01-27T08:34:50.887' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2335, N'admin', N'修改节点', N'修改了节点信息-登记单柱形图查询', CAST(N'2021-01-27T08:35:22.410' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2336, N'admin', N'修改节点', N'修改了节点信息-金额柱形图统计', CAST(N'2021-01-27T08:35:33.247' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2337, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T08:41:02.323' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2338, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T08:54:46.827' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2339, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T09:22:09.700' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2340, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T10:06:23.497' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2341, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T10:08:26.533' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2342, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T10:24:22.493' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2343, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T10:45:48.597' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2344, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T10:49:32.017' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2345, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T10:51:02.637' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2346, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T11:11:55.480' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2347, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T11:24:49.327' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2348, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T11:33:37.633' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2349, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T11:39:14.363' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2350, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T11:44:24.383' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2351, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T12:50:32.357' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2352, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T13:04:15.007' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2353, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T13:23:14.490' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2354, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T13:25:02.183' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2355, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T13:28:13.743' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2356, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-27T13:28:25.383' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2357, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T13:28:55.033' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2358, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T13:32:56.817' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2359, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T14:59:54.107' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2360, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-27T15:00:00.620' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2361, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T15:00:04.823' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2362, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-27T15:00:28.643' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2363, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T15:00:44.847' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2364, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-27T15:08:23.750' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2365, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T15:08:28.347' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2366, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-27T15:16:18.887' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2367, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T15:28:30.717' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2368, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T15:58:29.270' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2369, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-27T16:07:44.810' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2370, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T16:07:49.773' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2371, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T20:55:43.960' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2372, N'admin', N'修改节点', N'修改了节点信息-验船师统计页面', CAST(N'2021-01-27T21:14:24.123' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2373, N'admin', N'修改节点', N'修改了节点信息-验船师统计页面', CAST(N'2021-01-27T21:19:43.143' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2374, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-27T21:31:01.620' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2375, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T07:58:04.977' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2376, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T08:43:45.183' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2377, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:14:56.893' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2378, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:16:50.403' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2379, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:23:01.430' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2380, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:23:21.007' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2381, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:23:32.320' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2382, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:23:37.327' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2383, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:23:49.080' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2384, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:24:15.337' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2385, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:24:39.997' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2386, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:24:44.633' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2387, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:26:31.207' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2388, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:26:44.000' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2389, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:26:53.667' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2390, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:27:03.797' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2391, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:27:26.080' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2392, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:27:38.390' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2393, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:28:50.210' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2394, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:28:54.013' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2395, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:33:19.480' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2396, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:33:59.997' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2397, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:38:00.827' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2398, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:43:45.100' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2399, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:43:58.047' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2400, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:44:01.573' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2401, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:44:08.097' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2402, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:44:12.943' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2403, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:44:17.127' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2404, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:44:23.520' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2405, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:44:26.390' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2406, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:44:34.550' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2407, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:48:03.610' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2408, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:48:09.053' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2409, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:48:23.887' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2410, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:48:28.323' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2411, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:48:37.313' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2412, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:48:42.747' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2413, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T09:48:47.147' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2414, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:48:55.937' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2415, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T09:52:05.113' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2416, N'admin', N'修改节点', N'修改了节点信息-使用帮助维护', CAST(N'2021-01-28T09:54:57.687' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2417, N'admin', N'修改节点', N'修改了节点信息-使用帮助', CAST(N'2021-01-28T09:55:26.183' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2418, N'admin', N'修改节点', N'修改了节点信息-密码重置', CAST(N'2021-01-28T09:56:02.497' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2419, N'admin', N'修改节点', N'修改了节点信息-密码重置', CAST(N'2021-01-28T09:56:26.770' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2420, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:00:16.153' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2421, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:00:20.570' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2422, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:00:26.937' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2423, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:00:31.193' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2424, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:03:13.200' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2425, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:03:23.210' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2426, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:03:42.660' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2427, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:03:47.017' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2428, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:05:59.477' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2429, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:06:03.173' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2430, N'admin', N'修改节点', N'修改了节点信息-帮助中心', CAST(N'2021-01-28T10:06:16.650' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2431, N'admin', N'修改节点', N'修改了节点信息-查询统计', CAST(N'2021-01-28T10:07:42.680' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2432, N'admin', N'备份数据库', N'备份了数据库', CAST(N'2021-01-28T10:11:11.823' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2433, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:13:30.897' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2434, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:13:45.907' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2435, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:14:56.880' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2436, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:15:28.217' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2437, N'admin', N'修改节点', N'修改了节点信息-检验计费测算', CAST(N'2021-01-28T10:17:36.547' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2438, N'admin', N'修改节点', N'修改了节点信息-检验计费测算', CAST(N'2021-01-28T10:18:47.267' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2439, N'admin', N'修改节点', N'修改了节点信息-检验登记单管理', CAST(N'2021-01-28T10:19:42.960' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2440, N'admin', N'修改节点', N'修改了节点信息-检验登记单填写', CAST(N'2021-01-28T10:20:15.490' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2441, N'admin', N'修改节点', N'修改了节点信息-检验登记单查询', CAST(N'2021-01-28T10:20:41.793' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2442, N'admin', N'修改节点', N'修改了节点信息-检验登记单审核', CAST(N'2021-01-28T10:21:03.783' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2443, N'admin', N'修改节点', N'修改了节点信息-计费管理', CAST(N'2021-01-28T10:23:49.423' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2444, N'admin', N'修改节点', N'修改了节点信息-检验计费', CAST(N'2021-01-28T10:24:19.107' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2445, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:25:42.833' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2446, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:25:47.027' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2447, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:26:51.900' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2448, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:26:56.577' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2449, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:27:28.803' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2450, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:27:33.177' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2451, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:28:14.613' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2452, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:28:18.543' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2453, N'admin', N'修改节点', N'修改了节点信息-查询统计', CAST(N'2021-01-28T10:32:21.153' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2454, N'admin', N'修改节点', N'修改了节点信息-登记单柱形图查询', CAST(N'2021-01-28T10:32:42.957' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2455, N'admin', N'修改节点', N'修改了节点信息-金额柱形图统计', CAST(N'2021-01-28T10:33:01.680' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2456, N'admin', N'修改节点', N'修改了节点信息-验船师统计页面', CAST(N'2021-01-28T10:33:21.203' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2457, N'admin', N'修改节点', N'修改了节点信息-编码管理', CAST(N'2021-01-28T10:36:22.780' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2458, N'admin', N'修改节点', N'修改了节点信息-设置编码规则', CAST(N'2021-01-28T10:36:45.117' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2459, N'admin', N'修改节点', N'修改了节点信息-设置编码规则', CAST(N'2021-01-28T10:37:06.730' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2460, N'admin', N'修改节点', N'修改了节点信息-编码管理', CAST(N'2021-01-28T10:38:54.603' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2461, N'admin', N'修改节点', N'修改了节点信息-设置编码规则', CAST(N'2021-01-28T10:39:21.010' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2462, N'admin', N'修改节点', N'修改了节点信息-日志管理', CAST(N'2021-01-28T10:39:31.060' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2463, N'admin', N'修改节点', N'修改了节点信息-系统日志', CAST(N'2021-01-28T10:39:44.967' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2464, N'admin', N'修改节点', N'修改了节点信息-系统用户管理', CAST(N'2021-01-28T10:39:55.780' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2465, N'admin', N'修改节点', N'修改了节点信息-分社管理', CAST(N'2021-01-28T10:40:27.277' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2466, N'admin', N'修改节点', N'修改了节点信息-数据维护', CAST(N'2021-01-28T10:45:07.057' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2467, N'admin', N'修改节点', N'修改了节点信息-数据库备份', CAST(N'2021-01-28T10:46:04.260' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2468, N'admin', N'修改节点', N'修改了节点信息-数据库还原', CAST(N'2021-01-28T10:46:33.533' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2469, N'admin', N'修改节点', N'修改了节点信息-数据库删除', CAST(N'2021-01-28T10:46:53.950' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2470, N'admin', N'修改节点', N'修改了节点信息-数据库删除', CAST(N'2021-01-28T10:46:59.690' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2471, N'admin', N'修改节点', N'修改了节点信息-权限管理', CAST(N'2021-01-28T10:47:42.997' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2472, N'admin', N'修改节点', N'修改了节点信息-系统模块设置', CAST(N'2021-01-28T10:48:03.700' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2473, N'admin', N'修改节点', N'修改了节点信息-系统模块设置', CAST(N'2021-01-28T10:48:22.663' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2474, N'admin', N'修改节点', N'修改了节点信息-角色权限分配', CAST(N'2021-01-28T10:49:17.540' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2475, N'admin', N'修改节点', N'修改了节点信息-用户附加权限', CAST(N'2021-01-28T10:49:45.987' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2476, N'admin', N'修改节点', N'修改了节点信息-系统管理', CAST(N'2021-01-28T10:51:46.733' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2477, N'admin', N'修改节点', N'修改了节点信息-数据字典', CAST(N'2021-01-28T10:52:39.157' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2478, N'admin', N'修改节点', N'修改了节点信息-密码重置', CAST(N'2021-01-28T10:53:24.913' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2479, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:57:08.143' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2480, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:57:13.263' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2481, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:57:24.847' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2482, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:57:28.470' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2483, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:57:51.287' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2484, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:57:55.673' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2485, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:58:24.687' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2486, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:58:36.077' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2487, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:59:00.447' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2488, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T10:59:08.523' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2489, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T10:59:23.633' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2490, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T11:37:23.767' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2491, N'admin', N'修改节点', N'修改了节点信息-系统管理', CAST(N'2021-01-28T11:39:42.073' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2492, N'admin', N'修改节点', N'修改了节点信息-数据维护', CAST(N'2021-01-28T11:40:21.200' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2493, N'admin', N'修改节点', N'修改了节点信息-权限管理', CAST(N'2021-01-28T11:41:02.073' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2494, N'admin', N'修改节点', N'修改了节点信息-检验登记单管理', CAST(N'2021-01-28T11:41:45.350' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2495, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:37:27.750' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2496, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T12:37:31.820' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2497, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:37:36.357' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2498, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T12:38:41.710' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2499, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:38:45.553' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2500, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T12:44:56.613' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2501, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:48:58.657' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2502, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T12:49:14.020' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2503, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:49:17.480' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2504, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:53:14.067' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2505, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:55:21.967' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2506, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T12:55:27.213' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2507, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:55:30.867' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2508, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T12:55:37.397' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2509, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T12:56:30.410' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2510, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:02:37.753' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2511, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:02:43.767' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2512, N'leader', N'修改密码', N'修改密码成功', CAST(N'2021-01-28T13:03:04.440' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2513, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:03:12.623' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2514, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:03:24.973' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2515, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:03:46.197' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2516, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:03:51.370' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2517, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:04:33.127' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2518, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:04:41.550' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2519, N'leader', N'修改密码', N'修改密码成功', CAST(N'2021-01-28T13:04:52.317' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2520, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:04:58.517' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2521, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:15:22.440' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2522, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:23:58.657' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2523, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:24:03.137' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2524, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:24:59.783' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2525, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:25:07.057' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2526, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:25:24.593' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2527, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:25:28.413' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2528, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:26:05.840' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2529, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:26:11.050' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2530, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T13:38:26.033' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2531, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:38:31.080' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2532, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:40:02.190' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2533, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:43:04.950' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2534, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:49:56.507' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2535, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T13:59:46.027' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2536, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:02:28.687' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2537, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:17:00.943' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2538, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:19:18.453' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2539, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T14:26:14.087' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2540, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:26:18.680' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2541, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T14:27:27.367' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2542, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:30:01.027' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2543, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T14:33:53.967' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2544, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:34:04.607' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2545, N'leader', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T14:38:16.280' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2546, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:38:20.190' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2547, N'admin', N'修改节点', N'修改了节点信息-系统用户管理', CAST(N'2021-01-28T14:38:38.680' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2548, N'admin', N'修改节点', N'修改了节点信息-查询统计', CAST(N'2021-01-28T14:39:42.760' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2549, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T14:41:00.790' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2550, N'leader', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:41:05.477' AS DateTime), N'::1', N'单位领导', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2551, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T14:51:40.617' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2552, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T15:01:26.660' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2553, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T16:45:22.550' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2554, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-28T16:48:01.497' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2555, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-28T16:48:07.237' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2556, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-29T17:11:49.183' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2557, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-29T19:08:48.837' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2558, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T00:52:58.267' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2559, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T00:57:50.013' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2560, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T01:32:49.547' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2561, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T11:12:07.137' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2562, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T11:24:58.830' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2563, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:30:01.993' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2564, N'admin', N'添加客户', N'添加了一个客户信息:zjh', CAST(N'2021-01-30T12:32:33.837' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2565, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:32:46.283' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2566, N'zjh', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:32:56.417' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2567, N'zjh', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:40:47.653' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2568, N'zhw            ', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:40:54.547' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2569, N'zhw            ', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:45:46.213' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2570, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:45:51.430' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2571, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:46:22.537' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2572, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:46:29.647' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2573, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:47:22.887' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2574, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:47:36.080' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2575, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:47:57.417' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2576, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:48:08.097' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2577, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:49:08.760' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2578, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:49:13.550' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2579, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:51:49.973' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2580, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:51:56.600' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2581, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:52:34.633' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2582, N'cw1', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:52:42.187' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2583, N'cw1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:54:43.547' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2584, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:54:53.350' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2585, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:55:59.263' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2586, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:56:08.440' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2587, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-30T12:57:33.070' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2588, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-30T12:57:38.593' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2589, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T11:29:12.397' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2590, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:21:14.013' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2591, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:34:38.733' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2592, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:34:47.773' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2593, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:34:57.677' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2594, N'ycs', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:35:06.890' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2595, N'ycs', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:35:15.083' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2596, N'ycs1', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:35:22.297' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2597, N'ycs1', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:35:32.497' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2598, N'zjh', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:35:47.080' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2599, N'zjh', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:38:18.983' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2600, N'yph', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:38:27.907' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2601, N'yph', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:45:50.907' AS DateTime), N'::1', N'验船师', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2602, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:45:54.930' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2603, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:52:50.613' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2604, N'cw', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:52:59.907' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2605, N'cw', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T13:55:16.117' AS DateTime), N'::1', N'财务', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2606, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T13:55:20.027' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2607, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-01-31T14:02:07.173' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2608, N'zjh', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T14:02:14.103' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2609, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T15:21:37.243' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2610, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-01-31T15:52:20.417' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2611, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-03-31T19:09:03.083' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2612, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-06T09:55:38.743' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2613, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-06T15:18:56.343' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2614, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-06T15:20:23.163' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2615, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-07T15:16:49.297' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2616, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-07T16:21:38.350' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2617, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-07T16:25:20.047' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2618, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-07T16:30:15.907' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2619, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-04-07T16:32:57.347' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2620, N'zjh', N'登录系统', N'登录系统成功', CAST(N'2021-04-07T16:33:06.420' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2621, N'zjh', N'修改密码', N'修改密码', CAST(N'2021-04-07T16:34:14.553' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2622, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-07T16:34:38.960' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2623, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-07T17:56:44.167' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2624, N'zjh', N'登录系统', N'登录系统成功', CAST(N'2021-04-08T09:21:26.440' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2625, N'zjh', N'点击退出系统', N'退出了系统', CAST(N'2021-04-08T09:21:50.147' AS DateTime), N'::1', N'客户', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2626, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-09T09:37:09.597' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2627, N'admin', N'备份数据库', N'备份了数据库', CAST(N'2021-04-09T09:37:36.927' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2631, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-09T16:19:50.200' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2632, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-04-09T16:20:45.703' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2633, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-21T15:42:38.820' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2634, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-21T15:51:44.690' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2635, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-04-24T19:15:00.027' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2636, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-10T15:02:01.743' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2637, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-06-10T15:03:51.660' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2638, N'996', N'登录系统', N'登录系统成功', CAST(N'2021-06-17T16:20:25.210' AS DateTime), N'::1', N'未知身份', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2639, N'996', N'登录系统', N'登录系统成功', CAST(N'2021-06-17T16:21:07.120' AS DateTime), N'::1', N'未知身份', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2640, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-17T16:23:16.933' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2641, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-17T20:52:34.863' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2642, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-24T10:41:08.693' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2643, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-25T15:52:04.897' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2644, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-25T16:39:58.533' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2645, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-25T16:41:59.287' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2646, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-25T17:19:21.617' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2647, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-25T17:20:23.077' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
GO
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2648, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-25T17:22:02.160' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2649, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-30T10:31:59.543' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2650, N'admin', N'修改节点', N'修改了节点信息-测试模块', CAST(N'2021-06-30T10:33:09.110' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2651, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-06-30T10:33:21.587' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2652, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-30T10:33:23.707' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2653, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-30T10:34:51.007' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2654, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-06-30T15:57:27.487' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2655, N'admin', N'添加角色', N'添加角色成功：123', CAST(N'2021-06-30T15:59:03.473' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2656, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-01T09:54:59.467' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2657, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-01T10:00:47.970' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2658, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-01T10:01:57.923' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2659, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-01T15:28:33.077' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2660, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-01T15:31:07.247' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2661, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-01T15:39:53.987' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2662, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-06T10:29:23.757' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2663, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-06T10:49:11.813' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2664, N'admin', N'点击退出系统', N'退出了系统', CAST(N'2021-07-06T10:50:25.800' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2665, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-07T10:41:06.130' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (2666, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-07T10:47:37.677' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3665, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-08T14:54:18.253' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3666, N'admin', N'添加角色', N'添加角色成功：阿萨德', CAST(N'2021-07-08T14:55:23.617' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3667, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-08T15:40:05.590' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3668, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-07-28T18:07:31.237' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3669, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-09-06T19:41:02.053' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3670, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-10-12T16:28:34.103' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3671, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-10-13T10:19:51.243' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
INSERT [dbo].[TALog] ([Id], [Name], [Operation], [Description], [Time1], [Ip], [Remark], [IpDesc], [remark1], [remark2]) VALUES (3672, N'admin', N'登录系统', N'登录系统成功', CAST(N'2021-10-18T17:16:58.440' AS DateTime), N'::1', N'系统管理员', N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TALog] OFF
SET IDENTITY_INSERT [dbo].[UnitInfo] ON 

INSERT [dbo].[UnitInfo] ([id], [unitId], [unitName], [unitLevel], [superiorUnits], [postalCode], [address], [rmbOpenUnit], [rankAccount], [wOpenUnit], [wbankAccount], [faxNumber], [unitEmaill], [person], [pPhone], [bankOfDeposit], [remark1], [remark2], [remark3], [remark4], [remark5], [remark6], [remark7]) VALUES (20, N'UN_202011_0001', N'中国船级社秦皇岛分社', N'2', N'中国船级社', N'066000', N'河北省', N'建设银行', N'6217000510035612', N'美国银行', N'6742309210234239', N'32432423', N'234432423@163.com', N'张锋', N'18888888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UnitInfo] OFF
SET IDENTITY_INSERT [dbo].[UserRight] ON 

INSERT [dbo].[UserRight] ([id], [userId], [code], [remark1], [remark2]) VALUES (14, N'72', N'009', NULL, NULL)
INSERT [dbo].[UserRight] ([id], [userId], [code], [remark1], [remark2]) VALUES (15, N'72', N'009001', NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserRight] OFF
/****** Object:  StoredProcedure [dbo].[Pr_GetCountNumber]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetCountNumber]  
(  
 @tableName nvarchar(3000),  
 @primaryKey nvarchar(50),  
    @condition nvarchar(max)  
)  
AS  
begin  
DECLARE @sql nvarchar(max)  
 set @sql= 'select count('+ @primaryKey + ') from '+ @tableName +' where ' + @condition  
exec(@sql)  
return  
end 
GO
/****** Object:  StoredProcedure [dbo].[Pr_GetGroupData]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Pr_GetGroupData]
(
 @tableName nvarchar(3000),
 @columns varchar(1000) = '*',
 @groupcolumns varchar(1000) = '*',
 @condition nvarchar(max),
 @orderByColumn nvarchar(50),
 @isASC bit = 1
 )
AS
begin

	DECLARE @sql nvarchar(max)

	IF @isASC = 1
		BEGIN
			set @sql = 'SELECT ROW_NUMBER() OVER (ORDER BY '+ @orderByColumn+' asc) AS Row,' + @columns+ ' from ' +@tableName + ' where '+ @condition+' group by '+@groupcolumns
		END
	ELSE
		BEGIN
			set @sql = 'SELECT ROW_NUMBER() OVER (ORDER BY '+ @orderByColumn+' desc) AS Row,' + @columns+ ' from ' +@tableName + ' where '+ @condition+' group by '+@groupcolumns
		END
	exec(@sql)
end

GO
/****** Object:  StoredProcedure [dbo].[Pr_GetPagedData]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pr_GetPagedData]  
(  
 @tableName nvarchar(3000),  
 @condition nvarchar(max),  
 @orderByColumn nvarchar(50),  
 @isASC bit = 1,   
 @startIndex INT,   
 @endIndex INT  
 )  
AS  
begin  
  
 DECLARE @sql nvarchar(max)  
  
 IF @isASC = 1  
  BEGIN  
   set @sql = 'with temptbl as ( SELECT ROW_NUMBER() OVER (ORDER BY '+ @orderByColumn+' asc) AS Row, * from ' +@tableName + ' where '+ @condition+')'  
        +' SELECT * FROM temptbl where Row between '+ str(@startIndex)+ ' and ' +str(@endIndex)  
  END  
 ELSE  
  BEGIN  
   set @sql = 'with temptbl as ( SELECT ROW_NUMBER() OVER (ORDER BY '+ @orderByColumn+' desc) AS Row, * from ' +@tableName + ' where '+ @condition+')'  
        +' SELECT * FROM temptbl where Row between '+ str(@startIndex)+ ' and ' +str(@endIndex)  
  END  
 exec(@sql)  
end  
GO
/****** Object:  StoredProcedure [dbo].[Pr_GetPagedGroupData]    Script Date: 2021/10/25 15:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pr_GetPagedGroupData]
(
 @tableName nvarchar(3000),
 @columns varchar(1000) = '*',
 @groupcolumns varchar(1000) = '*',
 @condition nvarchar(max),
 @orderByColumn nvarchar(50),
 @isASC bit = 1, 
 @startIndex INT, 
 @endIndex INT
 )
AS
begin

	DECLARE @sql nvarchar(max)

	IF @isASC = 1
		BEGIN
			set @sql = 'with temptbl as ( SELECT ROW_NUMBER() OVER (ORDER BY '+ @orderByColumn+' asc) AS Row,' + @columns+ ' from ' +@tableName + ' where '+ @condition+' group by '+@groupcolumns+')'
					   +' SELECT * FROM temptbl where Row between '+ str(@startIndex)+ ' and ' +str(@endIndex)
		END
	ELSE
		BEGIN
			set @sql = 'with temptbl as ( SELECT ROW_NUMBER() OVER (ORDER BY '+ @orderByColumn+' desc) AS Row,' + @columns+ ' from ' +@tableName + ' where '+ @condition+' group by '+@groupcolumns+')'
					   +' SELECT * FROM temptbl where Row between '+ str(@startIndex)+ ' and ' +str(@endIndex)
		END
	exec(@sql)
end

GO
USE [master]
GO
ALTER DATABASE [TestAccountSystem] SET  READ_WRITE 
GO

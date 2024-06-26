USE [master]
GO
/****** Object:  Database [hospital_Management_Systtem]    Script Date: 29-Apr-24 5:40:41 PM ******/
CREATE DATABASE [hospital_Management_Systtem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hospital_Management_Systtem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\hospital_Management_Systtem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hospital_Management_Systtem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\hospital_Management_Systtem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [hospital_Management_Systtem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hospital_Management_Systtem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hospital_Management_Systtem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET ARITHABORT OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hospital_Management_Systtem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hospital_Management_Systtem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hospital_Management_Systtem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hospital_Management_Systtem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET RECOVERY FULL 
GO
ALTER DATABASE [hospital_Management_Systtem] SET  MULTI_USER 
GO
ALTER DATABASE [hospital_Management_Systtem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hospital_Management_Systtem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hospital_Management_Systtem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hospital_Management_Systtem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hospital_Management_Systtem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hospital_Management_Systtem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'hospital_Management_Systtem', N'ON'
GO
ALTER DATABASE [hospital_Management_Systtem] SET QUERY_STORE = ON
GO
ALTER DATABASE [hospital_Management_Systtem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [hospital_Management_Systtem]
GO
/****** Object:  Table [dbo].[ PatientHistory]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ PatientHistory](
	[PatientID] [int] NOT NULL,
	[EncounterDate] [date] NOT NULL,
	[EncounterType] [int] NOT NULL,
	[AdmissionDate] [date] NULL,
	[RoomNumber] [int] NULL,
	[PaymentDetails] [varchar](255) NOT NULL,
	[PatientCondition] [int] NOT NULL,
	[TreatementAdvice] [varchar](255) NULL,
	[MedicationAdministrated] [varchar](255) NULL,
	[PaymentReceived] [decimal](10, 2) NULL,
	[DischargedDate] [date] NULL,
	[FollowupRecommendations] [varchar](255) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ Patient History] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Location] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Userid] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressHistory]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressHistory](
	[Location] [varchar](100) NOT NULL,
	[CIty] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[Date/Time] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checkup]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checkup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[CheckupDate] [date] NOT NULL,
	[Diagnosis] [nvarchar](max) NOT NULL,
	[TreatementPlan] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Checkup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[HeadOfDepartment] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Location] [varchar](100) NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[UserID] [int] NOT NULL,
	[DepartmentID] [int] NULL,
	[Qualification] [varchar](100) NOT NULL,
	[WorkingHours] [varchar](50) NULL,
	[Expertise] [varchar](50) NULL,
	[OnCallAvailabilty] [int] NOT NULL,
	[Charges/checkup] [money] NULL,
 CONSTRAINT [PK_Doctor_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Category] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Lookup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Med]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Med](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Med_Name] [varchar](20) NOT NULL,
	[Med_Quantity] [int] NOT NULL,
	[Med_Price] [decimal](10, 2) NULL,
	[Manufacturer] [varchar](50) NULL,
 CONSTRAINT [PK_Med] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineHistory]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineHistory](
	[Id] [int] NOT NULL,
	[Med_Name] [varchar](20) NOT NULL,
	[Med_Quantity] [int] NOT NULL,
	[Med_Price] [decimal](10, 2) NOT NULL,
	[Manufacturer] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operate]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[OperationDate] [date] NOT NULL,
	[OperationType] [nvarchar](255) NULL,
	[OperationNote] [nvarchar](max) NULL,
	[OperationOutcome] [nvarchar](max) NULL,
 CONSTRAINT [PK_Operate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Discharged]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Discharged](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Discharged Date] [date] NOT NULL,
	[Treated_Advice_Given] [nvarchar](max) NULL,
	[Treatement_Administrated] [nvarchar](max) NULL,
	[Medication_Administrated] [nvarchar](max) NULL,
	[Payment_Received] [money] NOT NULL,
	[Condition_On_Discharged] [nvarchar](max) NOT NULL,
	[Follow_Up_Recommendation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Patient_Discharged] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[CheckupID] [int] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription_Medicine]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription_Medicine](
	[PrescriptionID] [int] NOT NULL,
	[MedicineID] [int] NOT NULL,
	[Dosage] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Prescription_Medicine] PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC,
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[RoomType] [varchar](50) NOT NULL,
	[BedCapacity] [int] NOT NULL,
	[OccupationStatus] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[Charger/day] [money] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomEquipment]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomEquipment](
	[RoomNumber] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
 CONSTRAINT [PK_RoomEquipment] PRIMARY KEY CLUSTERED 
(
	[RoomNumber] ASC,
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialEquipment]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialEquipment](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[EquipmentName] [varchar](max) NULL,
 CONSTRAINT [PK_SpecialEquipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](225) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[First_Name] [nchar](100) NOT NULL,
	[Last_Name] [nchar](100) NULL,
	[Role] [int] NOT NULL,
	[Status] [nchar](10) NOT NULL,
	[Gender] [nchar](10) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserHistory]    Script Date: 29-Apr-24 5:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserHistory](
	[ID] [int] NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[First_Name] [nchar](100) NOT NULL,
	[Last_Name] [nchar](100) NULL,
	[Role] [int] NOT NULL,
	[Status] [nchar](10) NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lookup] ON 

INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (1, N'Admin                                                                                               ', N'Role                                                                                                ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (2, N'Patient                                                                                             ', N'Role                                                                                                ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (3, N'Doctor                                                                                              ', N'Role                                                                                                ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (4, N'Available                                                                                           ', N'OnCallAvailable                                                                                     ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (5, N'Not Available                                                                                       ', N'OnCallAvailable                                                                                     ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (6, N'Active                                                                                              ', N'User_Status                                                                                         ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (7, N'InActive                                                                                            ', N'User_Status                                                                                         ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (8, N'Waiting                                                                                             ', N'User_Status                                                                                         ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (11, N'Occupied                                                                                            ', N'OccupationStatus                                                                                    ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (12, N'Available                                                                                           ', N'OccuptionStatus                                                                                     ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (13, N'Out of Service                                                                                      ', N'OccupationStatus                                                                                    ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (14, N'Schedule                                                                                            ', N'Appointment_Status                                                                                  ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (15, N'Completed                                                                                           ', N'Appointment_Status                                                                                  ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (16, N'Reschedule                                                                                          ', N'Appointment_Status                                                                                  ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (17, N'Confirmed                                                                                           ', N'Appointment_Status                                                                                  ')
INSERT [dbo].[Lookup] ([ID], [Name], [Category]) VALUES (18, N'Delete                                                                                              ', N'Appointment_Status                                                                                  ')
SET IDENTITY_INSERT [dbo].[Lookup] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [DepName_Uniq]    Script Date: 29-Apr-24 5:40:41 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DepName_Uniq] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_ Patient History_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[ PatientHistory] CHECK CONSTRAINT [FK_ Patient History_User]
GO
ALTER TABLE [dbo].[ PatientHistory]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Room] FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[ PatientHistory] CHECK CONSTRAINT [FK_Patient_Room]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_User] FOREIGN KEY([Userid])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_User]
GO
ALTER TABLE [dbo].[AddressHistory]  WITH CHECK ADD  CONSTRAINT [FK_AddressHistory_Address] FOREIGN KEY([UserId])
REFERENCES [dbo].[Address] ([Userid])
GO
ALTER TABLE [dbo].[AddressHistory] CHECK CONSTRAINT [FK_AddressHistory_Address]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([UserID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Doctor]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Lookup] FOREIGN KEY([Status])
REFERENCES [dbo].[Lookup] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Lookup]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User] FOREIGN KEY([PatientID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User]
GO
ALTER TABLE [dbo].[Checkup]  WITH CHECK ADD  CONSTRAINT [FK_Checkup_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([UserID])
GO
ALTER TABLE [dbo].[Checkup] CHECK CONSTRAINT [FK_Checkup_Doctor]
GO
ALTER TABLE [dbo].[Checkup]  WITH CHECK ADD  CONSTRAINT [FK_Checkup_User] FOREIGN KEY([PatientID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Checkup] CHECK CONSTRAINT [FK_Checkup_User]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Department]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Lookup2] FOREIGN KEY([OnCallAvailabilty])
REFERENCES [dbo].[Lookup] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Lookup2]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_User]
GO
ALTER TABLE [dbo].[MedicineHistory]  WITH CHECK ADD  CONSTRAINT [FK_MedicineHistory_Med] FOREIGN KEY([Id])
REFERENCES [dbo].[Med] ([Id])
GO
ALTER TABLE [dbo].[MedicineHistory] CHECK CONSTRAINT [FK_MedicineHistory_Med]
GO
ALTER TABLE [dbo].[Operate]  WITH CHECK ADD  CONSTRAINT [FK_Operate_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([UserID])
GO
ALTER TABLE [dbo].[Operate] CHECK CONSTRAINT [FK_Operate_Doctor]
GO
ALTER TABLE [dbo].[Operate]  WITH CHECK ADD  CONSTRAINT [FK_Operate_User] FOREIGN KEY([PatientID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Operate] CHECK CONSTRAINT [FK_Operate_User]
GO
ALTER TABLE [dbo].[Patient_Discharged]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Discharged_ Patient History] FOREIGN KEY([PatientId])
REFERENCES [dbo].[ PatientHistory] ([PatientID])
GO
ALTER TABLE [dbo].[Patient_Discharged] CHECK CONSTRAINT [FK_Patient_Discharged_ Patient History]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Checkup] FOREIGN KEY([CheckupID])
REFERENCES [dbo].[Checkup] ([Id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Checkup]
GO
ALTER TABLE [dbo].[Prescription_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Medicine_Med] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Med] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Medicine] CHECK CONSTRAINT [FK_Prescription_Medicine_Med]
GO
ALTER TABLE [dbo].[Prescription_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Medicine_Prescription] FOREIGN KEY([PrescriptionID])
REFERENCES [dbo].[Prescription] ([ID])
GO
ALTER TABLE [dbo].[Prescription_Medicine] CHECK CONSTRAINT [FK_Prescription_Medicine_Prescription]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Department]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Lookup2] FOREIGN KEY([OccupationStatus])
REFERENCES [dbo].[Lookup] ([ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Lookup2]
GO
ALTER TABLE [dbo].[RoomEquipment]  WITH CHECK ADD  CONSTRAINT [FK_RoomEquipment_Room] FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[RoomEquipment] CHECK CONSTRAINT [FK_RoomEquipment_Room]
GO
ALTER TABLE [dbo].[RoomEquipment]  WITH CHECK ADD  CONSTRAINT [FK_RoomEquipment_SpecialEquipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[SpecialEquipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[RoomEquipment] CHECK CONSTRAINT [FK_RoomEquipment_SpecialEquipment]
GO
ALTER TABLE [dbo].[SpecialEquipment]  WITH CHECK ADD  CONSTRAINT [FK_SpecialEquipment_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[SpecialEquipment] CHECK CONSTRAINT [FK_SpecialEquipment_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Lookup] FOREIGN KEY([Role])
REFERENCES [dbo].[Lookup] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Lookup]
GO
ALTER TABLE [dbo].[UserHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserHistory_User] FOREIGN KEY([ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserHistory] CHECK CONSTRAINT [FK_UserHistory_User]
GO
USE [master]
GO
ALTER DATABASE [hospital_Management_Systtem] SET  READ_WRITE 
GO

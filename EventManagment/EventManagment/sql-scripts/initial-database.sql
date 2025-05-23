USE [master]
GO
/****** Object:  Database [EventManagment]    Script Date: 5/1/2025 12:50:46 AM ******/
CREATE DATABASE [EventManagment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventManagment', FILENAME = N'C:\Users\lasha\EventManagment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventManagment_log', FILENAME = N'C:\Users\lasha\EventManagment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EventManagment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventManagment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventManagment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventManagment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventManagment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventManagment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventManagment] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventManagment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EventManagment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventManagment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventManagment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventManagment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventManagment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventManagment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventManagment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventManagment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventManagment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EventManagment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventManagment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventManagment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventManagment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventManagment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventManagment] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EventManagment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventManagment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventManagment] SET  MULTI_USER 
GO
ALTER DATABASE [EventManagment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventManagment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventManagment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventManagment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventManagment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EventManagment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EventManagment] SET QUERY_STORE = OFF
GO
USE [EventManagment]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/1/2025 12:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 5/1/2025 12:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[StartDateDay] [nvarchar](max) NOT NULL,
	[StartDateMonth] [nvarchar](max) NOT NULL,
	[StartDateDayNumber] [int] NOT NULL,
	[StartDateTime] [nvarchar](max) NOT NULL,
	[LocationId] [int] NOT NULL,
	[MaxParticipants] [int] NOT NULL,
	[OrganizerName] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/1/2025 12:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/1/2025 12:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 5/1/2025 12:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OrderId] [int] NULL,
	[BuyerEmail] [nvarchar](max) NULL,
	[IsUsed] [bit] NOT NULL,
	[PromoCode] [nvarchar](max) NULL,
	[QrCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/1/2025 12:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[Roles] [int] NOT NULL,
	[RegistrationCode] [nvarchar](max) NULL,
	[VerificationCode] [nvarchar](max) NULL,
	[VerificationExpiresAt] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250330145119_Init', N'9.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250401140209_EnumInit', N'9.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250406172205_TicketTable', N'9.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250417190358_UpdateEventDescriptionLength', N'9.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250419204903_MakeBuyerEmailNullable', N'9.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250423190230_AdminAccount', N'9.0.3')
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (5, N'🎙ანასტასია როდნაია: ჩემი ჯაზი', N'ამ ხუთშაბათს — საღამო, რომელიც არ უნდა გამოტოვო. სცენაზე იქნება RODNAYA, რომელიც კლასიკური სვინგის, სოულისა და ჰიპ-ჰოპის რიტმებს აერთიანებს.
თქვენ გელით ორიგინალური კომპოზიციები, პორტუგალიური ელემენტები და გულწრფელი, ცოცხალი და ნამდვილიდა ჯაზი, რომელიც ყველას ასე ძალიან გვიყვარს.

🎤 ანასტასია როდნაია – ვოკალი
🎹 ანატოლი ვოლოჩაი – კლავიში
🎷 მიხეილ მინეევი – საქსაფონი
🎸 ივან ლიპატოვი – ბას-გიტარა
🥁 ალექსეი ფომენკო – დასარტყამი

დაჯავშნეთ მაგიდა წინასწარ — თქვენ გელით ძალიან ძალიან თბილი საღამო, ამინდის მიუხედავად ✨

🕖 19:00-21:00 – უნიონში მოქმედებს 1+1 შერჩეულ კოქტეილებზე
🕤 სტუმრების შეკრება: 21:30
🎶 დაწყება: 22:00
👨‍👩‍👧‍👦 ბავშვები დაიშვებიან მშობლებთან ერთად

❓ როგორ დაჯავშნოთ მაგიდა ჯაზის საღამოსთვის უნიონ ჯაზ ბარში? 🎷✨

✅ შეგიძლიათ წინასწარ დაჯავშნოთ მაგიდა და უზრუნველყოთ იდეალური ადგილი ცოცხალი მუსიკის დაუვიწყარი საღამოსთვის.

💰 როგორ მუშაობს ჯავშანი დეპოზიტით?

1️⃣ განსაზღვრეთ სტუმრების რაოდენობა - გთავაზობთ მაგიდებს 4, 3 ან 2 სტუმრისთვის.
2️⃣ ფასი შედგება დეპოზიტისგან, რომელის ღირებულებაა 60 ლარი ერთ ადამიანზე. ამ თანხის დახარჯვა შესაძლებელია მენიუდან ნებისმიერ პოზიციაზე - კერძებსა თუ სასმელზე.
3️⃣ მობრძანდით და ისიამოვნეთ! – თქვენი მაგიდა დაჯავშნილია და გელოდებათ ცოცხალი ჯაზის, საფირმო კოქტეილების და დახვეწილი სამზარეულოს საღამო. 🎷🍸', N'ხუთშაბათი', N'აპრილი', 17, N'22:00', 6, 1000, N'Jazz Union Bar', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F331f08c5-16a7-46c4-9795-fec1062a09a5.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (6, N'მძაფრსიუჟეტიანი და კრიმინალური ფილმების ფესტივალი', N'ძვირფასო მძაფრსიუჟეტიანი კინოსა და ექშენის მოყვარულებო,

მოემზადეთ ორი თავბრუდამხვევი კინოსამყაროს საღამოსთვის — სავსე მოქმედებით, ღალატითა და სასტიკი გადაწყვეტილებებით — Action Thriller Crime Adventure Film Festival – Private Room-ის მეხუთე გამოცემაზე!

დამსხვრეული სამყაროები, პოსტ-აპოკალიფსური ბრძოლა გადარჩენისთვის, სახიფათო კრიმინალური გამოძიებები და პირადი შურისძიება — ეს კინოა, რომელიც არ გაძლევთ საშუალებას თვალები მოაცილოთ ეკრანს!

🎬 ფილმები ნაჩვენებია ორიგინალ ენაზე, ინგლისური, ქართული და რუსული სუბტიტრებით.

🔥25 აპრილი: სისხლის კავშირები, მახეები და ურბანული ქაოსი

DAYLIGHT (დღის სინათლე) (აშშ, 8 წთ) — ფეოდალურ იაპონიაში, აკრძალული სიყვარული ემუქრება უძველესი, სისხლისმოწყურებული შინობი ვამპირებისგან. ვიზუალურად შთამბეჭდავი საბრძოლო ხელოვნების ფენტეზი, სავსე ემოციითა და მახვილების შეჯახებით.

PHANTOM QUARTZ (ფანტომური კვარცი) (საფრანგეთი, 13 წთ) — ყოფილი ელიტარული აგენტი ბრუნდება ქაოსში, როცა უძველესი არტეფაქტი ემუქრება პლანეტის ენერგეტიკულ ბალანსს. ბოლივიიდან დაწყებული — მსოფლიო გადარჩენის მისია.

LOADED DELIBERATION (ბრალეულობის ფასი) (ავსტრალია, 20 წთ) — ბანკის ძარცვის შემდეგ ბანდა იმალება მიტოვებულ საწყობში. როცა ეგოები და უნდობლობა იჩენს თავს — იწყება ნამდვილი ბრძოლა, სადაც ყველა ვერ გადარჩება.

CALY (კალი: მისიის გზა) (მოზამბიკი, 38 წთ) — მამა იწყებს სასტიკ მისიას ქალიშვილის გადასარჩენად და გადააწყდება ღალატის ბადეს. დრამატული და ემოციურად დამანგრეველი ისტორია.

FAMILY BUSINESS (ოჯახური საქმე) (აშშ, 11 წთ) — 17 წლის ბიჭი კრიმინალურ სამყაროში გადაეშვება ოჯახის გადასარჩენად და შოკისმომგვრელ სიმართლეს აღმოაჩენს.

BODY (სხეული) (ისრაელი, 28 წთ) — ორი დაკარგული კაცი, ერთი გვამი და მთელი დღე სასოწარკვეთილებაში. შავი იუმორით გაჯერებული დრამა პასუხისმგებლობაზე, შანსზე და მოულოდნელ კავშირზე.', N'პარასკევი', N'აპრილი', 25, N'16:00', 7, 80, N'Terminal Towers', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F417fb400-9d8a-489d-ae19-2f93c122deaa.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (9, N'რამონა', N'„რამონა“ – ორი ორთქმავლის სიყვარულის ისტორიაა.

პიესის მოქმედება დიდი სამამულო ომის შემდგომ, რკინიგზის სადგურ ,,რიონში” ვითარდება. მძლავრი ორთქმავალი ერმონი სამსახურებრივი მივლინებით მიემგზავრება შორეულ მხარეში „ხუთწლედის ოთხწლედში დასასრულებლად“. სამანევრო რამონა კი რკინიგზის პატარა სადგურში რჩება და ქმარს ელოდება.

მისი დღეები მოგონებებითა და მონატრებითაა სავსე. თვიდან თვემდე, წლიდან წლამდე გრძელდება ეს განშორება და ახალი განსაცდელი მოაქვს გმირებისათვის. რამონას ცხოვრება სამუდამოდ იცვლება, როცა ქალაქში მოხეტიალე ცირკი შაპიტო გამოჩნდება.', N'ოთხშაბათი', N'აპრილი', 30, N'19:00', 10, 120, N'გაბრიაძის თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F0d98a858-cc95-477e-a199-b0e0ae99cc73.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (10, N'ბექა გოჩიაშვილის ლაივი Brouge Bar-ში', N'19 აპრილს Brouge Bar გეპატიჟებით - ბექა გოჩიაშვილის ლაივზე.

Special Guest- მიშო ურუშაძე
Tamtaki Special Takeout

ასაკობრივი შეზღუდვა: 18+', N'შაბათი,', N'აპრილი', 19, N'21:00', 11, 240, N'Brouge Bar', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Ff38bee98-7737-40a7-addb-6d1b1e0c09f7.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (11, N'ღვინის ფესტივალი Wine Ambassadors 2025', N'19 აპრილს, ფესტივალს სასტუმრო Wyndham Grand Tbilisi უმასპინძლებს.

ფესტივალი სტუმრებს სთავაზობს დახვეწილ გარემოს თბილისის მშვენიერი ხედებით, სადაც შესაძლებელია ქართული მცირე საოჯახო მარნების გაცნობა, მათი რჩეული ღვინოების გასინჯვა და შეძენა.

ფესტივალზე წარმოდგენილი იქნება მხოლოდ ის ღვინოები, რომლებიც დეგუსტაციის ეტაპს წარმატებით გაივლიან.

აქვე შესაძლებლობა გექნებათ დააგემოვნოთ ღვინოსთან შეხამებული კერძები ქართული სამზარეულოდან.

ფესტივალზე ასევე მოწვეულნი არიან HoReCa სექტორის წარმომადგენლები და სადისტრიბუციო კომპანიები.

ღონისძიება ხელს უწყობს ქართული ღვინის პოპულარიზაციას ადგილობრივ და საერთაშორისო ბაზრებზე.

ბილეთის ღირებულებაში შედის ბრენდირებული ღვინის ჭიქა.

დასწრების საფასური: 30 ₾

ხანგრძლივობა - 11:00 -დან 18:00-მდე

*არასრულწლოვნები დაიშვებიან მშობლებთან ერთად.', N'ხუთშაბათი', N'მაისი', 1, N'11:00', 12, 400, N'Wyndham Grand Tbilisi', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fd3e6feab-274d-4cdb-a97e-4cf82ecda281.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (12, N'ღმერთო დაგვიფარე ჩვენ და ადამიანები (14+)', N'ძვირფასო მეგობრებო, ბილეთების შეძენის დროს, ყურადღება მიაქციეთ:

ასაკობრივ ზღვარს!

დაგვიანებული მაყურებელი პარტერში არ დაიშვება!

ასაკობრივი შეზღუდვა 12+

კომედია 2 მოქმედებად

ადამიანებს უჭირთ ცხოვრებისეულ სიტუაციებში გარკვევა და მათ ამ სიტუაციებში ცხოველები ეხმარებიან. სპექტაკლი ყველა თაობის მაყურებლისათვის.

პიესის ავტორი: ავთო ვარსიმაშვილი;

რეჟისორები: ავთო ვარსიმაშვილი, ნიკო გომელაური;

მხატვარი: მირიან შველიძე

როლებში: კახა მიქიაშვილი, თინათინ კორძაძე/თამუნა ნიკოლაძე, ოთო ლასხიშვილი, სალომე ჭულუხაძე/ნინო ლომიძე , ლიზი კოტრიკაძე , ელიზბარ ზვიადაძე, მიშა არჯევანიძე, ანი ალადაშვილი, გიგა კაკუბავა', N'სამშაბათი', N'აპრილი', 19, N'19:00', 13, 90, N'თავისუფალი თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fc1663599-21c1-47a7-bc4d-3753ff97a4c3.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (13, N'JAZZ JAM SESSION', N'19 აპრილს , არტერია წარმოგიდგენთ ჯაზ ჯემ სესიას რეზო კინაძის კვინტეტთან ერთად 🔥

•რეზო კინკანაძე - საქსოფონი

•ლაშა საყვარელიძე - საქსოფონი

•ნიკა გაბაძე - გიტარა

•გიორგი სამსონაძე - კონტრაბასი

•გიორგი მელიქიშვილი - დრამი

🚪კარი გაიღება: 21:00

🕰️ დასაწყისი: 22:00

🎟️ონლაინ ბილეთის ფასი: 30₾

კარზე: 40₾

📍მისამართი: თბილისის ისტორიის მუზეუმი - ქარვასლა 🏛️

სიონის ქუჩა 8

მაგიდის დასაჯავშნად მოგვწერეთ ან დაგვიკავშირდით: (+995) 599 38 02 38

შეხვედრამდე ❤️', N'შაბათი', N'აპრილი', 19, N'22:00', 14, 0, N'KARVASLA MUSEUM', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fa7f4cb0e-be37-4792-a26d-c16daea59cce.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (14, N'ლაკეშა ბენჯამინი', N'1-3 მაისს, თბილისი რიგით 28-ე ჯაზფესტივალს მასპინძლობს. როგორც ყოველთვის, წლევანდელი ფესტივალის სტუმრებიც მსოფლიოში წამყვანი ვარსკვლავები იქნებიან. წლევანდელი ჯაზფესტივალი კ. მარჯანიშვილის სახელობის თეატრში ჩატარდება.

1 მაისი - ლაკეშა ბენჯამინი (LAKECIA BENJAMIN)', N'ხუთშაბათი', N'მაისი', 1, N'19:00', 15, 1000, N'მარჯანიშვილის თეატრი', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F36f59047-9b97-4440-a48f-71f2f05ffafe.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (15, N'მეფე ლირი მარჯანიშვილის თეატრში', N'რეჟისორი – ზურაბ გეწაძე

თარგმანი – მანანა ანთაძისა

მხატვარი - შოთა გლურჯიძე

კომპოზიტორი – ერეკლე გეწაძე

სასცენო მოძრაობა – კახა ხოშტარია

რეჟისორის ასისტენტი – სოფო ორჯონიკიძე

მონაწილეობენ: ზურაბ ყიფშიძე, აკაკი ხიდაშელი, ნანუკა ლითანიშვილი, მაია გელოვანი, კატო კალატოზიშვილი/ქეთა შათირიშვილი, ვანო თარხნიშვილი, გიორგი ყიფშიძე, პაატა ინაური, თემო ნატროშვილი, ნიკა წერედიანი, ანრი ბიბინეიშვილი/ჯეჯი სხირტლაძე, გუგა კახიანი, ირაკლი კერესელიძე/ნიკა ნიკურაძე, ერეკლე გეწაძე, გაგა შიშინაშვილი, გაგი შენგელია.

სპექტაკლის ხანგრძლივობა - 180 წუთი / ორ მოქმედებად', N'სამშაბათი', N'მაისი', 27, N'22:00', 16, 180, N'მარჯანიშვილის თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F0371fb90-74cb-4db0-bb62-fe67573ff989.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (16, N'KIBE: DOWNWELL // DUAL PISTOLS // KHORUMI // KNAUGHTY // OMON BREAKER', N'19 აპრილს, KIBE უმასპინძლებს ბერლინში დაფუძნებულ უკრაინელ დიჯეისა და პროდიუსერს Omon Breaker, რომელიც Das Werk კოლექტივის თანადამფუძნებელი და პროექტის Escape on Tape წევრია Supergloss-თან ერთად. მიუხედავად ბერლინში ცხოვრებისა, Omon Breaker მჭიდროდ არის დაკავშირებული უკრაინულ ელექტრონულ სცენასთან. მას B2B სეტით შეუერთდებიან KHIDI-ის რეზიდენტი და მულტიმედია არტისტი Knaughty, ასევე KHIDI-ის გუნდის წევრი და რეგულარული შემსრულებელი Dual Pistols. მათთან ერთად ლაივ სეტით წარდგება ბათუმში დაფუძნებული პროდიუსერი და ლაივ შემსრულებელი, ლეიბლის KHMEBI თანადამფუძნებელი KHORUMI. არტისტებთან ერთად სცენას გაიზიარებს ადგილობრივი დიჯეი, პროდიუსერი და ლაივ არტისტი, ცნობილი ლეიბლის Persephonic Sirens წევრი Downwell', N'შაბათი', N'აპრილი', 19, N'23:59', 17, 1200, N'კიბე (ბათუმი)', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F3358a371-304e-4c1c-8680-74f7e6b6e7f8.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (17, N'ზერო კომპრომაისი 2025', N'ბუნებრივი ღვინის ფესტივალი ZERO COMPROMISE წელს 2-3 მაისს გაიმართება. 

საქართველოში ბუნებრივი ღვინის ყველაზე დიდი ფესტივალი ZERO COMPROMISE 2-3 მაისს გაიმართება და წელს მას უკვე მეორედ ტეცის (ყოფილი არტარეას შენობა) სივრცე უმასპინძლებს. 

ფესტივალის ორგანიზატორია ასოციაცია „ბუნებრივი ღვინო“, რომელიც საქართველოს ღვინის ეროვნული სააგენტოს მხარდაჭერით ორ მთავარ ბუნებრივი ღვინის ფესტივალს — „ამერიმერს“ და ZERO COMPROMISE-ს ატარებს. 

ფესტივალის პარტნიორია აჭარა ჯგუფი. 

ტრადიციულად, ფესტივალში ასოციაციის წევრი მეღვინეები მთელი საქართველოდან მონაწილეობენ. ღონისძიებას ესწრებიან არა მხოლოდ ღვინის მოყვარულები, არამედ ღვინის იმპორტიორები, ჟურნალისტები და მევენახეობა-მეღვინეობის ექსპერტებიც. 

ფესტივალში სტუმრის სტატუსით ოცამდე ევროპელი ბუნებრივი ღვინის მწარმოებელი მეღვინე მიიღებს მონაწილეობას. ღვინის მოყვარულებს შესაძლებლობა ექნებათ, დააგემოვნონ საფრანგეთის, იტალიის, ავსტრიისა და სხვა მეღვინეობის ქვეყნებიდან ჩამოტანილი ღვინოები, რომლებიც უკვე ერთი წელია, საქართველოშიც იყიდება. 

დაჭაშნიკების გარდა, სტუმრები ღვინის ხელმისაწვდომ ფასად შეძენასაც შეძლებენ. ფესტივალის მონაწილეებს ასევე კულინარიული მრავალფეროვნებაც ელოდებათ — სხვადასხვა კვების ობიექტი ქართულ და ევროპულ კერძებს წარმოადგენენ. ადგილზე იქნება ბურგერები, სენდვიჩები, მექსიკური ტაკოები, ხაჭაპური, ღვეზელი, პიცა, ლობიანი და სხვა გემრიელობები. 

ფესტივალი ორდღიანია, შესაბამისად, ბილეთების ფასები ასე განაწილდება: ორღიანი ბილეთი – 50 ლარი, ერთდღიანი ბილეთი – 30 ლარი. 

მისამართი: თბილისი, დოდო აბაშიძის #10, ტეცი, 

11:00 - 17:00 საათი.', N'სამშაბათი', N'მაისი', 2, N'11:00', 18, 2000, N'ტეცი', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F1f2baf3a-388c-41b4-b902-109773e89230.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (18, N'ღამის ქალაქის ჩირაღდნები: ბენზინგასამართი სადგური', N'თეატრის შესახებ:

თეატრი სახელოსნო 42 - ახალი დამოუკიდებელი თეატრალური სივრცეა და მდებარეობს დიდუბეში, თბილისის ინდუსტრიულ ცენტრში, წერეთლის 114-ში, Factory Tbilisi - ის ტერიტორიაზე. თეატრი სახელოსნო 42 ლევან წულაძის მიერაა შექმნილი. 

თეატრის მიზანია დამოუკიდებელი თეატრალური ხელოვნების განვითარება სპექტაკლების, პერფორმანსების, დრამატურგიის, კოპროდუქციების სახით - კრეატიული ინდუსტრიის რეალური პლატფორმის შექმნა და ინტეგრირება თბილისის კულტურულ, ეკონომიკურ და სოციალურ განვითარებაში. 

თეატრი სახელოსნო 264 ადგილზეა გათვლილი და გარდა სპექტაკლებისა, საგანმანათლებლო პროექტებსა და თანამედროვე ტექნოლოგიის განვითარებაზეა ორიენტირებული. სრულიად უნიკალურ სცენასა და მაყურებელთა დარბაზთან ერთად, თეატრის ფოიეც საკმაოდ დატვირთულია და მიმზიდველი თეატრალური კაფეებითა და საგამოფენო სივრცით. 

თეატრის გენერალური სპონსორია თიბისი კონცეპტი ვიზა

მეოთხე რიგის ბილეთებზე ვრცელდება თიბისი კონცეპტის Visa 15%-იანი ფასდაკლება

პ რ ე მ ი ე რ ა

ღამის ქალაქის ჩირაღდნები: ბენზინგასამართი სადგური

ტექსტის ავტორი და რეჟისორი - ლევან წულაძე

სცენოგრაფი - ლევან წულაძე

რეჟისორის ასისტენტი - მაგდა წულაძე

კოსტიუმების მხატვარი - ნინო სურგულაძე

ქორეოგრაფი - თინათინ წულაძე

მუსიკალური გამფორმებელი- ზურაბ გაგლოშვილი

ვიდეო პროექცია - დათა დვალიშვილი

ტექნიკური რეჟისორი - თამარ ფრუიძე

მონაწილეობენ:

კოკო როინიშვილი

ირაკლი ჯაფარიძე

ნინუცა ჩარგეიშვილი

თეონა ქოქრაშვილი

ანა გვანცელაძე

ბუბა ჭოღოშვილი

სპექტაკლის შესახებ:

როდესაც ცხოვრება უმართავი სისწრაფით მიგვაქანებს, ხშირად გვავიწყდება ის, რაც ყველაზე მნიშვნელოვანია. სპექტაკლი გვიამბობს ექვსი ადამიანის ისტორიას, რომლებიც ბედისწერის წყალობით “ბენზინგასამართ სადგურზე” აღმოჩნდებიან და იძულებულნი არიან ყოველდღიური გიჟური რიტმის ფონზე სულ რამდენიმე საათით შეისვენონ. ამ ხანმოკლე პაუზაში მათ ეძლევათ შანსი, თავიდან დაინახონ ერთმანეთი.

სპექტაკლის დასაწყისი | 20:00

ხანგრძლივობა | 90 წუთი', N'სამშაბათი', N'აპრილი', 22, N'20:00', 19, 60, N'თეატრი სახელოსნო 42', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F0d06f99d-5543-4982-afc4-8b6ab765f717.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (19, N'SOULIDAN x SPACEJAM 92 at SAMA', N'არტისტები:

SOULIDAN

SPACEJAM 92

კარის გახსნა: 00:00 საათზე

შესვლის საფასური: 40 ლარი

ასაკობრივი შეზღუდვა: 18+

საჭიროა პირადობის მოწმობა ან პასპორტი

No flashlight

ადგილმდებარეობა: ზაარბრუკენის მოედანი 2/7', N'კვირა', N'აპრილი', 20, N'23:59', 20, 4000, N'SAMA', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F8ba38e3e-590e-42e1-8f45-171024583446.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (20, N'XX საერთაშორისო სააღდგომო ფესტივალი - ნანა ქავთარაშვილის და პაოლო ლარდიცონეს სოლო კონცერტი', N'პირველად საქართველოში ცნობილი იტალიელი ტენორი

პაოლო ლარდიცონე

საგანგებოდ დაიგეგმა ვოკალური მუსიკის საღამო, სადაც მსმენელის წინაშე წარდგებიან იტალიაში მოღვაწე თანამემამულე ნანა ქავთარაშვილი და ფესტივალის საპატიო სტუმარი, ტენორი პაოლო ლარდიცონე. შესრულდება მსოფლიო საოპერო ხელოვნების შედევრებიდან არიები და პოპულარული სიმღერები.

კონცერმაისტერი - ირინა აივაზოვა

2 მაისს, 19.00 სთ. კონსერვატორიის დიდ დარბაზში სწორედ ეს საღამო საზეიმოდ გახსნის საიუბილეო საერთაშორისო სააღდგომო ფესტივალს.

გელით ვოკალური მუსიკის მოყვარულთ უნიკალურ საღამოზე.', N'პარასკევი', N'მაისი', 2, N'19:00', 21, 900, N'თბილისის სახელმწიფო კონსერვატორია', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fa93c7144-7f9e-4ed2-9ebc-1fef0611bb67.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (21, N'თეთრი ვარდები', N'ძვირფასო მეგობრებო, ბილეთების შეძენის დროს, ყურადღება მიაქციეთ:
ასაკობრივ ზღვარს!
დაგვიანებული მაყურებელი პარტერში არ დაიშვება!
ასაკობრივი შეზღუდვა: 14+
(პრემიერა)

“თეთრი ვარდები” სევდიანი კომედია 2 მოქმედებად
პიესის ავტორი და რეჟისორი: ავთო ვარსიმაშვილი.
ირინელა ერთი ჩვეულებრივი ქალია რომელიც დიდი სიყვარულის მოლოდინში დღეებს ითვლის, მაგრამ იქნებ ის დიდი სიყვარული გვერდზე ყავს და ირინელა კი ვერ ხედავს მას.
ილუზიისა და რეალობის ზღვარზე მყოფი გოგონას ისტორია, რომელიც სევდიანიცაა და ღიმილის მომგვრელიც.
მთავარ როლებში: თიკო კორძაძე, ოთო ლასხიშვილი, სლავა ნათენაძე, ლაშა გურგენიძე', N'ოთხშაბათი', N'აპრილი', 23, N'19:00', 22, 140, N'თავისუფალი თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F895c597d-1af6-422c-ac1c-522bb6d9aeac.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (22, N'საფორტეპიანო მუსიკის კონცერტი', N'რობერტ შუმანის და ფრედერიკ შოპენის
დაბადებიდან 215 წლისადმი მიძღვნილი

საფორტეპიანო მუსიკის კონცერტი

მამიკონ ნახაპეტოვი
საქართველო / გერმანია

I
რობერტ შუმანი

ვარიაციები ,,Abegg“ - ის თემაზე - ფა მაჟორი, თხზ.1
იუმორესკა - სი-ბემოლ მაჟორი, თხზ.20

II
ფრედერიკ შოპენი

ფანტაზია ფა მინორი, თხზ.49
ექსპრომტი N1, ლა-ბემოლ მაჟორი, თხზ.29
ბალადა N3, ლა-ბემოლ მაჟორი, თხზ.47
ექსპრომტი N3, სოლ-ბემოლ მაჟორი, თხზ.51
სკერცო N4, მი მაჟორი, თხზ.54', N'ოთხშაბათი', N'აპრილი', 23, N'19:00', 23, 700, N'თბილისის სახელმწიფო კონსერვატორია', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F90436701-5b7f-4703-8cb0-ff6607943e30.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (23, N'Holi - The Biggest Open Color Festival Of Tbilisi', N'🎉 მოემზადეთ ფერების ფესტივალისთვის, როგორც არასდროს!

შემოგვიერთდით დაუვიწყარ და მხიარულ ფერთა ფესტივალზე 🔥

დრო - 12 დან 5 საათამდე

განიცადე საუკეთესო მუსიკალური ექსტრავაგანზა! 🎶

არაშოვლებრივი DJ ARVIND და DJ NEUTRONS მონაწილეობით! 🌃

მოემზადეთ დაუვიწყარი მუსიკალური ნომრებისთვის! 💃

რას უნდა ველოდოთ:

✨ უფასო ფერები

✨ ელექტრო პერფორმანსები

მონიშნეთ თქვენი კალენდრები: 🗓️ 4 მაისი 2025

ეს არის სეზონის ყველაზე მაგარი ღონისძიება! 🔥

დაჯავშნეთ თქვენი ბილეთები ახლავე! 🎟️

არ გამოტოვოთ ფერადი ფერების ფესტივალი ჰოლის ყველაზე ეპიკური ფესტივალი! 💥

ვაქციოთ ეს ჰოლი თბილისის ყველაზე დიდ ფერების ფესტივალად🥳', N'კვირა', N'მაისი', 4, N'12:00', 24, 10000, N'Underwheel Club', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F0a3fe233-4e98-4b62-974e-072030d30779.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (24, N'მარშალ დე ფანტიეს ბრილიანტი', N'ქეთოსა და კოტეს ქორწილის მეორე დღეს, სუფრის თამადა, გაღარიბებული გენერალი ვანო ფანტიაშვილი მოულოდნელად ღებულობს ორ დეპეშას საფრანგეთიდან.
პირველი იუწყება თავადის ბიძის, მარშალ დე ფანტიეს გარდაცვალების ამბავს,
მეორე კი, გენერალ ფანტიაშვილს მსოფლიოში უდიდესი ბრილიანტის “მონტე როზას” მემკვიდრედ აცხადებს.

აქედან იწყება თავადისა და მისი ამალის, ძველი ტფილისის კოლორიტული პერსონაჟების, მოგზაურობა პარიზში,
მხიარული თავგადსავლებითა და ინტრიგებით.
რა ბედი ელით პარიზში გენერალ ფანტიაშვილს და მის მეგზურებს: პროლეტარ ხეჩოს, ფინანსისტ ზიპოს, მემანქანე პორფილეს და განთქმულ ტფილისელ მაჭანკალ ხანუმას
და რამ შეიძლება აიძულოს ნაპოლეონთან ბრძოლებში გამობრძმედილი გენერალი უარი თქვას მსოფლიოში ყველაზე დიდ ბრილიანტზე?

სპექტაკლის ხანგრძლივობა: 75 წუთი

სპექტაკლის დაწყებამდე განტვირთვისთვის გიწვევთ თეატრის ფოიეში მდებარე ბარ "არ იდარდოში".
ბილეთების მფლობელებისთვის ბარი იხსნება 18:00 საათზე,
ხოლო 20:30 საათიდან ველით ყველა სტუმარს.

ასაკობრივი შეზღუდვა: 12 წლამდე ბავშვები არ დაიშვებიან.

პუნქტუალურობა: დაგვიანებული მაყურებელი არ დაიშვება სპექტაკლზე.
დაგვიანების გამო წარმოქმნილი ხმაური ხელს შეუშლის როგორც მსახიობებს სცენაზე,
ისე მაყურებელს დარბაზში და დაარღვევს ჩვენი ინტიმური თეატრის ჯადოსნურ ატმოსფეროს.', N'ხუთშაბათი', N'აპრილი', 24, N'19:00', 25, 230, N'გაბრიაძის თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F71d870d8-cbd1-4921-8a31-142e84101ce8.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (25, N'KURARA', N'კურარას ჯგუფი თანამედროვე ურალის სცენის ერთ-ერთი ნიშანია.
ჯგუფმა გამოუშვა ათი სტუდიური ალბომი, რომელთაგან ბოლო, "PP", გამოვიდა 2023 წლის ზაფხულის ბოლოს.
2024 წელს ჯგუფმა აღნიშნა თავისი 20 წლის იუბილე.

2012 წელს ჯგუფმა გახსნა ბრიტანელი მუსიკოსის Tricky-სთვის,
როგორც მისი რუსული ტურნეს ნაწილი 4 ქალაქში: მოსკოვში, სანქტ-პეტერბურგში, ეკატერინბურგსა და ნიჟნი ნოვგოროდში.
სიმღერა "Kurara Chibana" გახდა სატელევიზიო სერიის "მკვდარი ტბის" სათაური საუნდტრეკი,
და ფილმი "კაცი პოდოლსკიდან" იწყება სიმღერა "აშშ ორი", რომელიც დაჯილდოვდა Kinotavr 2020 ნომინაციაში "Mikael Tariverdiev Prize საუკეთესო ფილმის მუსიკისთვის".
მეცხრე ნომერირებული ალბომი "Brutus" შევიდა თვის საუკეთესო 10 ნომერში კომერსანტისა და კოლტას მიხედვით,
ასევე ჟურნალ Forbes-ის მიერ წლის საუკეთესო 95 ნომერში.
ბენდი ამჟამად მუშაობს ახალ ჩანაწერზე.

ასაკობრივი შეზღუდვა: 16+

კარები ღიაა: 20:00

ღონისძიება დაიწყება: 21:00 საათზე

იუნკიარდის კლუბი

2 ბერი გაბრიელ სალოსი I Turn, Tbilisi 0113, Georgia', N'ხუთშაბათი', N'აპრილი', 24, N'21:00', 26, 400, N'Junkyard Bar', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F75fe5000-efc2-49dd-bca6-c522d1cc9541.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (26, N'ჯერ დაიხოცნენ მერე იქორწინეს', N'ჟანრი - ვოდევილი
რეჟისორი - გოგი მარგველაშვილი
ავტორი - რაფიელ ერისთავი
მხატვარი - ნინო ჩიტაიშვილი
კომპოზიტორი - ნინო ჯანჯღავა
ტექნიკური რეჟისორი - სოფო ორჯონიკიძე
მონაწილეობენ: ნინელი ჭანკვეტაძე, გოგა პიპინაშვილი, გია აბესალაშვილი, ნუცა სულაბერიძე, ჯეჯი სხირტლაძე, გიორგი ყიფშიძე, ირინა გიუნაშვილი/ქეთი ასათიანი, ეკა ანდრონიკაშვილი, თემო გვალია, გუგა კახიანი.

სპექტაკლის ხანგრძლივობა - 140 წთ / ორ მოქმედებად', N'პარასკევი', N'მაისი', 2, N'20:00', 27, 110, N'თუმანიშვილის თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F549e2c10-c085-4344-8917-96f76d49d62a.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (27, N'სიმფონიური როკჰიტები', N'✨ 25 აპრილს, 20:00 საათზე, უნიკალური კონცერტი გაიმართება თბილისის ერთ-ერთი ყველაზე ატმოსფერული ადგილას - Silk Factory Studio-ს სცენაზე. განიცადეთ ლეგენდარული როკ ბენდების საკულტო მუსიკა, რომლებიც შესრულებულია ერთ-ერთი ყველაზე პოპულარული ორკესტრის - Mystery Ensemble-ის მიერ მონდომებით, ვირტუოზობითა და ვნებით!

ამ სანახაობრივ პროგრამაში მოისმენთ Queen-ის, Muse-ის, Rammstein-ის, Metallica-ს, Nirvana-ს, Deep Purple-ის, Scorpions-ისა და AC/DC-ის ჰიტების ელექტრიფიცირებულ შესრულებებს.

წარმოიდგინეთ ფრედი მერკურის და კურტ კობეინის ხმები ვიოლინოსა და ჩელოს სიმების მეშვეობით!

მზად ხართ სეზონის ყველაზე ძლიერი მუსიკალური თავგადასავლებისთვის?

შეიძინეთ ბილეთები ახლავე - ეს არის ერთ-ერთი ყველაზე პოპულარული პროგრამა, მღელვარება ყოველ ჯერზე იზრდება! სიამოვნება გარანტირებულია.

კონცერტის ორგანიზატორები არიან კრეატიული სააგენტო RED EVENTS & Distribution ltd, რომელიც ატარებს განსაკუთრებულ კულტურულ ღონისძიებებს ძველ სასახლეებში, სახურავებზე, სათბურებში და სხვა ყველაზე ატმოსფერულ ადგილებში საქართველოს, ევროკავშირის, გაერთიანებული სამეფოსა და სხვა ქვეყნების მასშტაბით. ასევე რეპერტუარში – კონცერტების კრებული სანთლის შუქზე და ვიდეო არტისა და ხმის სივრცეში სრული ჩაძირვით.

მისამართი: Silk Factory Studio, მ კოსტავას 59, თბილისი, საქართველო', N'პარასკევი', N'აპრილი', 25, N'20:00', 28, 300, N'Silk Factory Studio', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F3573cb71-7d7a-431b-a75a-293546dce495.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (28, N'4GB', N'4GB - ელექტრონული მუსიკის ფესტივალია, რომელიც 2011 წლიდან იმართება და წლების განმავლობაში რეგიონის გამორჩეულ მუსიკალურ მოვლენად იქცა. წელს ფესტივალის ნაცვლად, თბილისში, რადიო ქალაქში მხოლოდ მაიკლ მაიერი დაუკრავს.

ბილეთები იყიდება მხოლოდ წინასწარ ონლაინ-ვერიფიცირებული სტუმრებისთვის და სახელობითია. ერთ ადამიანს შეუძლია მხოლოდ ერთი ბილეთის შეძენა საკუთარი თავისთვის. ბილეთი არ ექვემდებარება დაბრუნებას, გადაცვლას ან სხვა პირისთვის გადაცემას.

ბილეთის გასააქტიურებლად აუცილებელია ატვირთო ფოტო, სადაც შენი სახე კარგად ჩანს, და იდენტიფიკაციისთვის წარადგინო პირადობის დამადასტურებელი დოკუმენტი. ვერიფიკაციის მოთხოვნისას უნდა მიუთითო მოქმედი Facebook ან Instagram პროფილის საჯარო ლინკი. განხილვის პროცესს შეიძლება 5 დღემდე დასჭირდეს.

თუ წარსულში 4GB-ზე უკვე გაიარე ვერიფიკაცია, ხელახლა ამის გაკეთება საჭირო არ არის, თუ იყენებ იმავე ექაუნთს.

ასაკობრივი შეზღუდვა: 18+', N'პარასკევი', N'მაისი', 16, N'21:00', 29, 950, N'Radio City', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fc6a61808-a520-4db5-866b-9c9783a3e49b.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (29, N'სტალკერი', N'ძვირფასო მეგობრებო, ბილეთების შეძენის დროს ყურადღება მიაქციეთ ასაკობრივ ზღვარს — დაგვიანებული მაყურებელი პარტერში არ დაიშვება!

სპექტაკლის პრემიერა წარმოადგენს 2 მოქმედებიან დადგმას, რომლის ხანგრძლივობაა 140 წუთი.

ინსცენირების ავტორი და რეჟისორია ავთო ვარსიმაშვილი, მხატვარი — თეო კუხიანიძე.
მონაწილეობენ: ჯაბა კილაძე, გუგა ქაცარავა, სოფო გორელაშვილი, გოგა ბარბაქაძე, გიგა კაკიბავა.', N'ხუთშაბათი', N'აპრილი', 24, N'19:00', 30, 0, N'თავისუფალი თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F73c0b192-ea66-4206-ae6e-097e1164321c.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (30, N'Lecomte de Brégeot Live Performance', N'💥💥 25 აპრილს, Vortex Group წარმოგიდგენთ ფრანგ ელექტრონული მუსიკის არტისტს Lecomte de Brégeot, რომელიც Sheraton Grand Tbilisi-ის სცენაზე პირდაპირი შესრულებით წარსდგება.

Lecomte de Brégeot — ფრანგი პროდიუსერი და არტისტი, რომლის დახვეწილი და ვიზუალურად შთამბეჭდავი ნამუშევრები განსაკუთრებულად პოპულარულია მოდის ინდუსტრიაში. მან ითანამშრომლა ისეთი ცნობილი ბრენდებთან, როგორებიცაა: Yves Saint Laurent, Nina Ricci, Giorgio Armani, Nars და Vogue.

მისი ერთ-ერთი ყველაზე ცნობილი სინგლი “Paris 1985” გამოყენებული იქნა Balenciaga-ს სარეკლამო კამპანიაში, რომელშიც მონაწილეობდა სუპერმოდელი ბელა ჰადიდი.

ღამეს მუსიკალურად გააფორმებენ ცნობილი არტისტები: Nino Kvantrishvili და Tornike Obolashvili.', N'პარასკევი', N'აპრილი', 25, N'22:00', 31, 250, N'შერატონ გრანდ მეტეხი პალასი', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F4927ba10-47cc-4045-95fd-378c7d193373.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (31, N'თბილისის ვისკის ფესტივალი 2025', N'თბილისის ვისკის ფესტივალი 2025 ბრუნდება — უფრო მასშტაბური, მრავალფეროვანი და შთამბეჭდავი, ვიდრე ოდესმე!

📍 17-18 მაისი | Expo Georgia

ორი დღის განმავლობაში თბილისი გადაიქცევა პრემიუმ ალკოჰოლური სასმელების დედაქალაქად! გელით ვისკის, ჯინის, ბრენდის და სხვა არომატების ნამდვილი დღესასწაული.

ფესტივალის პროგრამა:
• მრავალფეროვანი დეგუსტაციები
• მასტერკლასები საერთაშორისო ექსპერტებისგან
• ცოცხალი მუსიკა
• გემრიელი სამზარეულო
• სიგარები, ხელნაკეთი ქართული შოკოლადები, დეველოპერი „თეთრი კვადრატი“ და სხვა გამორჩეული ბრენდები

ბილეთის ფასი მოიცავს:
• სასმელ წყალს
• 2 დეგუსტაციის ვაუჩერს (სპეციალური სტენდებისთვის)
• უამრავ აქტივობასა და საჩუქარს

დამატებით შესაძლებელია სადეგუსტაციო ჟეტონების შეძენა — 10 ცალი 20 ლარად.

🎟 ბილეთები:
• I კალათა (30 აპრილამდე):
 ერთდღიანი — 49₾
 ორდღიანი — 79₾
• II კალათა (1 მაისიდან):
 ერთდღიანი — 65₾
 ორდღიანი — 95₾', N'სამშაბათი', N'მაისი', 17, N'13:00', 32, 3000, N'ექსპო ჯორჯია, IV, V და VI პავილიონები', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F66acbd59-8e8f-4915-9191-3ef5ee90054a.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (32, N'ცხვირი', N'თეატრი სახელოსნო 42 — ახალი დამოუკიდებელი თეატრალური სივრცეა და მდებარეობს დიდუბეში, თბილისის ინდუსტრიულ ცენტრში, წერეთლის 114-ში, Factory Tbilisi-ის ტერიტორიაზე.

თეატრი სახელოსნო 42 ლევან წულაძის მიერაა შექმნილი.

თეატრის მიზანია დამოუკიდებელი თეატრალური ხელოვნების განვითარება სპექტაკლების, პერფორმანსების, დრამატურგიის, კოპროდუქციების სახით — კრეატიული ინდუსტრიის რეალური პლატფორმის შექმნა და ინტეგრირება თბილისის კულტურულ, ეკონომიკურ და სოციალურ განვითარებაში.

თეატრი სახელოსნო 264 ადგილზეა გათვლილი და გარდა სპექტაკლებისა, საგანმანათლებლო პროექტებსა და თანამედროვე ტექნოლოგიის განვითარებაზეა ორიენტირებული.

სრულიად უნიკალურ სცენასა და მაყურებელთა დარბაზთან ერთად, თეატრის ფოიეც დატვირთულია და მიმზიდველი თეატრალური კაფეებითა და საგამოფენო სივრცით.', N'ხუთშაბათი,', N'აპრილი', 24, N'20:00', 33, 210, N'თეატრი სახელოსნო 42', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F7b305816-02ee-4d7e-829e-2a209a10f11f.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (33, N'გამოუვალი მდგომარეობა', N'25 აპრილს, არტერია წარმოგიდგენთ — „გამოუვალ მდგომარეობას“ 🔥

🎭 მონაწილეობენ:
• ვანო თარხნიშვილი
• დავით გაბუნია
• შოთარი დარახველიძე
• გიორგი გობეჯიშვილი
• ლევან მიქელაძე
• ერეკლე ჭიჭინაძე

🚪 კარი გაიღება: 21:00
✅ დასაწყისი: 22:00

🎟️ ბილეთები:
• პირველი კალათა: 40₾ (ლიმიტირებული რაოდენობით, 17 აპრილამდე) — SOLD OUT
• მეორე კალათა: 50₾
• კარზე: 60₾

📍 მისამართი: თბილისის ისტორიის მუზეუმი — ქარვასლა 🏛️
სიონის ქუჩა 8

📞 მაგიდის დასაჯავშნად მოგვწერეთ ან დაგვიკავშირდით: (+995) 599 38 02 38

ასაკობრივი შეზღუდვა: 16+

❤️ შეხვედრამდე!', N'პარასკევი', N'აპრილი', 25, N'22:00', 34, 760, N'KARVASLA MUSEUM', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F1e683f95-ac80-4249-811b-5c87851cd3c4.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (34, N'Tbilisi Open Air 2025', N'Tbilisi Open Air 2025 — 24-25 მაისი

Tbilisi Open Air განსხვავებული ფორმატით ბრუნდება! 🎉 ფესტივალი გაიმართება 24-25 მაისს, ხოლო 26 მაისს, საქართველოს დამოუკიდებლობის დღეს, ყველანი ერთად შევხვდებით თავისუფლების იდეით გაერთიანებულები.

🌿 ადგილმდებარეობა: Lisi Wonderland

Tbilisi Open Air 2025 არ არის მხოლოდ მუსიკალური ფესტივალი — სტუმრებს უმასპინძლებენ:
• ქართული თეატრი
• ნაციონალური ბალეტი
• ქართული მუსიკალური ლეიბლები
• ბუნებრივი ღვინის ფესტივალი
• თბილისის წიგნის ბაზრობა

ფესტივალის მთავარი მხარდამჭერია თიბისი.

ℹ️ I კალათის ბილეთების რაოდენობა შეზღუდულია

🎶 ფესტივალის ლაინაფი:

MAIN STAGE
24.05 - TOA FOR THEATRE: ''LOUDER'' (დავით ხორბალაძე) | BEDFORD FALLS | არა & ყველა feat. მერაბ სეფაშვილი | MOKUMOKU | MAX.95 | TAMADA & 4D MONSTER LOBSTERS feat. გიორგი უშიიშვილი | SKAZZ & MAMAFLEX | რობი კუხიანიძე & OUTSIDER | ერეკლე გეწაძე feat. SALIO, MEME & DENIVARLEVY | NEWCOMER 2025

25.05 - სუხიშვილების ნაციონალური ბალეტი | KORDZ + ნანი ბრეგვაძე, MECHANICAL RAINBOW | მწვანე ოთახი feat. GIULI CHOKHELI | სპეციალური სტუმარი: პაატა ბურჭულაძე | LOUDSPEAKERS | ბექა გოჩიაშვილი & თემურიკო დიასამიძე / ლუკა თოფურია & MUSHONE / ხატია ქორიძე | KILLAGES feat. KOA & TAHA | SOFTEJECT SYSTEM | გამოუვალი მდგომარეობა | WILL KOLAK | PSYCHONAUT 4 | TAPE VISITORS

UNITY STAGE
24.05 - SEVDA B2B GIO SHENGELIA [KHIDI/4GB] | TOMMA B2B NIKA J [4GB] | SUMO B2B KOTE JAPARIDZE [MZESUMZIRA/303HZ] | ELENE B2B ALEXANDRA [UNITY]
25.05 - SOYL B2B DJ SHODA [ZION] | ZURKIN B2B IKA [VODKAST/SMALL MOVES] | SEQTA B2B OBRI [TES/PITCH] | BERO B2B TOKO K [MTKVARZE] | DJ DELOREAN B2B RYDEEN [TES]

ALTER STAGE
24.05 - PVP FLOW: NIKKI SLOW VS GROTASK | N ICE | KMC | KOKLIANI & iYiBOiY | 9 RHYME | KONTRA | CAS | ATA BABADAN | BXNNY
25.05 - PVP FLOW: MUQTA VS MAD MOSE | KAMI.24 | PINO | SKYRESS | MVYKL | TOVLY | NIKKI SLOW | MOSKA | EDDY AND CREW

💙 სპეციალური მიზანი:
Tbilisi Open Air 2025 თანადგომას უცხადებს მუსიკალური და სახელოვნებო სფეროს წარმომადგენლებს. ბილეთებიდან შემოსული თანხის ნაწილი გადაერიცხება:
• თანამედროვე ხელოვნების და კულტურის ფონდს
• საქართველოს მუსიკოსთა პროფესიულ კავშირს

სურვილის შემთხვევაში, ბილეთის შეძენისას შესაძლებელია დამატებითი დონაცია.

🎟 ბილეთები და აბონემენტები დაცულია უნიკალური QR კოდით. გთხოვთ, შეინახეთ კონფიდენციალურად.
ბილეთები გადაცვლით სამაჯურებში შესასვლელში. 2-დღიანი სამაჯური არ უნდა მოიხსნათ ორივე დღის განმავლობაში.

⚠️ არ შეიძინოთ ბილეთები არაოფიციალური პირებისგან, რომ არ შეგექმნათ პრობლემა.

👧👦 10 წლამდე ასაკის ბავშვებისთვის შესვლა უფასოა, მაგრამ თან უნდა ახლდეთ სრულწლოვანი პირი.

✨ დავბრუნდეთ ბუნებაში, მუსიკაში და თავისუფლებაში!', N'24', N'მაისი', 0, N'12:00', 35, 10000, N'Lisi Wonderland', 1, 2, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fe76b78a6-a4f1-4455-b2f9-d974cb9b5e67.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (35, N'HOUSE OF DISCO vol 7', N'ყველასათვის საყვარელი რიგით მე-7 HOUSE OF DISCO ბრუნდება! 💃🪩

📍 ადგილმდებარეობა: Weather Report

✨ დაგხვდებათ 90-იანების ენერგიული დისკო მუსიკა, ცეკვა და დაუვიწყარი ემოციები.

🎧 ლაინაფი:
• ANNADEV
• GIORGI RAMISHVILI
• TOBIASS

🕘 დასაწყისი: 22:00

🎟 ბილეთები:
• I კალათა: 50 ₾
• კარზე: 70 ₾

🔞 ასაკობრივი შეზღუდვა: 21+

✅ მოქმედებს ფეის და დრეს კონტროლი

მოემზადე დაუვიწყარი ღამისთვის! 🌙✨', N'პარასკევი', N'აპრილი', 25, N'22:00', 36, 100, N'Weather Report Sky Bar', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F66877b10-362e-48fb-9bb6-de49c81a5f0c.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (36, N'სტუმარი (პრემიერა)', N'ხანდახან დუმილი ყვირილზე ხმაურიანია.

არსებობს კითხვები, რომელსაც ადამიანები მხოლოდ საკუთარ თავს ვუსვამთ, თუმცა პასუხს ვერ ვპოულობთ.

პასუხი ჩვენს კითხვებზე ხშირად სულ სხვანაირი გზით მოდის — მაშინ, როცა არ ველით.

მოდის და კარზე აკაკუნებს.

მოდის როგორც... სტუმარი.

მაგრამ ვინ არის ის?

ადამიანი? ილუზია? თუ?... 

და იმ დღეს, როცა სტუმარი კარზე მოაკაკუნებს, ჩვენ დავსვამთ შეკითხვებს.

🎭 რეჟისორები: კოკო როინიშვილი, რატი ლაბაძე

🎬 მსახიობები: გია როინიშვილი, ნიკა ჭკადუა, ნოდარ ძოწენიძე, ნინა ლორთქიფანიძე

🔞 აღნიშნულ სპექტაკლზე ასაკობრივი შეზღუდვა არ მოქმედებს', N'ხუთშაბათი', N'აპრილი', 24, N'20:00', 37, 80, N'ქალაქის თეატრი / City Theatre', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F767d3124-5a45-48c1-82bf-c257d08fdef3.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (37, N'უცნაური ქალბატონი სევიჯი', N'ჯონ პატრიკის კომედია "უცნაური ქალბატონი სევიჯი"

სპექტაკლი ქველმოქმედებაზე, სიკეთეზე, ადამიანურ თანადგომაზე.

ჩვენი სურვილია საზოგადოებას შევახსენოთ ადამიანის უმთავრესი დანიშნულება — თანაგრძნობა.

📝 თარგმნა — ირინე ჯავახიძე
🎭 რეჟისორი — ლუკა ინწკირველი
🎨 მხატვარი — ლიზა ჭიჭინაძე
🎬 რეჟისორის ასისტენტი — ანუკი ხოშტარია
🎛️ ტექნიკური რეჟისორი — სოფო დანელია
🎓 დადგმის ხელმძღვანელი — რუსუდან ბოლქვაძე

👥 მონაწილეობენ:
ეთელ სევიჯი — რუსუდან ბოლქვაძე
ტიტ სევიჯი — ანრი ბიბინეიშვილი
ლილი-ბელ სევიჯი — ანა მატუაშვილი
ექიმი ემეტი — გია აბესალაშვილი
მის ვილი — ნუცა სულაბერიძე
ფლორენსი — ანა მარია გურგენიშვილი
ჰანიბალი — ცოტნე მეტონიძე

🎟 მოწვეული მსახიობები:
ფერი — ნუცა ანდრონიკაშვილი
ჯეფრი — სანდრო აფაქიძე
პედი — თამუნა ბუხრაშვილი
მებაღე — კობა კუნჭულია', N'ხუთშაბათი', N'აპრილი', 24, N'20:00', 38, 110, N'თუმანიშვილის თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F3374147e-83ee-4966-bacf-fa5481b5fd02.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (38, N'პარტახი', N'დრამა ერთ მოქმედებად, ეგნატე ნინოშვილის მოთხრობის მიხედვით.

შეძლებული გლეხი ჯერან ტავრიძე მამიდისა და დედის რჩევით, ცოლად ირთავს ხელმოკლე გლეხის, ზალიკა ნარიშვილის ასულს. ოჯახური ურთიერთობები დამყარებულია არა სიყვარულზე, არამედ ცრუ, ტრადიციების პატივისცემასა და ძალადობაზე. შესაბამისად, ეგნატე ნინოშვილის მოთხრობა „პარტახი“ დღესაც აქტუალურია.

🎭 დამდგმელი რეჟისორი: სანდრო მრევლიშვილი
🎶 მუსიკალური გაფორმება: გომარ სიხარულიძე

👥 მონაწილეობენ:
თორნიკე ბელთაძე,
ნანკა გვარიშვილი,
სოფო მეძმარიაშვილი,
ქეთი ლუარსაბიშვილი,
გურამ ბერეკაშვილი,
გიორგი ქვრივიშვილი,
ბადრი ბეგალიშვილი,
ბექა ქავთარაძე,
ზურა სულხანიშვილი', N'ხუთშაბათი', N'აპრილი', 24, N'20:00', 39, 50, N'სანდრო მრევლიშვილის თბილისის მუნიციპალური თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fba6aa7a8-ca41-4698-afd0-deb7c370f3e9.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (39, N'მულანი', N'პ რ ე მ ი ე რ ა
ჩინური ტრადიციის მიხედვით, ქალს საბრძოლველად წასვლის უფლება არ ჰქონდა. მისი მოვალეობა მხოლოდ ქმრის ერთგულებით და ოჯახის გაძღოლით შემოიფარგლებოდა. მულანის ოჯახი ცდილობდა , გოგონას კარგ საპატარძლოდ წარმოჩენას. ჩინეთში, მონღოლთა ლაშქრის შემოსევას, იმპერატორის ბრძანება მოჰყვა, ოჯახიდან ომში თითო მამაკაცის გაწვევის. რადგან მულანის მამა ხნიერი იყო, მულანმა გადაწყვიტა თავად წასულიყო ომში და ებრძოლა. ასე იქცა მულანი ჩინური ლეგენდის გმირად, რომელმაც საკუთარი ქვეყანა გადაარჩინა.
ასაკი: 5+

🎭 რეჟისორი- ანა სანაია
🎨 მხატვარი- ნინო სურგულაძე
👗 კოსტუმების მხატვარი- სოფიო იოსებიძე
🎼 კომპოზიტორი- თამარ ფუტკარაძე-ლაშხი
💃 ქორეოგრაფი- გია მარღანია
🎬 რეჟისორის თანაშემწე- ნათია ბოშიშვილი

👥 ჰუა მულანი- მარიამ კალატოზიშვილი
👥 ლი შანგი- თორნიკე ბელთაძე
👥 ჰუა ლი- ნინო ჯავახიშვილი
👥 ჰუა ფა სოუ- ჯაბა ჯანაშია
👥 ჩინ ჰო- ლეონიდ გულუა
👥 მუშუ- ადელინა გოგუაძე
👥 ჩი ფუ- კახა ჯოხაძე
👥 შან იუ- შალვა ანთელავა, ზურა ავსაჯანიშვილი
👵 ბებია ფა- მარიამ კობახიძე
👻 წინაპართა სულის წინამძღოლი- შალვა ანთელავა, ზურა ავსაჯანიშვილი
👥 გენერალი ლი- ილია მანაგაძე
👑 იმპერატორი- ნინო ლეჟავა
💍 მაჭანკალი- ნინო მუმლაძე, სალომე ბაკურაძე
🌬️ პირველი სული- თამარ ტყემალაძე
🌬️ მეორე სული- ანა სოხაძე
🌬️ მესამე სული- ნინო მუმლაძე, სალომე ბაკურაძე
⛰️ მთის მეფე- გიორგი რევაზიშვილი
🧒 იო- ილია ბელქანია, კონსტანტინე შაბურიშვილი
👑 ჩინეთის პრინცი- ნიკოლოზ ბიძინაშვილი
👰 საპატარძლო- იოანა ნავაძე
👰 საპატარძლო- ანიტა ჯიქურიშვილი
🧒 ჩინკო- გიორგი რუხაძე
🧒 ლინგ-ლინგი- საბა ქუთათელაძე, სანტი ბასლანძე
🐂 ხარის ფაშვა- კატო თავაძე.', N'პარასკევი', N'აპრილი', 25, N'19:00', 40, 80, N'ნ. დუმბაძის სახ. მოზარდმაყურებელთა თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F6826455a-b0d9-4249-9400-56869a04581d.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (40, N'იცხოვრე ვიდრე ცოცხალი ხარ', N'სევდიანი კომედია ერთ მოქმედებად

თარგმნა გელა გელაშვილმა

ასაკობრივი შეზღუდვა: 9+

რეჟისურა, მხატვრობა და მუსიკალური გაფორმება - აკოფ ღაზანჩიანის
ქორეოგრაფი - კოტე ფურცელაძე
რეჟისორის თანაშემწე - ციცინო გვაზავა

მონაწილეობენ:
სოსო აბრამიშვილი,
ლევან ბერიკაშვილი,
მანანა გამცემლიძე,
თენგიზ გიორგაძე,
ნინო თარხან-მოურავი,
მარინა კახიანი,
ბაჩი ლეჟავა,
მარიტა მესხორაძე,
ზურა შარია,
დარეჯან ხარშილაძე,
მაია ხორნაული', N'პარასკევი', N'აპრილი', 25, N'19:00', 41, 190, N'რუსთაველის ეროვნული თეატრი - მცირე სცენა', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fb1654db9-b099-4535-bd1d-f24a97a852a3.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (41, N'მარ - ლენი', N'„მარ - ლენი“ დრამა ერთ მოქმედებად.

მონაწილეობენ:

მარლენ დიტრიხი - ციცინო ედიბერიძე

ლენი რიფენშტალი - ჯულიეტა პაკელიანი

პიესის ავტორი: თეა დრონი

დამდგმელი რეჟისორი: ლაშა გოგნიაშვილი

გერმანელი დრამატურგის თეა დორნის პიესა „მარლენი“ მოგვითხრობს მარლენ დიტრიხის, 30-იანი წლების ერთ-ერთი ყველაზე პოპულარული კინოვარსკვლავის, ანტიფაშისტის ცხოვრების, უკანასკნელი დღის ამბავს.

დაღლილ, ცხოვრებაზე გულაცრუებულ მარლენ დიტრიხთან დაუპატიჟებელი სტუმარი, მისი ახალგაზრდობის მეგობარი, ლენი რიფენშტალი (გერმანელი მოცეკვავე, კინორეჟისორი, მსახიობი და ფოტოგრაფი, ადოლფ ჰიტლერის და ნაციონალისტურ-სოციალისტური პარტიის იდეების პროპაგანდისტი) მიდის. ლენი ფილმის გადაღებას აპირებს და მთავარ როლში მარლენის მიწვევა სურს. მარლენ დიტრიხი კი, ცდილობს უარი თქვას საინტერესო შეთავაზებაზე.

მიუხედავად დროის, ასაკის და პოლიტიკური განსხვავებულობისა, ადამიანებმა არ უნდა დაკარგონ ერთმანეთის პატივისცემა და თანადგომის სურვილი.', N'პარასკევი', N'აპრილი', 25, N'20:00', 42, 230, N'სანდრო მრევლიშვილის თბილისის მუნიციპალური თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fe2e452c9-75e1-4b31-a62b-8acd59e58293.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (42, N'ჯინსების თაობა (14+)', N'აღწერა
ძვირფასო მეგობრებო, ბილეთების შეძენის დროს, ყურადღება მიაქციეთ:

ასაკობრივ ზღვარს!

დაგვიანებული მაყურებელი პარტერში არ დაიშვება!

ასაკობრივი შეზღუდვა 14+

დრამა 2 მოქმედებად

პიესის ავტორი და რეჟისორი: დათო ტურაშვილი

კომპოზიტორი: ნიკოლოზ რაჭველი

როლებში: გივიკო ბარათაშვილი, აპოლონ კუბლაშვილი, გიორგი ჯიქია, ლაშა გურგენიძე, გეგა ჩხაიძე, შაკო მირიანაშვილი, ოთო ლორთქიფანიძე, არჩილ ბარათაშვილი, კახა მიქიაშვილი, მერაბ ყოლბაია, მამუკა მუმლაძე, მარიამ ნადირაძე, ნუცა მესტუმრიშვილი, ნანა დარჩიაშვილი, ფიქრია ნიქაბაძე, ლელა მეტრეველი, ნინო გაჩეჩილაძე.

,,თვითმფრინავის ბიჭების” რეალური ისტორია. ქართველი ახალგაზრდების ჯგუფმა თვითმფრინავი გაიტაცეს, რათა გაქცეულიყვნენ ქვეყნიდან. ვინ იყვნენ ეს ბიჭები? გმირები თუ ტერორისტები?

„ჯინსების თაობის“ პრემიერა შედგა 2001 წლის მაისში და 17 წელია სპექტაკლი სრული ანშლაგით გადის ,,თავისუფალი თეატრის” სცენაზე', N'შაბათი', N'აპრილი', 26, N'19:00', 43, 330, N'თავისუფალი თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fb414a5cc-f373-447b-9b40-69fca83e02fc.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (43, N'ჭორიკანა ქალები', N'რეჟისორი — დიმიტრი ხვთისიაშვილი

მხატვარი — ნინო ჩიტაიშვილი

რეჟისორის თანაშემწე — ნათია ბოშიშვილი

მუსიკალური გაფორმება — ლევან გვაზავა

მუსიკალური გაფორმება — დიმიტრი ხვთისიაშვილი

ქორეოგრაფი — გია მარღანია

ვიდეო პროექცია — ირაკლი ხვთისიაშვილი

მონაწილეობენ: თამარ ჭანუყვაძე, გიორგი კაჭახიძე, ვახტანგ ნოზაძე, პაატა კიკვაძე, მაია ხორნაული, მაკა ბარდაველიძე, რამონა მიქელაძე, ქეთი ქიტიაშვილი, მერაბ ბრეკაშვილი, გიორგი ოქრუაშვილი, ნინო არჩაია, ვახო ჩაჩანიძე, ვახტანგ ახალაძე.

მეთვრამეტე საუკუნის იტალიელი დრამატურგი და თეატრის რეფორმატორი კარლო გოლდონი წერდა როგორც კომედიებს, ისე ტრაგიკომედიებს, ლიბრეტოებს, ლექსებს და ა.შ. იგი იტალიური რეალისტური კომედიის ფუძემდებლად ითვლება.

გოლდონის შემოქმედება საქართველოში XIX საუკუნის მიწურულს გახდა ცნობილი პიესით „ბუზღუნა კეთილისმყოფელი“, რომელიც 1879 წელს იტალიურიდან ივანე მაჩაბელმა თარგმნა. პიესა მაშინვე დაიდგა სათაურით: „როგორც ჰქუხს, ისე არ სწვიმს“. ქართულ სცენაზე გოლდონის სხვა პიესებიც ხშირად დადგმულა, მათ შორის: „ორი ბატონის მსახური“, „მშვენიერი ქართველი ქალი“, „სასტუმროს დიასახლისი“, „საპატარძლო აფიშით“ და სხვ.

კომედია დელ არტეს სტილში დაწერილი პიესა „ჭორიკანა ქალები“ პირველად 1750 წელს გამოიცა. გოლდონიმ ეს კომედია საგანგებოდ ვენეციის ყოველწლიური კარნავალისთვის დაწერა. სიუჟეტი ასეთია: ბეპომ და კეკინამ დაქორწინება გადაწყვიტეს, მაგრამ ჭორიკანა ქალების ავი ენები მათ ბედნიერებას ხელს შეუშლის - ქორწილის წინ ჭორიკანა ქალები მთელს ვენეციას მოსდებენ ამბავს, რომ კეკინა სინამდვილეში მამამისის შვილი არ არის, ბეპოს ეჭვის ჭია შეუჩნდება და ყოყმანს იწყებს - ამის შემდეგ იწყება დიდი ალიაქოთი და ორომტრიალი.

ასაკობრივი შეზღუდვა +10', N'კვირა', N'აპრილი', 27, N'19:00', 44, 70, N'ნ. დუმბაძის სახ. მოზარდმაყურებელთა თეატრი', 1, 1, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Ff2a3f864-3a08-4e7b-a342-580261b55ebf.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (44, N'Reborn Events Presents - BLESS YOU FIRST TIME IN GEORGIA!', N'REBORN EVENTS PRESENTS- 25 APRIL - BLESS YOU FIRST TIME IN GEORGIA!

BLESS YOU- პირველად საქართველოში!

25 აპრილს,თბილისს გამორჩეული არტისტების დუო ეწვევა.
Bless You არის ჰაუს დუეტი, რომელიც შედგება ვიქტორ ჰოლისა და მორის ოპენჰემისგან.
მათი დებიუტი 2019 წელს შედგა,ძალიან მალევე მოახერხეს ადგილის დამკვიდრება და არაერთი მსოფლიო ჰიტი შექმნეს!
სწორედ ისინი დგანან ახალი,გამორჩეული ტრეკის უკან - GOTTA MOVE.
მოწვეულ არტისტებთან ერთად თქვენს წინაშე ლოკალური სცენის გამორჩეული არტისტები წარსდგებიან:
JUKA B2B N AO
BESSARIONN
ENQ

ლოკაცია: BAZARI - ბაზარის სივრცე კიდევ ერთხელ გადაკეთდება რებორნის ჯადოსნურ სივრცედ ✨ (3a vekua street)
ასაკობრივი შეზღუდვა - 21+
დრეს კოდი - smart casual
DOORS OPEN- 23:00', N'პარასკევი', N'აპრილი', 25, N'23:00', 45, 1000, N'ბაზარი ორბელიანზე (I სართული)', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F63357e58-b776-424e-99ae-703b2a81e7c0.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (45, N'გლემ ფროჯექთს', N'✨ 25 აპრილს გახდი GLAM PROJECT-ის დაუვიწყარი ღამის ნაწილი ✨

პირველად საქართველოში თქვენს წინაშე წარსდგება წარმოშობით მარაქეშიდან და დუბაიში მცხოვრები სიმო მოუმენი, რომელიც გლობალურ არენაზე საკმაოდ ცნობილია.

მისი უახლესი ნამუშევარი, „NEVER GO BACK“, სერტიფიცირებული ჰიტია, რომელიც წლის სიმღერად აღიარებულია თავისი ელექტრო ენერგიისა და ემოციური სიღრმის გამო, რომელსაც მხარს უჭერენ ისეთი ადამიანები, როგორებიც არიან Keinemusik, David Guetta, Black Coffee, MoBlack, Steve Angello, Axwell, Martin Garrix, Tale Of Us, Morten, Agoria და მრავალი სხვა.

TSAMETI-ში მასთან ერთად სცენას გაიზიარებენ, ქართველი ცნობილი არტისტები, JABA GOGATISHVILI და ZUKA SULADZE

📍 ლოკაცია: TSAMETI (თამარაშვილის 13ე)
⏰ დრო: 23:00

👗 დრესკოდი: Your Coolest Outfit

⚠️Face/Age Control 21+', N'პარასკევი', N'აპრილი', 25, N'23:00', 46, 500, N'ცამეტი • Tsameti Restaurant', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F874f002b-f1fe-4c20-a97c-945f1e0290aa.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (46, N'Tribe - სეზონის გახსნა', N'დიდხნიანი ლოდინის შემდეგ Tribe ახალი სეზონით ბრუნდება!

თქვენთვის დაუკრავს მსოფლიო დონის არტისტი ZAC. ბრაზილიურ ელექტრონულ მუსიკაში ცნობილი, პრესტიჟული ლეიბლის Fluxo დამფუძნებელი და დირექტორი, აგრეთვე მუსიკალური პროდაქშენის პროფესორი, ZAC არა მხოლოდ სცენაზე დომინირებს როგორც დიჯეი, არამედ არის საერთაშორისოდ აღიარებული პროდიუსერი.

იგი რეგულარულად გამოდის ქვეყნის უმნიშვნელოვანეს ფესტივალებზე, მათ შორის Warung Day Festival, Universo Paralello და Tomorrowland Brazil.

მასთან ერთად დაუკრავს ყველასათვის საყვარელი ქართველი დიჯეი, Legroni.

ZAC

Georgian DJ - LEGRONI', N'პარასკევი', N'აპრილი', 25, N'23:00', 47, 200, N'TRIBE KING DAVID', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fa4d0289a-e933-40d2-ac15-5ee4624c3fea.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (47, N'KASTA in Tbilisi', N'26 აპრილს კასტა თბილისში ნანატრ სოლო კონცერტს გამართავს. როსტოვის ოთხეული შეასრულებს თავის მთავარ ჰიტებს!

კარის გახსნა: 19:00

ბავშვები 12 წლამდე დაიშვებიან მხოლოდ უფროსებთან ერთად', N'შაბათი', N'აპრილი', 26, N'20:00', 48, 1200, N'ELEKTROWERK', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2F3fc1082e-7166-4b76-ae28-6b4089846925.jpeg&w=3840&q=75')
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDateDay], [StartDateMonth], [StartDateDayNumber], [StartDateTime], [LocationId], [MaxParticipants], [OrganizerName], [Status], [Category], [ImageUrl]) VALUES (48, N'🎶SOULFUL GROOVE NIGHT Union-ში', N'შემოუერთდი Jazz Union-ს 19 აპრილის საღამოს, რომელიც სოულით, ფანკით, R&B-თ და ჯაზით იქნება სავსე. მხოლოდ ამ საღამოს – live-კონცერტი შერჩეული ჰიტებით.

ღამე შთაგონებულია ლეგენდებით: სტივი უანდერი, მაიკლ ჯექსონი, ერიკა ბადუ, ხოსე ჯეიმსი და ემი უაინჰაუსი…საღამო რბილ რიტმებს და ძლიერ ვოკალს ეძღვნება.

🎤ლიზა ლიუტოვა - ვოკალი
🎹ვახე ხაჩატრიანი - ფორტეპიანო
🎸გრიგორი ლოსენკოვი - ბას-გიტარა
🥁ალექსეი ფომენკო - დასარტყამი
✨ მოდი, ისიამოვნე და მუსიკაში დაიკარგე.

19:00-21:00 – უნიონში მოქმედებს 1+1 შერჩეულ კოქტეილებზე
სტუმრების შეკრება: 21:30
დაწყება: 22:00

ბავშვები დაიშვებიან მშობლებთან ერთად

როგორ დაჯავშნოთ მაგიდა ჯაზის საღამოსთვის უნიონ ჯაზ ბარში? 🎷✨

თქვენ შეგიძლიათ წინასწარ დაჯავშნოთ მაგიდა და უზრუნველყოთ იდეალური ადგილი ცოცხალი მუსიკის დაუვიწყარი საღამოსთვის.

როგორ მუშაობს ჯავშანი დეპოზიტით?

1️⃣ განსაზღვრეთ სტუმრების რაოდენობა - გთავაზობთ მაგიდებს 4, 3 ან 2 სტუმრისთვის.
2️⃣ ფასი შედგება დეპოზიტისგან, რომელის ღირებულებაა 60 ლარი ერთ ადამიანზე. ამ თანხის დახარჯვა შესაძლებელია მენიუდან ნებისმიერ პოზიციაზე - კერძებსა თუ სასმელზე.
3️⃣ მობრძანდით და ისიამოვნეთ! – თქვენი მაგიდა დაჯავშნილია და გელოდებათ ცოცხალი ჯაზის, საფირმო კოქტეილების და დახვეწილი სამზარეულოს საღამო.

📍 მნიშვნელოვანია: ჩვენ არ ვყიდით კონცერტზე დასასწრებ ბილეთებს. ეს ჯავშანი დეპოზიტით გარანტიას გაძლევთ რომ დაგხვდებათ თქვენი მაგიდა. მთავარი უპირატესობა კი ის არის, რომ თქვენს დეპოზიტს დახარჯავთ მენიუდან ნებისმიერ პოზიციაზე - კერძებსა თუ სასმელზე.

ასევე შეგიძლიათ გვეწვიოთ ჯავშნისა და დეპოზიტის გარეშე და დატკბეთ ჯაზის ატმოსფეროთ ბართან.

🎟 დაჯავშნეთ მაგიდა ახლავე და შეიგრძენით ჯაზის მაგია!', N'შაბათი', N'აპრილი', 19, N'22:00', 49, 2000, N'Jazz Union Bar', 1, 0, N'https://tkt.ge/_next/image?url=https%3A%2F%2Fstatic.tkt.ge%2Fimg%2Fc8236dae-3e7e-49b3-9370-4a8687337840.jpeg&w=3840&q=75')
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (1, N'Tbilisi', N'SHUAGULI')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (3, N'Tbilisi', N'Mtatsminda Park')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (4, N'Tbilisi', N'Rustaveli Theatre')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (5, N'Tbilisi', N'Freedom Square')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (6, N'თბილისი', N'Erekle tatishvili st.12')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (7, N'თბილისი', N'Chavchavadze ave.37')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (8, N'თბილისი', N'გაბრიაძის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (9, N'თბილისი', N'გაბრიაძის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (10, N'თბილისი', N'გაბრიაძის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (11, N'თბილისი', N'Brouge Bar')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (12, N'თბილისი', N'Wyndham Grand Tbilisi')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (13, N'თბილისი', N'თავისუფალი თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (14, N'თბილისი', N'KARVASLA MUSEUM')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (15, N'თბილისი', N'მარჯანიშვილის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (16, N'თბილისი', N'მარჯანიშვილის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (17, N'ბათუმი', N'კიბე (ბათუმი)')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (18, N'თბილისი', N'ტეცი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (19, N'თბილისი', N'თეატრი სახელოსნო 42')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (20, N'თბილისი', N'SAMA')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (21, N'თბილისი', N'თბილისის სახელმწიფო კონსერვატორია')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (22, N'თბილისი', N'თავისუფალი თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (23, N'თბილისი', N'თბილისის სახელმწიფო კონსერვატორია')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (24, N'თბილისი', N'Underwheel Club')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (25, N'თბილისი', N'გაბრიაძის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (26, N'თბილისი', N'Junkyard Bar')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (27, N'თბილისი', N'თუმანიშვილის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (28, N'თბილისი', N'Silk Factory Studio')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (29, N'თბილისი', N'baramishvili street')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (30, N'თბილისი', N'თავისუფალი თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (31, N'თბილისი', N'შერატონ გრანდ მეტეხი პალასი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (32, N'თბილისი', N'ექსპო ჯორჯია, IV, V და VI პავილიონები')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (33, N'თბილისი', N'თეატრი სახელოსნო 42')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (34, N'თბილისი', N'KARVASLA MUSEUM')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (35, N'თბილისი', N'Lisi Wonderland')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (36, N'თბილისი', N'Weather Report Sky Bar')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (37, N'თბილისი', N'ქალაქის თეატრი / City Theatre')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (38, N'თბილისი', N'თუმანიშვილის თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (39, N'თბილისი', N'სანდრო მრევლიშვილის თბილისის მუნიციპალური თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (40, N'თბილისი', N'ნ. დუმბაძის სახ. მოზარდმაყურებელთა თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (41, N'თბილისი', N'რუსთაველის ეროვნული თეატრი - მცირე სცენა')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (42, N'თბილისი', N'სანდრო მრევლიშვილის თბილისის მუნიციპალური თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (43, N'თბილისი', N'თავისუფალი თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (44, N'თბილისი', N'ნ. დუმბაძის სახ. მოზარდმაყურებელთა თეატრი')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (45, N'თბილისი', N'ბაზარი ორბელიანზე (I სართული)')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (46, N'თბილისი', N'ცამეტი • Tsameti Restaurant')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (47, N'თბილისი', N'TRIBE KING DAVID')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (48, N'თბილისი', N'ELEKTROWERK')
INSERT [dbo].[Locations] ([Id], [City], [Address]) VALUES (49, N'თბილისი', N'Jazz Union Bar')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (5, 5, N'VIP', CAST(120.00 AS Decimal(18, 2)), NULL, NULL, 0, N'SAVE50', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (6, 5, N'VIP', CAST(0.00 AS Decimal(18, 2)), NULL, N'lashatinikashvili29@gmail.com', 0, N'SAVE50', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (7, 6, N'Regular', CAST(90.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (8, 9, N'VIP', CAST(200.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (9, 10, N'Regular', CAST(50.00 AS Decimal(18, 2)), NULL, NULL, 0, N'WELCOME10', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (10, 11, N'VIP', CAST(340.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (11, 12, N'Regular', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (12, 13, N'VIP', CAST(400.00 AS Decimal(18, 2)), NULL, NULL, 0, N'VIPPASS', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (13, 14, N'Regular', CAST(30.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (14, 15, N'VIP', CAST(180.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (15, 16, N'Regular', CAST(99.00 AS Decimal(18, 2)), NULL, NULL, 0, N'SAVE20', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (16, 16, N'VIP', CAST(255.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (17, 17, N'VIP', CAST(255.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (18, 18, N'Regular', CAST(110.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (19, 19, N'VIP', CAST(375.00 AS Decimal(18, 2)), NULL, NULL, 0, N'SUPERDEAL', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (20, 20, N'Regular', CAST(60.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (21, 21, N'VIP', CAST(195.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (22, 22, N'Regular', CAST(20.00 AS Decimal(18, 2)), NULL, NULL, 0, N'COOL20', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (23, 23, N'VIP', CAST(150.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (24, 24, N'Regular', CAST(55.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (25, 25, N'VIP', CAST(230.00 AS Decimal(18, 2)), NULL, NULL, 0, N'LIMITED', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (26, 26, N'Regular', CAST(95.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (27, 27, N'VIP', CAST(330.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (28, 28, N'Regular', CAST(45.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (29, 29, N'VIP', CAST(400.00 AS Decimal(18, 2)), NULL, NULL, 0, N'FASTLANE', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (30, 30, N'Regular', CAST(80.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (31, 31, N'VIP', CAST(270.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (32, 32, N'Regular', CAST(25.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (33, 33, N'VIP', CAST(300.00 AS Decimal(18, 2)), NULL, NULL, 0, N'PARTYHARD', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (34, 34, N'Regular', CAST(60.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (35, 35, N'VIP', CAST(145.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (36, 36, N'Regular', CAST(70.00 AS Decimal(18, 2)), NULL, NULL, 0, N'FUNTIME', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (37, 37, N'VIP', CAST(240.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (38, 38, N'Regular', CAST(95.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (39, 39, N'VIP', CAST(365.00 AS Decimal(18, 2)), NULL, NULL, 0, N'EXCLUSIVE', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (40, 40, N'Regular', CAST(105.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (41, 41, N'VIP', CAST(160.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (42, 42, N'Regular', CAST(85.00 AS Decimal(18, 2)), NULL, NULL, 0, N'FLASH10', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (43, 43, N'VIP', CAST(300.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (44, 44, N'Regular', CAST(49.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (45, 45, N'VIP', CAST(399.00 AS Decimal(18, 2)), NULL, NULL, 0, N'HYPE400', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (46, 46, N'Regular', CAST(33.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (47, 47, N'VIP', CAST(190.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (48, 48, N'Regular', CAST(65.00 AS Decimal(18, 2)), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (49, 12, N'Standard', CAST(0.00 AS Decimal(18, 2)), NULL, N'lashatinikashvili29@gmail.com', 0, N'', NULL)
INSERT [dbo].[Tickets] ([Id], [EventId], [Category], [Price], [OrderId], [BuyerEmail], [IsUsed], [PromoCode], [QrCode]) VALUES (50, 12, N'Standard', CAST(0.00 AS Decimal(18, 2)), NULL, N'lashatinikashvili29@gmail.com', 0, N'', NULL)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [IsVerified], [Roles], [RegistrationCode], [VerificationCode], [VerificationExpiresAt], [Status], [CreatedAt]) VALUES (1, N'Lasha', N'Tinikashvili', N'lashatinikashvili29@gmail.com', N'$2a$11$PvBYxtSuTNCpg26LLBRKPODvsmaaonei/gq5Wgg1Rs4qd2e7RXO0W', 1, 0, N'31b2a884-44f4-4fed-bb8a-863f53dac04b', N'', CAST(N'2025-04-23T19:17:33.9600820' AS DateTime2), 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [IsVerified], [Roles], [RegistrationCode], [VerificationCode], [VerificationExpiresAt], [Status], [CreatedAt]) VALUES (2, N'magda ', N'gelkh', N'magdagelkhauri7@gmail.com', N'$2a$11$fAOCGsaF3jxZ4XE09xVmn.FIZkc5pRHnRfuNOrE0mROZFy8JH1Qw2', 1, 1, N'4db6ea7b-84a0-472a-ac6a-c1fcb5deb5c0', N'', CAST(N'2025-04-28T16:42:19.6250361' AS DateTime2), 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [IsVerified], [Roles], [RegistrationCode], [VerificationCode], [VerificationExpiresAt], [Status], [CreatedAt]) VALUES (3, N'mari', N'tinika', N'tinikashvilimariam9@gmail.com', N'$2a$11$S3dOBuv8aSLE5VXs3MAf3uf0rErBSovjiaF3keDRws.buJTkM76Wu', 1, 1, N'8cd8ae9a-c37c-466a-838a-14dc95aedad1', N'', CAST(N'2025-04-29T12:18:36.2720095' AS DateTime2), 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Events_LocationId]    Script Date: 5/1/2025 12:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_Events_LocationId] ON [dbo].[Events]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UsersId]    Script Date: 5/1/2025 12:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UsersId] ON [dbo].[Orders]
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_EventId]    Script Date: 5/1/2025 12:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_EventId] ON [dbo].[Tickets]
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_OrderId]    Script Date: 5/1/2025 12:50:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_OrderId] ON [dbo].[Tickets]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tickets] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsUsed]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Locations_LocationId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UsersId] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UsersId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Events_EventId] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Events_EventId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Orders_OrderId]
GO
USE [master]
GO
ALTER DATABASE [EventManagment] SET  READ_WRITE 
GO

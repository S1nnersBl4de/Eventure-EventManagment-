IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [Locations] (
    [Id] int NOT NULL IDENTITY,
    [City] nvarchar(max) NOT NULL,
    [Address] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Locations] PRIMARY KEY ([Id])
);

CREATE TABLE [Users] (
    [Id] int NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NOT NULL,
    [LastName] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [PasswordHash] nvarchar(max) NOT NULL,
    [IsVerified] bit NOT NULL,
    [Roles] int NOT NULL,
    [RegistrationCode] nvarchar(max) NULL,
    [VerificationCode] nvarchar(max) NULL,
    [VerificationExpiresAt] datetime2 NULL,
    [Status] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
);

CREATE TABLE [Events] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Description] nvarchar(max) NOT NULL,
    [StartDateDay] nvarchar(max) NOT NULL,
    [StartDateMonth] nvarchar(max) NOT NULL,
    [StartDateDayNumber] int NOT NULL,
    [StartDateTime] nvarchar(max) NOT NULL,
    [LocationId] int NOT NULL,
    [MaxParticipants] int NOT NULL,
    [OrganizerName] nvarchar(max) NOT NULL,
    [Status] int NOT NULL,
    [Category] int NOT NULL,
    [ImageUrl] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Events] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Events_Locations_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Locations] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [Orders] (
    [Id] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [OrderDate] datetime2 NOT NULL,
    [TotalPrice] decimal(18,2) NOT NULL,
    [Status] int NOT NULL,
    [UsersId] int NOT NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Orders_Users_UsersId] FOREIGN KEY ([UsersId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [Tickets] (
    [Id] int NOT NULL IDENTITY,
    [EventId] int NOT NULL,
    [Type] nvarchar(max) NOT NULL,
    [Price] decimal(18,2) NOT NULL,
    [AvailableQuantity] int NOT NULL,
    [OrderId] int NULL,
    CONSTRAINT [PK_Tickets] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Tickets_Events_EventId] FOREIGN KEY ([EventId]) REFERENCES [Events] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Tickets_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([Id])
);

CREATE INDEX [IX_Events_LocationId] ON [Events] ([LocationId]);

CREATE INDEX [IX_Orders_UsersId] ON [Orders] ([UsersId]);

CREATE INDEX [IX_Tickets_EventId] ON [Tickets] ([EventId]);

CREATE INDEX [IX_Tickets_OrderId] ON [Tickets] ([OrderId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250330145119_Init', N'9.0.3');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250401140209_EnumInit', N'9.0.3');

DECLARE @var sysname;
SELECT @var = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Tickets]') AND [c].[name] = N'AvailableQuantity');
IF @var IS NOT NULL EXEC(N'ALTER TABLE [Tickets] DROP CONSTRAINT [' + @var + '];');
ALTER TABLE [Tickets] DROP COLUMN [AvailableQuantity];

EXEC sp_rename N'[Tickets].[Type]', N'Category', 'COLUMN';

ALTER TABLE [Tickets] ADD [BuyerEmail] nvarchar(max) NOT NULL DEFAULT N'';

ALTER TABLE [Tickets] ADD [IsUsed] bit NOT NULL DEFAULT CAST(0 AS bit);

ALTER TABLE [Tickets] ADD [PromoCode] nvarchar(max) NULL;

ALTER TABLE [Tickets] ADD [QrCode] nvarchar(max) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250406172205_TicketTable', N'9.0.3');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250417190358_UpdateEventDescriptionLength', N'9.0.3');

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Tickets]') AND [c].[name] = N'BuyerEmail');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Tickets] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Tickets] ALTER COLUMN [BuyerEmail] nvarchar(max) NULL;

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Events]') AND [c].[name] = N'Description');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Events] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [Events] ALTER COLUMN [Description] nvarchar(MAX) NOT NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250419204903_MakeBuyerEmailNullable', N'9.0.3');

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250423190230_AdminAccount', N'9.0.3');

COMMIT;
GO


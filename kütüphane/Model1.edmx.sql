
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/11/2025 09:52:04
-- Generated from EDMX file: C:\Users\musta\Downloads\kütüphane_bos\kütüphane_bos\kütüphane\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [libraryModelFirstDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [bookNo] int IDENTITY(1,1) NOT NULL,
    [bookName] nvarchar(max)  NOT NULL,
    [writer] nvarchar(max)  NOT NULL,
    [printDate] smallint  NOT NULL,
    [ActionsId] int  NOT NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [tcID] bigint IDENTITY(1,1) NOT NULL,
    [nameSurname] nvarchar(max)  NOT NULL,
    [dob] datetime  NOT NULL,
    [address] nvarchar(max)  NOT NULL,
    [phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Actions'
CREATE TABLE [dbo].[Actions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [deliveryDate] datetime  NOT NULL,
    [purchaseDate] datetime  NOT NULL,
    [isDelivery] bit  NOT NULL,
    [Members_tcID] bigint  NOT NULL,
    [Books_bookNo] int  NOT NULL
);
GO

-- Creating table 'MembersBooks'
CREATE TABLE [dbo].[MembersBooks] (
    [Members_tcID] bigint  NOT NULL,
    [Books_bookNo] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [bookNo] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([bookNo] ASC);
GO

-- Creating primary key on [tcID] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([tcID] ASC);
GO

-- Creating primary key on [Id] in table 'Actions'
ALTER TABLE [dbo].[Actions]
ADD CONSTRAINT [PK_Actions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Members_tcID], [Books_bookNo] in table 'MembersBooks'
ALTER TABLE [dbo].[MembersBooks]
ADD CONSTRAINT [PK_MembersBooks]
    PRIMARY KEY CLUSTERED ([Members_tcID], [Books_bookNo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Members_tcID] in table 'Actions'
ALTER TABLE [dbo].[Actions]
ADD CONSTRAINT [FK_MembersActions]
    FOREIGN KEY ([Members_tcID])
    REFERENCES [dbo].[Members]
        ([tcID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersActions'
CREATE INDEX [IX_FK_MembersActions]
ON [dbo].[Actions]
    ([Members_tcID]);
GO

-- Creating foreign key on [Members_tcID] in table 'MembersBooks'
ALTER TABLE [dbo].[MembersBooks]
ADD CONSTRAINT [FK_MembersBooks_Members]
    FOREIGN KEY ([Members_tcID])
    REFERENCES [dbo].[Members]
        ([tcID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Books_bookNo] in table 'MembersBooks'
ALTER TABLE [dbo].[MembersBooks]
ADD CONSTRAINT [FK_MembersBooks_Books]
    FOREIGN KEY ([Books_bookNo])
    REFERENCES [dbo].[Books]
        ([bookNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MembersBooks_Books'
CREATE INDEX [IX_FK_MembersBooks_Books]
ON [dbo].[MembersBooks]
    ([Books_bookNo]);
GO

-- Creating foreign key on [Books_bookNo] in table 'Actions'
ALTER TABLE [dbo].[Actions]
ADD CONSTRAINT [FK_BooksActions]
    FOREIGN KEY ([Books_bookNo])
    REFERENCES [dbo].[Books]
        ([bookNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BooksActions'
CREATE INDEX [IX_FK_BooksActions]
ON [dbo].[Actions]
    ([Books_bookNo]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
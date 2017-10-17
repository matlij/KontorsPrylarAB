
create database KontorsprylarAB

Go
use KontorsprylarAB

go
create table Article
(
id int identity (1,1) primary key not null,
articleName varchar(MAX) not null,
price int not null,
[description] varchar(MAX)
)

go
create table Customer
(
id int identity (1,1) primary key not null,
userName varchar(MAX) not null,
email varchar(MAX) not null,
[password] varchar(MAX) not null,
deliveryStreet varchar(MAX) not null,
deliveryCity varchar(MAX) not null
)

go
create table [Order]
(
id int identity (1,1) primary key not null,
cid int foreign key references Customer(id) not null,
)

go
create table ArticleToOrder
(
	id int identity (1,1) not null,
	aid int foreign key references Article(id) not null,
	oid int foreign key references [Order](id) not null,
	--quantity int not null,
	--unique(aid, oid)
)

go
create table ShoppingCart
(
	id int identity (1,1) not null,
	aid int foreign key references Article(id) not null,
	cid int foreign key references Customer(id) not null
)

GO
create procedure AddToCart
	@aid int,
	@cid int,
	@id int output
as begin
	insert into ShoppingCart (aid, cid) values (@aid, @cid)
	set @id = SCOPE_IDENTITY()
end

declare @CartID int
execute AddToCart 5, 1, @CartID output

select * from article
select * from customer
select * from ShoppingCart
	
go
create procedure RegisterCustomer
@userName varchar(Max),
@email varchar(Max),
@password varchar(max),
@deliveryStreet varchar(max),
@deliveryCity varchar(max),

@cid int output

as
begin


Insert into Customer (userName, email, password, deliveryStreet, deliveryCity) values (@userName, @email, @password, @deliveryStreet, @deliveryCity)
set @cid =SCOPE_IDENTITY()
end


go
create procedure AddArticle

@articleName varchar(MAX),
@price int,
@description varchar(MAX),
@aid int output

as
begin
Insert into Article (articleName, price, description) values (@articleName, @price, @description)
set @aid =SCOPE_IDENTITY()
end

--declare @aid int
--execute AddArticle 'Radergummi', '10', 'Radergummi beskrivning', @aid output


go
create procedure RegisterOrder
@cid int,
@oid int output

as
begin
Insert into [Order] (cid) values (@cid)
set @oid =SCOPE_IDENTITY()
end


go
create procedure AddArticleToOrder
	@oid int,
	@aid int
as
begin
	Insert into ArticleToOrder (oid, aid) values (@oid, @aid)
end

delete from Article where id=4

--select * from [Order], ArticleToOrder, Article where
--	[Order].id = 

go
create procedure RemoveArticle
	@aid int
AS
BEGIN

	Delete from Article where id=@aid

END

go
create procedure UpdateArticle
	@aid int,
	@articleName varchar(MAX),
	@price int,
	@description varchar(MAX)

AS
BEGIN

	Update Article set articleName=@articleName, price=@price, description=@description where id=@aid

END

select * from [Order]
select * from ArticleToOrder
select * from Article
select * from Customer

select * from Article, ArticleToOrder, [Order] where
	Article.id = ArticleToOrder.aid and

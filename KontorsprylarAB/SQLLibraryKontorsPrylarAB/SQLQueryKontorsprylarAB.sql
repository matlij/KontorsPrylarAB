
use [master]
go

drop database [KontorsprylarAB]
go

create database [KontorsprylarAB]
go

use [KontorsprylarAB]
go

create table Article
(
	id int identity (1,1) primary key not null,
	articleName varchar(max) not null,
	price int not null,
	[description] varchar(max)
)
go

create table Customer
(
	id int identity (1,1) primary key not null,
	userName varchar(max) not null,
	email varchar(max) not null,
	[password] varchar(max) not null,
	deliveryStreet varchar(max) not null,
	deliveryCity varchar(max) not null
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
	id int identity (1,1) primary key not null,
	articleName varchar(MAX) not null,
	price int not null,
	[description] varchar(MAX),
	aid int foreign key references Article(id) not null,
	cid int foreign key references Customer(id) not null
)

--Cart procedures
GO
create procedure AddToCart
	@articleName varchar(MAX),
	@price int,
	@description varchar(MAX),
	@aid int,
	@cid int,
	@id int output
as begin
	insert into ShoppingCart (articleName, price, description, aid, cid) values (@articleName, @price, @description, @aid, @cid)
	set @id = SCOPE_IDENTITY()
end

GO
create procedure RemoveItemFromCart
	@id int,
	@cid int
as begin
	delete from ShoppingCart where 
		cid=@cid and
		id=@id 
end

GO
create procedure ReadCart
	@cid int
as begin
	select * from ShoppingCart where cid = @cid
end

GO
create procedure RegisterCustomer
	@userName varchar(Max),
	@email varchar(Max),
	@password varchar(max),
	@deliveryStreet varchar(max),
	@deliveryCity varchar(max),
	@cid int output
as
begin
	insert into Customer (userName, email, [password], deliveryStreet, deliveryCity)
	values (@userName, @email, @password, @deliveryStreet, @deliveryCity)
	set @cid = SCOPE_IDENTITY()
end
go

create procedure AddArticle
	@articleName varchar(MAX),
	@price int,
	@description varchar(MAX),
	@aid int output
as
begin
	insert into Article (articleName, price, [description])
	values (@articleName, @price, @description)
	set @aid = SCOPE_IDENTITY()
end
go

create procedure RegisterOrder
	@cid int,
	@oid int output
as
begin
	insert into [Order] (cid)
	values (@cid)
	set @oid = SCOPE_IDENTITY()
end
go

create procedure AddArticleToOrder
	@oid int,
	@aid int
as
begin
	insert into ArticleToOrder (oid, aid)
	values (@oid, @aid)
end

go
create procedure RemoveArticle
	@aid int
as
begin
	delete 
	from Article 
	where id=@aid
end

GO
create procedure UpdateArticle
	@aid int,
	@newArticleName varchar(MAX),
	@newArticleDescription varchar(MAX),
	@newArticlePrice int
as
begin
update Article
	set articleName=case when len(@newArticleName)>0 then @newArticleName else articleName end,
		description=case when len(@newArticleDescription)>0 then @newArticleDescription else description end,
		price=case when len(@newArticlePrice)>0 then @newArticlePrice else price end
		where ID=@aid
end

GO
declare @cid int
execute RegisterCustomer 'admin', 'admind@mail.com', 'admin', 'adminStreet', 'adminCity', @cid output
go

declare @cid int
execute RegisterCustomer 'TestKund1', 'tk1@mail.com', 'testkund1', 'testStreet', 'testCity', @cid output
go

declare @cid int
execute RegisterCustomer 'TestKund2', 'tk2@mail.com', 'testkund2', 'testStreet', 'testCity', @cid output

go
declare @aid int
execute AddArticle 'Kontorsstol', '1500', 'Snygg ergonomisk kontorsstol för seriöst arbete.', @aid output
go

declare @aid int
execute AddArticle 'Krukväxt', '190', 'Krukväxt med gröna blad som förhöjer känslan av natur.', @aid output
go

declare @aid int
execute AddArticle 'Kaffeautomat', '12000', 'Hjärtat på varje arbetsplats, kaffeautomaten.', @aid output
go

select * from [order]
select * from ArticleToOrder
select * from Article
select * from ShoppingCart
select * from Customer

declare @oid int
execute RegisterOrder 3, @oid output
execute AddArticleToOrder 2, 4


GO
create procedure ReadAllOrdersFromCID
	@cid int
as begin
	select * from [order], Article, ArticleToOrder where
	[order].id = ArticleToOrder.oid and
	Article.id = ArticleToOrder.aid and
	[order].cid = 2
end

GO
create procedure EmptyCart
	@cid int
as begin 
	delete from ShoppingCart where 
	cid = @cid
end

GO
create procedure UpdateCustomer
@cid int,
@newUserName varchar(MAX),
@newEmail varchar(MAX),
@newPassword varchar(MAX),
@newStreet varchar(MAX),
@newCity varchar(MAX)

as
begin
update Customer
set userName=case when len(@newUserName)>0 then @newUserName else userName end,
    email=case when len(@newEmail)>0 then @newEmail else email end,
    [password]=case when len(@newPassword)>0 then @newPassword else [password] end,
    deliveryStreet=case when len(@newStreet)>0 then @newStreet else deliveryStreet end,
deliveryCity=case when len(@newCity)>0 then @newCity else deliveryCity end

    where ID=@cid

end
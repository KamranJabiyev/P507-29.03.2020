create database Academy


use Academy

create table Groups(
	Id int primary key identity,
	[Name] nvarchar(100) unique
)

create table Students(
	Id int primary key identity,
	[Name] nvarchar(100),
	Surname nvarchar(100),
	GroupId int references Groups(Id)
)



alter table Students add Grade int



insert into Groups values
('P507'),
('P211')

insert into Students values
('Farid','Aliyev',1,100),
('Kanan','Bagaliyev',1,100),
('Imadeddin','Nesimi',1,70),
('Molla','Vaqif',2,65)



select * from Students 
where GroupId=2



select g.Name,Count(*) 'Student count' from Groups g
join Students s
on g.Id=s.GroupId
group by g.Name



create view usp_StudentDetails
as
select s.Name,g.Name 'Group',Surname,Grade from Students s
join Groups g
on g.Id=s.GroupId

select * from usp_StudentDetails



create procedure GetStuByGrade(@Grade int)
as
select * from Students
where Grade>@Grade

exec GetStuByGrade 70




create function GetStuCountByGroupId(@GroupId int)
returns int
as
begin
	declare @Count int
	select @Count=Count(*) from Students where GroupId=@GroupId
	return @Count
end

select dbo.GetStuCountByGroupId(1)
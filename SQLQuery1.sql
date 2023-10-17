--create function showHelloWrorld()
--returns nvarchar(50)
--as
--Begin
--	return 'hello world'
--End

--select dbo.showHelloWrorld() as 'Text'

--drop function dbo.showHelloWrorld;

--create function showText(@text nvarchar(50))
--returns nvarchar (50)
--as
--Begin
--	return @text + '-Function with parametr'
--End

--select dbo.showText('Ismayil')
--select dbo.showText('Kubra')
--select dbo.showText('Fidan')

--create function numberToStr(@nuber int()
--returns nvarchar (50)
--as
--Begin
--	return @number
--End

--select dbo.numberToStrNew(0)

--create function SumOfNumbers(@num1 int, @num2 int)
--returns int
--as
--Begin
--	declare @sum int;
--	set @sum = @num2 + @num2
--	return @sum
--End

--select dbo.SumOfNumbers(10, 30)

--create function countOfEmployeesById(@id int)
--returns int
--as
--Begin
--	declare @empCount int;
--	select @empCount = Count (*) from Employees em
--	where em.Id > @id
--	return @empCount
--End

--select * from Employees

--select dbo.countOfEmployeesById(7)


--create function sumOfCountAndAvgAgesByEmployees()
--returns nvarchar(50)
--as
--Begin
--	declare @count int;
--	declare @avgAge int;
--	declare @result int;
--	select @count = Count(*) from Employees
--	select @avgAge = AVG(Age) from Employees
--	set @result = @avgAge + @count;
--	return CAST (@result as nvarchar (50))
--End

--select dbo.sumOfCountAndAvgAgesByEmployees()

--create procedure usp_showText
--as
--Begin
--	print 'hello world'
--End

--exec usp_showText

--create procedure usp_deleteEmployeeById
--@id int
--as
--Begin
--	delete from Employees where Id = @id
--End

--select * from Employees

--exec usp_usp_deleteEmployeeById 5


--create procedure usp_updateEmployeeNameById
--@id int,
--@name nvarchar(50)
--as
--Begin
--	update Employees set [Name] = @name where Id = @id
--End

--exec usp_updateEmployeeNameById 7, 'XXX'

--exec usp_updateEmployeeNameById 10, 'YYX'

--create procedure usp_isDeleted
--@id int
--as
--Begin
--	update Employees
--	set IsDeleted = 'true' where Id=@id
--End

--exec usp_isDeleted 6

--create procedure usp_createNewEmployees
--@name nvarchar(50),
--@surname nvarchar(50),
--@age int,
--@salary decimal(3,2),
--@position nvarchar(50),
--@isDeleted bit,
--@cityId int
--as
--Begin
--insert into Employees([Name],[Surname],[Age],[Salary],[Position],[CityId])
--values(@name,@surname,@age,@salary,@position,@cityId)
--End

--select * from Employees
--select * from Employees where IsDeleted = 'ture'


--usp_createNewEmployees 'Ismayil', 'Efendizade',29,2.60,'back-end developer',1

--create table EmployeeLogs(
--[Id] int primary key identity (1,1),
--[EmployeeId]int,
--[Operation] nvarchar(20),
--[Date] datetime
--)

--create trigger tr_afterCreateEmployee on Employees
--after insert
--as
--Begin
--	insert into EmployeeLogs([EmployeeId],[Operation],[Date])
--	select Id, 'Insert', GetDate() from inserted
--End

--select * from EmployeeLogs

--select * from Employees

--usp_createNewEmployees 'Fidan', 'Basirova',29,2.60,'back-end developer',1

create trigger tr_afterDeleteEmployee on Employees
after delete
as
Begin
	insert into EmployeeLogs ([EmployeeId],[Operation],[Date])

	select Id, 'delete', Getdate() from deleted
End

exec usp_deletEmployeeById

select * from Employees

select * from EmployeeLogs

create trigger tr_afterUpdateEmp on Employees
after update
as
Begin
	insert into EmployeeLogs([EmployeeId],[Operation],[Date])
	select Id, 'update',Getdate() from deleted
End

exec usp_updateEmployeeNameId 10, 'Surac'

exec usp_isDelete 13
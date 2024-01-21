--1. SP "Factorial". SP calculates the factorial of a given number. (5! = 1 * 2 * 3 * 4 * 5 = 120 ) 
--(the factorial of a negative number does not exist).
--1.  SP “Factorial”. SP verilən rəqəmin faktorialını hesablayır. (mənfi ədədin faktorialı olmur, nəzərə alın)

create PROCEDURE usp_factorial
    @num AS int
AS
BEGIN
    DECLARE @factorial AS int
    DECLARE @count AS int

    SET @factorial = 1
    SET @count = 1
    if @num < 0
            Begin
            return
            End
    WHILE @count <= @num
    BEGIN
        
        SET @factorial = @factorial * @count
        SET @count = @count + 1
    END  
    print @factorial
END

Exec usp_factorial @num=5





--2. SP "Lazy Students." SP displays students who never took books in the library and through the output parameter returns the number of these students.
--2. SP “Lazy Students”. SP heç vaxt kitab götürməyən tələbələri göstərir və output parametrlə bu tələbələrin sayını qaytarır


create proc usp_Lazy
    @count AS int OUTPUT
as
Begin
    SET NOCOUNT ON
    select Students.FirstName,Students.LastName,Books.[Name],S_Cards.DateOut from Students
    inner join S_Cards on S_Cards.Id_Student=Students.Id
    inner join Books on S_Cards.Id_Book=Books.Id
    where S_Cards.DateIn IS NULL

    SET @count = @@ROWCOUNT
End

declare @countS int
exec usp_Lazy @count = @countS output
print @countS


--3. SP "Books on the criteria." SP displays a list of books that matching criterion: the author's name, surname, subject, category. In addition, the list should be sorted by the column number specified in the 5th parameter, in the direction indicated in parameter 6. Columns: 1) book identifier, 2) book title, 3) surname and name of the author, 4) topic, 5) category.
--3. SP "Books on the criteria". SP verilən kriteriyalara uygun olan kitapların listini göstərir : author name, surname , subject, category. Əlavə olaraq list verilən 5-ci parametrə görə sort olunmalıdır, 6cı parametrdə isə hansı istiqamətdə sort olunacağı qeyd olunur.
--5ci parametr üçün göndərilə biləcək rəqəmlər (sütunlar) : 1) book identifier, 2) book title, 3) surname and name of the author, 4) topic, 5) category.

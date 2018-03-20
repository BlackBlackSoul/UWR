 CREATE FUNCTION dbo.Pesel (@pesel nvarchar(11))
RETURNS @ret TABLE
(
  BirthDate date,
  Gender char,
  Valid int
)
AS
BEGIN
  DECLARE @fact varchar(11)='13791379131'
  DECLARE @sum int=0
  DECLARE @i int=1
  DECLARE @valid int=1
  DECLARE @validInt int=1
  DECLARE @c char
  DECLARE @date date
  DECLARE @gender char
  
  IF (LEN(@pesel)!=11)
    SET @validInt=0
  ELSE
    WHILE @i<=11
    BEGIN
      SET @c=SUBSTRING(@pesel,@i,1)
      IF (@c<'0' OR @c>'9')
        SET @validInt=0
      ELSE
        SET @sum+=CAST(SUBSTRING(@fact,@i,1) as int)*@c
      SET @i+=1
    END

  IF @sum%10!=0 OR @validInt=0
    SET @valid=0
  
  IF @validInt=1
  BEGIN
    DECLARE @int int = SUBSTRING(@pesel,1,2)
    DECLARE @rok int = 1900+@int;
    SET @int = SUBSTRING(@pesel,3,1)
    IF (@int>=2 AND @int<8)
      SET @rok+=@int/2*100;
    IF (@int>=8)
      SET @rok-=100;

    DECLARE @miesiac int = (@int%2)*10+SUBSTRING(@pesel,4,1);

    DECLARE @str varchar(10) = CAST(@rok AS varchar)+
      CASE WHEN @miesiac<10 THEN '0' ELSE '' END+
      CAST(@miesiac AS varchar)+SUBSTRING(@pesel,5,2);
    IF ISDATE(@str)=1
      SET @date=CAST(@str as date)
    ELSE
      SET @valid=0
    SET @gender = CASE WHEN SUBSTRING(@pesel,10,1)%2=1 THEN 'M' ELSE 'K' END
  END
  
  INSERT @ret SELECT @date, @gender, @valid
  RETURN
END 
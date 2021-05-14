use ComputerShopDB
go
CREATE FUNCTION timesTwo
(
    -- Add the parameters for the function here
    @quantity INT
)
RETURNS INT
AS
BEGIN
    -- Return the result of the function
    RETURN @quantity * 2;
END;
CREATE PROCEDURE sp_InsertarRegistro(
 @Id bigint,
@IdTipo tinyint,
@Precio money,
@UrlImagen varchar(900),
@Nombre varchar (50),
@Talle varchar (20),
@Descripcion varchar (100),
@Estado bit,
@Color  varchar (50),
@StockMinimo int,
@StockActual int

)
AS
BEGIN
  INSERT INTO Producto(Id,IdTipo,Precio,UrlImagen,Nombre,Talle,Descripcion,Estado,Color,StockMinimo,StockActual) 
  VALUES(@Id,@IdTipo,@Precio,@UrlImagen,@Nombre,@Talle,@Descripcion,@Estado,@Color,@StockMinimo,@StockActual)
END



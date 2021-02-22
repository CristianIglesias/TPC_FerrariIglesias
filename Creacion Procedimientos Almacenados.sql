--Cargar un Articulo en la base--------Procedimiento almacenado de Insert---------------------------------------------------------------------------------------------
create PROCEDURE sp_InsertarRegistro(
@IdTipo tinyint,
@Precio money,
@UrlImagen varchar(900),
@Nombre varchar (50),
@Talle varchar (20),
@Descripcion varchar (100),
@Estado bit,
@Color  varchar (50),
@StockMinimo int,
@StockActual int)
AS
BEGIN
  INSERT INTO Producto(IdTipo,Precio,UrlImagen,Nombre,Talle,Descripcion,Estado,Color,StockMinimo,StockActual) 
  VALUES(@IdTipo,@Precio,@UrlImagen,@Nombre,@Talle,@Descripcion,@Estado,@Color,@StockMinimo,@StockActual)
END

--Procedimiento Ventas. -----------------Procedimiento almacenado de Insert, con Transaccion.-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure SP_AgregarDetalle (
@idPedido bigint,
@idProducto bigint,
@CantidadPedida tinyint, 
@UrlImagen varchar (900),
@Nombre varchar (50),
@PrecioActual money)
as 
begin --arranca el Procedimiento.
begin try -- arranca el try.
	begin transaction -- arranca la transaccion.
	insert into Detalle (IdPedido, IdProducto, CantidadPedida, UrlImagen, Nombre, PrecioActual)
	values
	(@idPedido,@idProducto,@CantidadPedida,@UrlImagen,@Nombre,@PrecioActual)
	update Producto set StockActual = StockActual-@CantidadPedida  
	
	--El update Es el unico que no dispara excepciones si no modifica datos.
	where id= @idProducto
	
	IF @@ROWCOUNT  = 0
	--Entra en juego el rowcount, que chequea cuantas filas se modificaron, si es 0, levanta el error. :)
	
	BEGIN RAISERROR('No se pudo guardar el detalle',16,1)
	
	END
	
	Commit transaction
end try--termina el try

begin catch--arranca el catch
 
 rollback transaction
raiserror('No se pudo guardar el detalle', 16,1)

end catch--termina el catch

end --termina el P_A


--Cargar Usuarios en la bd--------Procedimiento almacenado de Insert, con Transaccion.---------------------------------------------------------------------------------
create procedure sp_InsertarUsuario(
--tabla usuarios--
@NombreUsuario varchar (100),
@Contraseña varchar (200),
@IdTipoUsuario tinyint,
@Estado bit,
--Tabla Datos Personales--
@IdUsuario Bigint,
@Nombre varchar(100),
@Apellido varchar(100),
@Dni varchar(20),
@FechaNac date,
@Genero varchar(20),
@Telefono varchar(20),
@CP int ,
@Direccion varchar(100),
@Ciudad varchar(100),
@Email varchar(100)
)as 
begin
begin try
begin transaction

insert into Usuarios (NombreUsuario,Contraseña,IdTipoUsuario,Estado) 
values (@NombreUsuario, @Contraseña ,@IdTipoUsuario ,@Estado)

set @idUsuario =  IDENT_CURRENT ('Usuarios')--trae el ultimo id de la tabla que le pidamos(diferente a @@identity que devuelve el utlimo valor unico .)

insert into DatosPersonales(IdUsuario, Nombre,Apellido, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad, Email) 
values (@IdUsuario, @Nombre, @Apellido ,@Dni,@FechaNac,@Genero,@Telefono, @CP, @Direccion, @Ciudad, @Email)
commit transaction
end try
begin catch 
rollback transaction
raiserror (':( No se pudo guardar el usuario',16,1)
end catch
end 



---------------------------------------------------Vista con subconsultas--------------------------------------------------------------------------------------------------
 
create view VW_ListaPromedioCompras
as 
select IdUsuario,U.NombreUsuario, nombre, apellido, 
(select COUNT(*) from Pedidos as p where dp.IdUsuario=p.IdUsuario )
as 'CantidadCompras',
(select isnull(AVG(P.importe),0) from Pedidos as p where dp.IdUsuario=p.IdUsuario) 
as 'PromedioCompras'
from DatosPersonales as dp join Usuarios u ON u.Id=dp.IdUsuario

---------------------------------------------------Vista simple--------------------------------------------------------------------------------------------------

create view VW_ListaProductos
as
Select p.Id as IdProducto, p.IdTipo, p.Precio, p.Nombre, p.Talle, p.Descripcion, p.Color, p.UrlImagen, 
p.Estado, p.StockMinimo, p.StockActual, tp.Id, tp.Nombre as TipoNombre  from Producto as p join TipoProducto
as tp on p.IdTipo = tp.Id

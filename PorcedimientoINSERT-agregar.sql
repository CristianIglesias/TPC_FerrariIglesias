alter PROCEDURE sp_InsertarRegistro(
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
  INSERT INTO Producto(IdTipo,Precio,UrlImagen,Nombre,Talle,Descripcion,Estado,Color,StockMinimo,StockActual) 
  VALUES(@IdTipo,@Precio,@UrlImagen,@Nombre,@Talle,@Descripcion,@Estado,@Color,@StockMinimo,@StockActual)
END






create procedure sp_InsertarUsuario(
--tabla usuarios--
@NombreUsuario varchar (100),
@Contraseña varchar (15),
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

insert into Usuarios (NombreUsuario,Contraseña,IdTipoUsuario,Estado) 
values (@NombreUsuario, @Contraseña ,@IdTipoUsuario ,@Estado)

set @idUsuario =  IDENT_CURRENT ('Usuarios')

insert into DatosPersonales(IdUsuario, Nombre,Apellido, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad, Email) 
values (@IdUsuario, @Nombre, @Apellido ,@Dni,@FechaNac,@Genero,@Telefono, @CP, @Direccion, @Ciudad, @Email)


end 

select * from Usuarios left join DatosPersonales on Usuarios.id = DatosPersonales.IdUsuario


select * from Pedidos
select * from Detalle

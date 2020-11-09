Create Database Remeras_Elle_fg
--Hola Angel, creo que hicimos todos los cambios correspondientes.
-- lo que falto es responderte que es TIPO DE PAGO y lo q pensamos es cual vaa ser la forma, por mercado pago, con debito, con credito...
-- lo que no sabemos y no tenemos idea aun es QUE HACE EL ADMINISTRADOR, lo pusimos y pensamos como un tipo de usuario, pero despues nos dimos cuenta que no sabemos
-- que va a hacer. estamos muy perdidos en cuent

--create database Remeras_Elle
go
use  Remeras_Elle_fg
go

create table TipoUsuario (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go
 

create table Usuarios (
Id bigint not null primary Key identity (1,1),
NombreUsuario varchar(100) not Null,
Contraseña varchar (15) not null,
IdTipoUsuario tinyint not null foreign key references TipoUsuario(Id)
)
go

create table Estados (
Id tinyint not null primary Key identity (1,1),
NombreEstado varchar(20) not Null
)
go

create table TipoPagos (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go


create table TipoProducto (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go

create table DatosPersonales (
IdUsuario bigint not null primary Key,
Nombre varchar(100) not Null,
Apellido varchar(100) not Null,
DNI int not null,
FechaNac date not null,
Genero varchar (20) null,
Telefono int not null,
CP int not null,
Direccion varchar not null,
Ciudad varchar not null
)
go
alter table DatosPersonales
add constraint FK_DatosPersonales_IdUsuario foreign key (IdUsuario)references Usuarios (Id)
go


create table Pedidos (
Id bigint not null primary Key identity (1,1),
IdUsuario bigint not null,
IdEstado tinyint not null,  
Fecha date not null
)
go

--ALTER TABLE Pedidos
--add Fecha date not null
--go

alter table Pedidos
add constraint FK_Pedidos_Estado foreign key (IdEstado)  references Estados (Id)
GO

alter table Pedidos
add constraint FK_Pedidos_Usuarios foreign key (IdUsuario) references  Usuarios (Id)
go

create table Producto (
Id bigint not null primary Key identity (1,1),
IdTipo tinyint not null foreign key references TipoProducto (Id),
Precio money not  null,
UrlImagen varchar (900),
Nombre varchar(50) not Null,
Talle Varchar(20) not null,
Descripcion varchar (100)
--agregar estado, para bajas logicas 
--alter table color producto 
)
go


--Agregar tabla colores x remera

--agregar tabla imagenes x remera



create table Factura (
Id bigint not null primary Key identity (1,1),
IdPedido bigint not null foreign key references Pedidos (Id),
PrecioActual money not  null,
CantidadPedida tinyint not null,
IdProducto bigint not null
)
go

alter table Factura
add constraint FK_Factura_IdProducto foreign key (IdProducto) references Producto (Id)
go




create table Stock (
IdProducto bigint not null primary Key,
StockActual smallint not  null,
StockMinimo smallint not Null
)
go

alter table Stock
add constraint FK_Stock_IdProducto foreign key (IdProducto) references Producto (Id)
go



create table Pagos (
IdPedido bigint not null primary Key,
IdTipoPago tinyint not null,
Monto money not  null
)
go

alter table Pagos
add constraint FK_Pagos_IdPedido foreign key (IdPedido) references Pedidos (Id)
go

alter table Pagos
add constraint FK_Pagos_TipoPagos foreign key (IdTipoPago)  references TipoPagos (Id)
go

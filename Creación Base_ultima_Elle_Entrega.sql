Create Database Remeras_Elle_ENTREGA

go
use  Remeras_Elle_ENTREGA
go

create table TipoUsuario (
Id tinyint not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go
create table Usuarios (
Id bigint not null primary Key identity (1,1),
NombreUsuario varchar(200) not Null,
Contraseña varchar (100) not null,
IdTipoUsuario tinyint not null foreign key references TipoUsuario(Id),
Estado bit not null
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

--"DNI like '%[0-9]%'" seria "que DNI contenga almenos un caracter numerico". 
--"DNI like '%[^0-9]%'" seria "que DNI contenga almenos un caracter no digito". 
--"not DNI like '%[^0-9]%'" seria "que DNI no contenga ningun caracter no numerico".
create table DatosPersonales (
IdUsuario bigint not null primary Key,
Nombre varchar(100) not Null,
Apellido varchar(100) not Null,
DNI varchar (10) not null  Check (not DNI like '%[^0-9]%'),
FechaNac date not null check(FechaNac<=getdate() and (Year(FechaNac)>1900)),
Genero varchar (20) null,
Telefono varchar(20) not null check (not Telefono like '%[^0-9]%'),
CP int not null check (not CP like '%[^0-9]%'),
Direccion varchar(100) not null,
Ciudad varchar(100) not null,
Email varchar (100) not null
)
go
alter table DatosPersonales
add constraint FK_DatosPersonales_IdUsuario foreign key (IdUsuario)references Usuarios (Id)
go
create table Pedidos (
Id bigint not null primary Key identity (1,1),
IdUsuario bigint not null,
IdEstado tinyint not null,  
Fecha date not null check(Fecha<=getdate()) default(getdate()),
Importe money not null check (Importe >0)
)
go
alter table Pedidos
add constraint FK_Pedidos_Estado foreign key (IdEstado)  references Estados (Id)
GO
alter table Pedidos
add constraint FK_Pedidos_Usuarios foreign key (IdUsuario) references  Usuarios (Id)
go
create table Producto (
Id bigint not null primary Key identity (1,1),
IdTipo tinyint not null foreign key references TipoProducto (Id),
Precio money not  null check (Precio >0),
UrlImagen varchar (900),
Nombre varchar(50) not Null,
Talle Varchar(20) not null,
Descripcion varchar (100) not null,
Estado bit not null default (1),
Color varchar (50),
StockMinimo int not null check (StockMinimo >0),
StockActual int not null
)
go
create table Detalle (
--Id bigint not null primary Key identity (1,1),
IdProducto bigint not null ,
IdPedido bigint not null foreign key references Pedidos (Id),
PrecioActual money not  null check (PrecioActual >0), 
CantidadPedida tinyint not null check (cantidadPedida >0),
UrlImagen varchar (900),
Nombre varchar(50) not Null,
primary key (IdProducto, IdPedido)
)
go
alter table Detalle
add constraint FK_Detalle_IdProducto foreign key (IdProducto) references Producto (Id)
go
create table Pagos (
IdPedido bigint not null primary Key,
IdTipoPago tinyint not null,
Monto money not  null check (Monto >0)
)
go
alter table Pagos
add constraint FK_Pagos_IdPedido foreign key (IdPedido) references Pedidos (Id)
go
alter table Pagos
add constraint FK_Pagos_TipoPagos foreign key (IdTipoPago)  references TipoPagos (Id)
go
alter table Usuarios 
add constraint NombreUsuario  unique (NombreUsuario)


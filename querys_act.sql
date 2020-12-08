use Remeras_Elle_CC


 insert into Estados(NombreEstado ) values ('Recibido' )
 insert into Estados(NombreEstado ) values ('En Preparacion' )
 insert into Estados(NombreEstado ) values ('En Camino' )
 


 insert into TipoUsuario (Nombre ) values ('Administrador' )
 insert into TipoUsuario (Nombre ) values ('Cliente' )
 select nombre from TipoUsuario
 
 
 
 insert into TipoPagos(Nombre ) values ('MercadoLibre' )
 

 select * from Estados
 
 insert into tipoProducto(Nombre ) values ('Escote V' )
 insert into tipoProducto(Nombre ) values ('Americana' )

 select * from TipoProducto

 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen, Estado, StockMinimo, StockActual  ) values('2','500','Remera 3', 'M', 'Remerita divertidita', 'Blanca','https://risataweb.com.ar/wp-content/uploads/2018/07/remera-gaa.jpg', 1,10, 100 )								
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen, Estado, StockMinimo, StockActual  ) values('1','600','REMERA 2', 'M', 'remera 2',             'Blanca','https://d26lpennugtm8s.cloudfront.net/stores/614/713/products/remera-negra1-cc730d45f908741d3e15874484548741-1024-1024.jpg', 1,10, 100  )


 Select p.Id, --0
 p.IdTipo,--1
 p.Precio, --2
 p.Nombre,--3
 p.Talle,--4
 p.Descripcion,--5
 p.Color,--6
 p.UrlImagen,--7
 Estado, --8
 StockMinimo,--9
 StockActual, --10
 tp.Id, --12
 tp.Nombre as TipoNombre  --13
 from Producto as p join TipoProducto as tp on p.IdTipo = tp.Id 

 select * from TipoProducto 
 Select * from Producto 
 select * FROM Producto AS P join TipoProducto as t on t.Id=p.IdTipo
 select id, idtipo, precio, nombre, talle, descripcion from Producto

 Update Producto (idTipo, Nombre, Descripcion,Color, UrlImagen ,Talle,  Precio ) values (@idTipo,@Nombre,@Descripcion,@Color,@Imagen,@Talle, @precio) where id = @id

  select u.Contraseña, u.Id, u.IdTipoUsuario, u.NombreUsuario, dp.Nombre, dp.Apellido, dp.DNI from Usuarios as u join DatosPersonales as dp on u.Id = dp.IdUsuario

  --producto tiene que tener estado
  --usuario tiene que tener estado
 -- opciones administador con anchor

 --TRAER LOS REGISTROS --Deberíamos armar una vista para esto... o incluso un procedimiento almacenado--
Select p.id, Tipos.id, Tipos.Nombre as NombreTipo, p.Precio, p.Nombre, p.Talle, p.Descripcion from Producto as P
join TipoProducto as Tipos on P.IdTipo = tipos.Id

 insert into Usuarios ( 
 NombreUsuario, Contraseña, IdTipoUsuario, Estado
 ) values('SoyAdmin','SoyAdmin',1, )


 select Id, NombreUsuario, Contraseña, IdTipoUsuario from Usuarios

 select IdUsuario, Nombre, Apellido, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad from DatosPersonales

 select * from Usuarios
 select * from DatosPersonales

  set dateformat dmy

  insert into DatosPersonales (  IdUsuario
 , Nombre
 , Apellido,
   Email ,
   DNI,
   FechaNac,
   Genero, 
   Telefono, 
   CP, 
   Direccion,
   Ciudad
   ) 
values (
14,
'Silvano',
'Lopez',
'ESTEMAIL@MAIL.VERGA',
'11539557',
'20-02-1970',
'f',
'1155998384',
'1617',
'Austria Sur 196',
'Troncos del talar')


--query usada en la app ~
insert into DatosPersonales (Nombre, Apellido, Email, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad) VALUES (@Nombre,@Apellido, @Email, @DNI, @FechaNac,@Genero,@Telefono,@CP,@Direccion,@Ciudad)
--query usada en la app ~
insert into Usuarios (NombreUsuario, Contraseña, IdTipoUsuario,Estado) values (@NombreUsuario,@Contraseña,@IdTipoUsuario,@Estado)

select * from Usuarios left join DatosPersonales on Usuarios.id = DatosPersonales.IdUsuario

select * from DatosPersonales

 --Meter registros nuevos -- Debería ser un procedimiento almacenado que use parametros -- 
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen  ) values('1','600','REMERA 2', 'M', 'remera 2',             'Blanca','https://d26lpennugtm8s.cloudfront.net/stores/614/713/products/remera-negra1-cc730d45f908741d3e15874484548741-1024-1024.jpg' )



 --Actualizar registros -- también debería ser un procedimiento almacenado -- 
  Update Producto (idTipo, Nombre, Descripcion,Color, UrlImagen ,Talle,  Precio ) values (@idTipo,@Nombre,@Descripcion,@Color,@Imagen,@Talle, @precio) where id = @id


 select * from DatosPersonales
 select * from usuarios left join DatosPersonales on id= IdUsuario

  select u.Contraseña, u.Id, u.IdTipoUsuario, u.NombreUsuario, dp.Nombre, dp.Apellido, dp.DNI from Usuarios as u join DatosPersonales as dp on u.Id = dp.IdUsuario


  
  select u.Id, u.NombreUsuario, u.Contraseña, u.IdTipoUsuario,u.Estado, dp.Nombre,dp.Apellido,dp.DNI,dp.fechaNac,dp.genero,dp.telefono,dp.cp,dp.direccion,dp.ciudad,dp.email from Usuarios as u join DatosPersonales as dp on u.Id = dp.IdUsuario

  Update  Usuarios set NombreUsuario=@NombreUsuario, Contraseña=@Contraseña, IdTipoUsuario=@IdTipoUsuario, Estado=@Estado where id = @idUsuario
  
  
  update  DatosPersonales set Nombre=@Nombre, Apellido=@Apellido, Email=@Email, DNI=@DNI, FechaNac=@FechaNac, Genero=@Genero, Telefono=@Telefono, CP=@CP, Direccion=@Direccion, Ciudad=@Ciudad where idUsuario =  @id
  
  select * from Pedidos

  update Pedidos set @idEstado = Estado where id = @idPedido

  select * from Estados



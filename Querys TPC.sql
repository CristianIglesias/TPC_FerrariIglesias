use  Remeras_Elle_CC

 insert into TipoUsuario (Nombre ) values ('Administrador' )
 insert into TipoUsuario (Nombre ) values ('Cliente' )
 select nombre from TipoUsuario
 
 UPDATE TipoUsuario
 SET Nombre = 'Cliente'
 WHERE id = 2
 
 delete from TipoUsuario 
 where id = 3
 
 insert into TipoPagos(Nombre ) values ('MercadoLibre' )
 
 insert into Estados(NombreEstado ) values ('En proceso' )
 insert into tipoProducto(Nombre ) values ('Escote V' )
 select * from TipoProducto
 delete from TipoProducto where id=2
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen  ) values('2','500','Remera 3', 'M', 'Remerita divertidita', 'Blanca','https://risataweb.com.ar/wp-content/uploads/2018/07/remera-gaa.jpg' )								
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen  ) values('1','600','REMERA 2', 'M', 'remera 2',             'Blanca','https://d26lpennugtm8s.cloudfront.net/stores/614/713/products/remera-negra1-cc730d45f908741d3e15874484548741-1024-1024.jpg' )

 

  select * from TipoProducto
 select * from Producto

 --deberíamos hacer una tabla "imagenes por producto, simple, que guarde los varchares de la url y los id producto, ponele que tenga un id propio--
 
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


select * from TipoUsuario
 insert into TipoUsuario (Nombre) values ('Administrador')
  insert into TipoUsuario (Nombre) values ('Cliente')


 insert into Usuarios ( 
 NombreUsuario, Contraseña, IdTipoUsuario
 ) values('SoyAdmin','SoyAdmin',1 )


 select Id, NombreUsuario, Contraseña, IdTipoUsuario from Usuarios

 select IdUsuario, Nombre, Apellido, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad from DatosPersonales

 select * from Usuarios
 select * from DatosPersonales

 set dateformat dmy
 
  insert into DatosPersonales (  IdUsuario, Nombre, Apellido, DNI, FechaNac, Genero, Telefono, CP, Direccion, Ciudad  ) 
  values (1, 'Chivi', 'Ferrari', 29753593, '20/05/1983', 'F', 1531790514,1676, 'L','S')
 
 
 
 
 
 --Meter registros nuevos -- Debería ser un procedimiento almacenado que use parametros -- 
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen  ) values('1','600','REMERA 2', 'M', 'remera 2',             'Blanca','https://d26lpennugtm8s.cloudfront.net/stores/614/713/products/remera-negra1-cc730d45f908741d3e15874484548741-1024-1024.jpg' )



 --Actualizar registros -- también debería ser un procedimiento almacenado -- 
  Update Producto (idTipo, Nombre, Descripcion,Color, UrlImagen ,Talle,  Precio ) values (@idTipo,@Nombre,@Descripcion,@Color,@Imagen,@Talle, @precio) where id = @id

  create procedure  BajaLogica (

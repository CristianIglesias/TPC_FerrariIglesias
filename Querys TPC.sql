use Remeras_Elle_fg

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
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen  ) values('1','500','Remera 3', 'M', 'Remerita divertidita', 'Blanca','https://risataweb.com.ar/wp-content/uploads/2018/07/remera-gaa.jpg' )								
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen  ) values('1','600','REMERA 2', 'M', 'remera 2',             'Blanca','https://d26lpennugtm8s.cloudfront.net/stores/614/713/products/remera-negra1-cc730d45f908741d3e15874484548741-1024-1024.jpg' )
 
 --deberíamos hacer una tabla "imagenes por producto, simple, que guarde los varchares de la url y los id producto, ponele que tenga un id propio--
 
 Select * from Producto 
 select * FROM Producto AS P join TipoProducto as t on t.Id=p.IdTipo
 select id, idtipo, precio, nombre, talle, descripcion from Producto

 Update Producto (idTipo, Nombre, Descripcion,Color, UrlImagen ,Talle,  Precio ) values (@idTipo,@Nombre,@Descripcion,@Color,@Imagen,@Talle, @precio) where id = @id

 
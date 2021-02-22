 set dateformat dmy

 insert into Estados(NombreEstado ) values ('Recibido' )
 insert into Estados(NombreEstado ) values ('En Preparacion' )
 insert into Estados(NombreEstado ) values ('En Camino' )
 

 insert into TipoUsuario (Nombre ) values ('Administrador' )
 insert into TipoUsuario (Nombre ) values ('Cliente' )

 insert into TipoPagos(Nombre ) values ('MercadoLibre' )
 
 insert into tipoProducto(Nombre ) values ('Escote V' )
 insert into tipoProducto(Nombre ) values ('Americana' )

 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen, Estado, StockMinimo, StockActual) values('2','500','Remera 3', 'M', 'Remerita divertidita', 'Blanca','https://risataweb.com.ar/wp-content/uploads/2018/07/remera-gaa.jpg', 1,50,100 )								
 insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion, Color, UrlImagen, Estado, StockMinimo, StockActual) values('1','600','REMERA 2', 'M', 'remera 2','Blanca','https://d26lpennugtm8s.cloudfront.net/stores/614/713/products/remera-negra1-cc730d45f908741d3e15874484548741-1024-1024.jpg', 1,20,50)

 insert into Usuarios (NombreUsuario, Contraseña, IdTipoUsuario, Estado) values('SoyAdmin','a067d37f9775e5196971e10bf73f7058bbc66e93b59d0085fa1b0f36eb490f2c',1, 1 )---Contraseñas Hasheadas
 insert into Usuarios (NombreUsuario, Contraseña, IdTipoUsuario, Estado) values('Cliente1','8e6befd75cc20ebed67e63d263aab6a6c62c9c706ad2d8c0a62484ae6c7ced38',2, 1 )---Contraseñas Hasheadas
 
 insert into DatosPersonales (  IdUsuario, Nombre, Apellido, Email, DNI, FechaNac, Genero, Telefono,CP, Direccion, Ciudad) 
 values (1,'Silvano','Lopez','ESTEMAIL@MAIL.Com','21539557','20-02-1970','masculino','1155998384','1617','Austria Sur 196','Troncos del talar')
 insert into DatosPersonales (  IdUsuario, Nombre, Apellido, Email, DNI, FechaNac, Genero, Telefono,CP, Direccion, Ciudad) 
 values (2,'Cristina','Gonzales','MailUser2@MAIL.Com','41578679','21-03-1984','femenino','1158858814','1617','Austria Sur 196','Troncos del talar')
 
 

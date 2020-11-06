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

insert into Producto (idTipo, Precio, Nombre, Talle, Descripcion) values('1','500','REMERA PIOLA BO', 'M', 'Remerita divertidita')

Select * from Producto
select * FROM Producto AS P join TipoProducto as t on t.Id=p.IdTipo

select id, idtipo, precio, nombre, talle, descripcion from Producto
Insert into Pedidos (IdUsuario,Importe,Fecha,IdEstado)
values (@idUsuario,@ImporteTotal,@Fecha,@Estado)

Create procedure SP_AgregarDetalle (
@idPedido bigint,
@idProducto bigint,
@CantidadPedida tinyint, 
@UrlImagen varchar (900),
@Nombre varchar (50),
@PrecioActual money 
)
as 
begin --arranca la wea

begin try -- arranca el try
	begin transaction 
	insert into Detalle (IdPedido, IdProducto, CantidadPedida, UrlImagen, Nombre, PrecioActual)
	values
	(@idPedido,@idProducto,@CantidadPedida,@UrlImagen,@Nombre,@PrecioActual)
	update Producto set StockActual = StockActual-@CantidadPedida  
	where id= @idProducto
	IF @@ROWCOUNT  = 0
	BEGIN RAISERROR('No se pudo guardar el detalle',16,1)
	
	END
	
	Commit transaction
end try--termina el try

begin catch--arranca el catch

raiserror('No se pudo guardar el detalle', 16,1)

end catch--termina el catch

end --termina el P_A


exec SP_AgregarDetalle 1,1,3,'dasasd','adasdsad',50


insert into pedidos (IdEstado, IdUsuario,Importe, Fecha) values (1, 1,10, '12-12-2020')
select * from Pedidos
select * from Detalle



select max(id) from Pedidos 




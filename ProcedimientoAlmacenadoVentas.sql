create procedure SP_AgregarVenta (
@Id bigint, --esto me parece	ue esta mal, poner el id aca, lo hago para poder relacionarlo con la tabla detalle
 --esto tampoco esta bien
@IdUsuario bigint,
@IdEstado tinyint,
@Fecha date,
@Importe money
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		DECLARE @PActual MONEY 
		DECLARE @CantPedida tinyint
		DECLARE @IdProducto bigint
		Select  @PActual = PrecioActual from Detalle where IdPedido = @Id -- esto esta mal por el tema q..
		Select   @CantPedida = CantidadPedida from Detalle where IdPedido = @Id -- esto esta mal por el tema q..
		--ACA SEGURO VAN MAS COSAS

		INSERT INTO Pedidos (IdUsuario, IdEstado, Fecha, Importe ) 
		VALUES (@IdUsuario ,@IdEstado, GETDATE(), @PActual* @CantPedida)
		---ACA ME ESTOY LLENDO A CUALQUIER LADO, A LA TABLA PRODUCTO.
		--HAY QUE VER COMO LLEGAR

		UPDATE  Producto SET StockActual = StockActual - @CantPedida WHERE  IdPedido = @Id 
		COMMIT TRANSACTION 

END TRY
BEGIN CATCH
		ROLLBACK TRANSACTION 
		RAISERROR ('no se pudo agregar la venta',16,1)
END CATCH

END


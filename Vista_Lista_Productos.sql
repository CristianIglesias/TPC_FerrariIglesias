 create view VW_ListaProductos
 as
 Select p.Id as IdProducto, p.IdTipo, p.Precio, p.Nombre, p.Talle, p.Descripcion, p.Color, p.UrlImagen, 
 p.Estado, p.StockMinimo, p.StockActual, tp.Id, tp.Nombre as TipoNombre  from Producto as p join TipoProducto as tp on p.IdTipo = tp.Id
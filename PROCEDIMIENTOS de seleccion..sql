create procedure SP_Login (
@Contrase�a varchar (200)  ,
@NombreUsuario varchar (200) --HAY QUE CAMBIARLO A 15
)
as 
begin
begin try

	declare @Estado bit --Declaro la variable

select Estado  =  @Estado
from Usuarios where NombreUsuario = @NombreUsuario 
and Contrase�a =@Contrase�a
--le asigno lo que tiene el estado de ese usuario
if @Estado = 1  -- si esta en true entonces selecciono los datos
begin 

select Id, Contrase�a, NombreUsuario, IdTipoUsuario , ESTADO  
from Usuarios where NombreUsuario = @NombreUsuario 
and Contrase�a =@Contrase�a 

end

else 
begin
raiserror ('Tu  nombre de usuario ya no existe',16,1)
end

end try

begin catch	
raiserror ('No se pudo loguear...',16,1)
end catch

end


create procedure SP_Login (
@NombreUsuario varchar (200),
@Contrase�a varchar (200)  
)
as 
begin
begin try

select Id, Contrase�a, NombreUsuario, IdTipoUsuario, Estado
from Usuarios where NombreUsuario = @NombreUsuario 
and Contrase�a =@Contrase�a 
 
end try
begin catch
	
raiserror ('No se pudo...',16,1)
end catch

end


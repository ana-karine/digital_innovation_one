#### Tabela *usuarios*
<usuários src="/images/usuarios.png">

#### Tabela *destinos*
<destinos src="/images/destinos.png">

#### Tabela *reservas*
<reservas src="/images/reservas.png">


### INNER JOIN
```
SELECT * FROM usuarios us 
INNER JOIN reservas rs
ON us.id = rs.id_usuario;
``` 

<usuarios_e_reservas src="/images/inner_join.png">

```
SELECT * FROM usuarios us 
INNER JOIN reservas rs ON us.id = rs.id_usuario
INNER JOIN destinos ds ON rs.id_destino = ds.id;
```

<usuarios_e_reservas_e_destinos src="/images/inner_join2.png">


### LEFT JOIN
``` 
SELECT * FROM usuarios us 
LEFT JOIN reservas rs
ON us.id = rs.id_usuario;
``` 

<usuarios_e_reservas src="/images/left_join.png">


### RIGHT JOIN
``` 
SELECT * FROM reservas rs 
RIGHT JOIN destinos ds
ON rs.id_destino = ds.id;
``` 

<reservas_e_destinos src="/images/right_join.png">
















``` 

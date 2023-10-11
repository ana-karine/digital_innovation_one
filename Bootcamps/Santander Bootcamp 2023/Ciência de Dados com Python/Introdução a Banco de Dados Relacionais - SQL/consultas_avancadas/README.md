#### Tabela *usuarios*
<img src="images/usuarios.png">

#### Tabela *destinos*
<img src="images/destinos.png">

#### Tabela *reservas*
<img src="images/reservas.png">


### INNER JOIN
```
SELECT * FROM usuarios us 
INNER JOIN reservas rs
ON us.id = rs.id_usuario;
``` 

<img src="images/inner_join.png">

```
SELECT * FROM usuarios us 
INNER JOIN reservas rs ON us.id = rs.id_usuario
INNER JOIN destinos ds ON rs.id_destino = ds.id;
```

<img src="images/inner_join2.png">


### LEFT JOIN
``` 
SELECT * FROM usuarios us 
LEFT JOIN reservas rs
ON us.id = rs.id_usuario;
``` 

<img src="images/left_join.png">


### RIGHT JOIN
``` 
SELECT * FROM reservas rs 
RIGHT JOIN destinos ds
ON rs.id_destino = ds.id;
``` 

<img src="images/right_join.png">
















``` 

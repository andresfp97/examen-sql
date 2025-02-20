insert into cliente (id,nombre, celular, direccion) values 
(101, 'andres', '3144534667', 'Av siempreviva'),
(102, 'felipe', '3144535698', 'av cocoloco');

insert into producto (id, nombre, tipo, tamanio, idIngrediente, precio) values
(301, "soda", "bebida", "grande", 400, 50);

--  **Añadir productos a un pedido específico:**
insert into pedido (id,fecha, hora, idCliente, idProducto, precio) values
 (2,"2024-02-19", "09:00", 102, 202, 150);

--  **Añadir ingredientes adicionales a una pizza en un pedido:**
insert into pedido (id,fecha, hora, idCliente, idProducto, idIngrediente ,precio) values
 (3,"2024-02-19", "10:00", 101, 202, 402, 190);

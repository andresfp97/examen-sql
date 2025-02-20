--- inserciones de datos y consultas;

--  **Registrar un nuevo cliente:**

insert into cliente (id,nombre, celular, direccion) values 
(101, 'andres', '3144534667', 'Av siempreviva'),
(102, 'felipe', '3144535698', 'av cocoloco');


--  **Agregar un nuevo producto (pizza) al menú:**
describe producto ;
insert into producto (id, nombre, tipo, tamanio, idIngrediente, precio) values
(202, "pizza peperoni", "pizza", "grande",401, 150)


--  **Registrar una bebida en el menú:**
insert into producto (id, nombre, tipo, tamanio, idIngrediente, precio) values
(301, "soda", "bebida", "grande", 400, 50)


--  **Agregar un ingrediente a la base de datos:**
describe ingrediente ;
insert into  ingrediente (id,nombre,precio) values
(400, "ninguno", 0);
(401, "porcion pollo", 30),
(402,"porcion carne", 40);


--  **Crear un pedido para un cliente:**
describe pedido ;
 insert into pedido (id, fecha, hora, idCliente, idProducto, precio) values
 (1,"2024-02-19", "07:00", 101, 202, 150);

--  **Añadir productos a un pedido específico:**
insert into pedido (id,fecha, hora, idCliente, idProducto, precio) values
 (2,"2024-02-19", "09:00", 102, 202, 150);

--  **Añadir ingredientes adicionales a una pizza en un pedido:**
insert into pedido (id,fecha, hora, idCliente, idProducto, idIngrediente ,precio) values
 (3,"2024-02-19", "10:00", 101, 202, 402, 190);


--  **Consultar el detalle de un pedido (productos y sus ingredientes)

select p.id as "id Pedido", p2.nombre as "nombre Cliente", p2.idIngrediente as "Ingredientes",
i.nombre as "Adicionales" 
from pedido p 
join producto p2  on p.idProducto  = p2.id 
join ingrediente i  on p.idIngrediente  = i.id 
where p.id = 3 ;


--  **Consultar todos los pedidos de un cliente:**

select  c.nombre as "Nombre Cliente",  p.id as "idPedido",  p.fecha, p.precio
from pedido p  join cliente c  on p.idCliente  = c.id
where c.id  = 101;


--  **Listar todos los productos disponibles en el menú (pizzas y bebidas):**

select *
from producto p
where p.tipo  in ('pizza','bebida');

-- **Listar todos los ingredientes disponibles para personalizar una pizza:**

select *
from ingrediente i 
where i.nombre  not in("ninguno")


--  **Calcular el costo total de un pedido (incluyendo ingredientes adicionales):**


select p.id as "id Pedido", p2.nombre as "nombre Cliente", i.nombre as "Adicionales", (p2.precio + i.precio) as "Precio Total"
from pedido p 
join producto p2  on p.idProducto  = p2.id 
join ingrediente i  on p.idIngrediente  = i.id 
where p.id = 3 ;


--  **Listar los clientes y cuntos pedidos han hecho:**

select  COUNT(c.id) as "Pedidos por cliente", c.nombre 
from cliente c  join pedido p on c.id = p.idCliente  
group by  c.id;

--  **Buscar pedidos programados para recogerse después de una hora específica:**

select * 
from  pedido p
where   CAST(p.hora AS UNSIGNED) > 7


-- Buscar pizzas con un precio mayor a $100:**
select *
from producto p
where p.tipo  in ('pizza')  AND  p.precio > 100;

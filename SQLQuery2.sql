create database Pacifico 
use Pacifico

CREATE TABLE [CLIENTE] (
  [idcliente] int,
  [nombre] varchar(100),
  [cedula] varchar(13),
  [direccion] varchar(100),
  PRIMARY KEY ([idcliente])
);
go
CREATE TABLE [CAMARONERA] (
  [idcamaronera] int,
  [nombre] varchar(100),
  [ruc] varchar(13),
  PRIMARY KEY ([idcamaronera])
);
go
CREATE TABLE [ROL] (
  [idrol] int,
  [nombre] varchar(100),
  PRIMARY KEY ([idrol])
);
go
CREATE TABLE [EMPLEADO] (
  [idempleado] int,
  [idrol] int,
  [nombre] varchar(100),
  [cedula] varchar(13),
  PRIMARY KEY ([idempleado]),
  CONSTRAINT [FK_EMPLEADO.idrol]
    FOREIGN KEY ([idrol])
      REFERENCES [ROL]([idrol])
);
go
CREATE TABLE [ESTANQUE] (
  [idestanque] int,
  [idempleado] int,
  [ubicacion] varchar(100),
  [capacidad] decimal,
  [fecha_limpieza] date,
  [rep_mejoras] varchar(300),
  [vida_util] datetime,
  [prod_quimi_utilizado] varchar(200),
  PRIMARY KEY ([idestanque]),
  CONSTRAINT [FK_ESTANQUE.idempleado]
    FOREIGN KEY ([idempleado])
      REFERENCES [EMPLEADO]([idempleado])
);
go
CREATE TABLE [PRODUCCION] (
  [idproduccion] int,
  [idestanque] int,
  [fecha_cosecha] date,
  [cant_pro] int,
  PRIMARY KEY ([idproduccion]),
  CONSTRAINT [FK_PRODUCCION.idestanque]
    FOREIGN KEY ([idestanque])
      REFERENCES [ESTANQUE]([idestanque])
);
go
CREATE TABLE [PRODUCTO] (
  [idproducto] int,
  [nombre] varchar(50),
  [fecha_venci] date,
  [idproduccrion] int,
  PRIMARY KEY ([idproducto]),
  CONSTRAINT [FK_PRODUCTO.idproduccrion]
    FOREIGN KEY ([idproduccrion])
      REFERENCES [PRODUCCION]([idproduccion])
);
go
CREATE TABLE [VENTA] (
  [idventa] int,
  [idcamaronera] int,
  [idcliente] int,
  [fecha_vend] date,
  [cant_vend] int,
  [info_pago] varchar(50),
  [precio] money,
  [idproducto] int,
  PRIMARY KEY ([idventa]),
  CONSTRAINT [FK_VENTA.idcamaronera]
    FOREIGN KEY ([idcamaronera])
      REFERENCES [CAMARONERA]([idcamaronera]),
  CONSTRAINT [FK_VENTA.idcliente]
    FOREIGN KEY ([idcliente])
      REFERENCES [CLIENTE]([idcliente]),
  CONSTRAINT [FK_VENTA.idproducto]
    FOREIGN KEY ([idproducto])
      REFERENCES [PRODUCTO]([idproducto])
);
go
CREATE TABLE [TIPO_SUMINISTRO] (
  [idtiposumi] int,
  [nombre] varchar(100),
  PRIMARY KEY ([idtiposumi])
);
go
CREATE TABLE [PROVEEDOR] (
  [idproveedor] int,
  [idtiposumi] int,
  [nombre] varchar(100),
  [correo] varchar(50),
  [prod_suministrado] varchar(100),
  PRIMARY KEY ([idproveedor]),
  CONSTRAINT [FK_PROVEEDOR.idtiposumi]
    FOREIGN KEY ([idtiposumi])
      REFERENCES [TIPO_SUMINISTRO]([idtiposumi])
);
go
CREATE TABLE [PEDIDO] (
  [idpedido] int,
  [idproveedor] int,
  [idcamaronera] int,
  [fecha_entrega] date,
  [costo] money,
  [cant_suministros] int,
  [fecha_recep] date,
  PRIMARY KEY ([idpedido]),
  CONSTRAINT [FK_PEDIDO.idcamaronera]
    FOREIGN KEY ([idcamaronera])
      REFERENCES [CAMARONERA]([idcamaronera]),
  CONSTRAINT [FK_PEDIDO.idproveedor]
    FOREIGN KEY ([idproveedor])
      REFERENCES [PROVEEDOR]([idproveedor])
);

-- Insertar registros en la tabla CLIENTE
INSERT INTO [CLIENTE] ([idcliente], [nombre], [cedula], [direccion]) VALUES
(1, 'Juan Perez', '0102030405', 'Av. Principal 123'),
(2, 'Maria Lopez', '0203040506', 'Calle Secundaria 456'),
(3, 'Carlos Ruiz', '0304050607', 'Av. Tercera 789'),
(4, 'Ana Sanchez', '0405060708', 'Calle Cuarta 1011'),
(5, 'Luis Ramirez', '0506070809', 'Av. Quinta 1213'),
(6, 'Pedro Torres', '0607080910', 'Calle Sexta 1415'),
(7, 'Lucia Gomez', '0708091011', 'Av. Séptima 1617'),
(8, 'Jorge Martinez', '0809101112', 'Calle Octava 1819'),
(9, 'Marta Ortiz', '0910111213', 'Av. Novena 2021'),
(10, 'Alberto Fernandez', '1011121314', 'Calle Décima 2223');

-- Insertar registros en la tabla CAMARONERA
INSERT INTO [CAMARONERA] ([idcamaronera], [nombre], [ruc]) VALUES
(1, 'Mariscos del Pacífico', '1790011122');

-- Insertar registros en la tabla ROL
INSERT INTO [ROL] ([idrol], [nombre]) VALUES
(1, 'Trabajador de Campo'),
(2, 'Personal de Mantenimiento'),
(3, 'Administrador'),
(4, 'Vendedor'),
(5, 'Supervisor'),
(6, 'Analista de Calidad'),
(7, 'Técnico en Acuicultura'),
(8, 'Gerente de Producción'),
(9, 'Operador de Maquinaria'),
(10, 'Encargado de Almacén');

-- Insertar registros en la tabla EMPLEADO
INSERT INTO [EMPLEADO] ([idempleado], [idrol], [nombre], [cedula]) VALUES
(1, 1, 'Carlos Diaz', '0102030406'),
(2, 2, 'Mariana Suarez', '0203040507'),
(3, 3, 'Jose Martinez', '0304050608'),
(4, 4, 'Paula Rivera', '0405060709'),
(5, 5, 'Ricardo Gonzalez', '0506070810'),
(6, 6, 'Clara Hernandez', '0607080911'),
(7, 7, 'Victor Perez', '0708091012'),
(8, 8, 'Gabriela Torres', '0809101113'),
(9, 9, 'Hugo Ramirez', '0910111214'),
(10, 10, 'Ines Morales', '1011121315');

-- Insertar registros en la tabla ESTANQUE
INSERT INTO [ESTANQUE] ([idestanque], [idempleado], [ubicacion], [capacidad], [fecha_limpieza], [rep_mejoras], [vida_util], [prod_quimi_utilizado]) VALUES
(1, 1, 'Zona A', 1000, '2024-01-01', 'Reparación de mallas', '2026-01-01', 'Cloro'),
(2, 2, 'Zona B', 1500, '2024-02-01', 'Cambio de agua', '2026-02-01', 'Peróxido de hidrógeno'),
(3, 3, 'Zona C', 1200, '2024-03-01', 'Limpieza de fondos', '2026-03-01', 'Hipoclorito de sodio'),
(4, 4, 'Zona D', 1100, '2024-04-01', 'Reparación de filtros', '2026-04-01', 'Ácido peracético'),
(5, 5, 'Zona E', 1400, '2024-05-01', 'Cambio de sustrato', '2026-05-01', 'Oxígeno disuelto'),
(6, 6, 'Zona F', 1300, '2024-06-01', 'Desinfección general', '2026-06-01', 'Cloro'),
(7, 7, 'Zona G', 1600, '2024-07-01', 'Reparación de tuberías', '2026-07-01', 'Peróxido de hidrógeno'),
(8, 8, 'Zona H', 1700, '2024-08-01', 'Limpieza de válvulas', '2026-08-01', 'Hipoclorito de sodio'),
(9, 9, 'Zona I', 1800, '2024-09-01', 'Cambio de sistemas de aireación', '2026-09-01', 'Ácido peracético'),
(10, 10, 'Zona J', 1900, '2024-10-01', 'Reparación de bombas', '2026-10-01', 'Oxígeno disuelto');

-- Insertar registros en la tabla PRODUCCION
INSERT INTO [PRODUCCION] ([idproduccion], [idestanque], [fecha_cosecha], [cant_pro]) VALUES
(1, 1, '2024-01-15', 1000),
(2, 2, '2024-02-15', 1500),
(3, 3, '2024-03-15', 1200),
(4, 4, '2024-04-15', 1100),
(5, 5, '2024-05-15', 1400),
(6, 6, '2024-06-15', 1300),
(7, 7, '2024-07-15', 1600),
(8, 8, '2024-08-15', 1700),
(9, 9, '2024-09-15', 1800),
(10, 10, '2024-10-15', 1900);

-- Insertar registros en la tabla PRODUCTO
INSERT INTO [PRODUCTO] ([idproducto], [nombre], [fecha_venci], [idproduccrion]) VALUES
(1, 'Camarón Grande', '2025-01-01', 1),
(2, 'Camarón Mediano', '2025-02-01', 2),
(3, 'Camarón Pequeño', '2025-03-01', 3),
(4, 'Camarón Jumbo', '2025-04-01', 4),
(5, 'Camarón Colosal', '2025-05-01', 5),
(6, 'Camarón Tiger', '2025-06-01', 6),
(7, 'Camarón Blanco', '2025-07-01', 7),
(8, 'Camarón Rosa', '2025-08-01', 8),
(9, 'Camarón Marrón', '2025-09-01', 9),
(10, 'Camarón Azul', '2025-10-01', 10);

-- Insertar registros en la tabla VENTA
INSERT INTO [VENTA] ([idventa], [idcamaronera], [idcliente], [fecha_vend], [cant_vend], [info_pago], [precio], [idproducto]) VALUES
(1, 1, 1, '2024-01-20', 500, 'Pago Completo', 5000, 1),
(2, 1, 2, '2024-02-20', 750, 'Pago Completo', 7500, 2),
(3, 1, 3, '2024-03-20', 600, 'Pago Completo', 6000, 3),
(4, 1, 4, '2024-04-20', 550, 'Pago Completo', 5500, 4),
(5, 1, 5, '2024-05-20', 700, 'Pago Completo', 7000, 5),
(6, 1, 6, '2024-06-20', 650, 'Pago Completo', 6500, 6),
(7, 1, 7, '2024-07-20', 800, 'Pago Completo', 8000, 7),
(8, 1, 8, '2024-08-20', 850, 'Pago Completo', 8500, 8),
(9, 1, 9, '2024-09-20', 900, 'Pago Completo', 9000, 9),
(10, 1, 10, '2024-10-20', 950, 'Pago Completo', 9500, 10);

-- Insertar registros en la tabla TIPO_SUMINISTRO
INSERT INTO [TIPO_SUMINISTRO] ([idtiposumi], [nombre]) VALUES
(1, 'Alimentos'),
(2, 'Equipos de Mantenimiento'),
(3, 'Productos Químicos'),
(4, 'Material de Limpieza'),
(5, 'Herramientas'),
(6, 'Ropa de Trabajo'),
(7, 'Tecnología'),
(8, 'Transporte'),
(9, 'Servicios'),
(10, 'Otros');

-- Insertar registros en la tabla PROVEEDOR
INSERT INTO [PROVEEDOR] ([idproveedor], [idtiposumi], [nombre], [correo], [prod_suministrado]) VALUES
(1, 1, 'Proveedor Alimentos SA', 'contacto@proveedoralimentos.com', 'Alimento Balanceado'),
(2, 2, 'Proveedor Equipos SA', 'contacto@proveedorequipos.com', 'Bombas de Agua'),
(3, 3, 'Proveedor Químicos SA', 'contacto@proveedorquimicos.com', 'Cloro'),
(4, 4, 'Proveedor Limpieza SA', 'contacto@proveedorlimpieza.com', 'Cepillos'),
(5, 5, 'Proveedor Herramientas SA', 'contacto@proveedorherramientas.com', 'Llaves Inglesas'),
(6, 6, 'Proveedor Ropa SA', 'contacto@proveedorropa.com', 'Uniformes'),
(7, 7, 'Proveedor Tecnología SA', 'contacto@proveedortecnologia.com', 'Sistemas de Control'),
(8, 8, 'Proveedor Transporte SA', 'contacto@proveedortransporte.com', 'Camiones'),
(9, 9, 'Proveedor Servicios SA', 'contacto@proveedorservicios.com', 'Mantenimiento Externo'),
(10, 10, 'Proveedor Otros SA', 'contacto@proveedorotros.com', 'Varios');

-- Insertar registros en la tabla PEDIDO
INSERT INTO [PEDIDO] ([idpedido], [idproveedor], [idcamaronera], [fecha_entrega], [costo], [cant_suministros], [fecha_recep]) VALUES
(1, 1, 1, '2024-01-10', 2000, 500, '2024-01-11'),
(2, 2, 1, '2024-02-10', 3000, 750, '2024-02-11'),
(3, 3, 1, '2024-03-10', 2500, 600, '2024-03-11'),
(4, 4, 1, '2024-04-10', 2200, 550, '2024-04-11'),
(5, 5, 1, '2024-05-10', 2800, 700, '2024-05-11'),
(6, 6, 1, '2024-06-10', 2600, 650, '2024-06-11'),
(7, 7, 1, '2024-07-10', 3200, 800, '2024-07-11'),
(8, 8, 1, '2024-08-10', 3400, 850, '2024-08-11'),
(9, 9, 1, '2024-09-10', 3600, 900, '2024-09-11'),
(10, 10, 1, '2024-10-10', 3800, 950, '2024-10-11');



--Obtener toda la producción de un estanque específico:
SELECT * FROM [PRODUCCION]
WHERE [idestanque] = 1; 
--Obtener el historial de producción con detalles del estanque:
SELECT p.*, e.ubicacion, e.capacidad 
FROM [PRODUCCION] p
JOIN [ESTANQUE] e ON p.idestanque = e.idestanque;
--Obtener la producción total por cada estanque:
SELECT e.idestanque, e.ubicacion, SUM(p.cant_pro) AS produccion_total
FROM [PRODUCCION] p
JOIN [ESTANQUE] e ON p.idestanque = e.idestanque
GROUP BY e.idestanque, e.ubicacion;
--Obtener el historial de mantenimiento de un estanque específico:
SELECT * FROM [ESTANQUE]
WHERE [idestanque] = 1; 
--Obtener todos los estanques con su último mantenimiento:
SELECT idestanque, ubicacion, fecha_limpieza, rep_mejoras, vida_util
FROM [ESTANQUE];
--Obtener información de contacto y rol de todos los empleados:

SELECT e.idempleado, e.nombre, e.cedula, r.nombre AS rol
FROM [EMPLEADO] e
JOIN [ROL] r ON e.idrol = r.idrol;
--Obtener todas las ventas realizadas a un cliente específico:

SELECT * FROM [VENTA]
WHERE [idcliente] = 1; 
--Obtener las ventas totales por producto:
SELECT p.nombre, SUM(v.cant_vend) AS total_vendido, SUM(v.precio) AS ingreso_total
FROM [VENTA] v
JOIN [PRODUCTO] p ON v.idproducto = p.idproducto
GROUP BY p.nombre;
--Obtener la información de contacto de los clientes y su historial de compras:
SELECT c.idcliente, c.nombre, c.cedula, c.direccion, v.idventa, v.fecha_vend, v.cant_vend, v.precio
FROM [CLIENTE] c
JOIN [VENTA] v ON c.idcliente = v.idcliente;




-- Diccionario de datos para la tabla CLIENTE
SELECT 
    'CLIENTE' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('CLIENTE');
GO

-- Diccionario de datos para la tabla CAMARONERA
SELECT 
    'CAMARONERA' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('CAMARONERA');
GO

-- Diccionario de datos para la tabla ROL
SELECT 
    'ROL' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('ROL');
GO

-- Diccionario de datos para la tabla EMPLEADO
SELECT 
    'EMPLEADO' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('EMPLEADO');
GO

-- Diccionario de datos para la tabla ESTANQUE
SELECT 
    'ESTANQUE' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('ESTANQUE');
GO

-- Diccionario de datos para la tabla PRODUCCION
SELECT 
    'PRODUCCION' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('PRODUCCION');
GO

-- Diccionario de datos para la tabla PRODUCTO
SELECT 
    'PRODUCTO' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('PRODUCTO');
GO

-- Diccionario de datos para la tabla VENTA
SELECT 
    'VENTA' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('VENTA');
GO

-- Diccionario de datos para la tabla TIPO_SUMINISTRO
SELECT 
    'TIPO_SUMINISTRO' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('TIPO_SUMINISTRO');
GO

-- Diccionario de datos para la tabla PROVEEDOR
SELECT 
    'PROVEEDOR' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('PROVEEDOR');
GO

-- Diccionario de datos para la tabla PEDIDO
SELECT 
    'PEDIDO' AS Tabla,
    c.name AS Campo,
    ty.name AS TipoDato,
    c.max_length AS LongitudMaxima
FROM 
    sys.columns c 
INNER JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    object_id = OBJECT_ID('PEDIDO');
GO
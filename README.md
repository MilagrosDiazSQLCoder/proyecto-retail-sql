 Pre-entrega: Tablas Principales con Restricciones y Datos Iniciales

Este repositorio contiene la estructura inicial de la base de datos retail_project

 Estructura del Proyecto

* `retail_project.sql`: Archivo SQL principal con todo el script estructurado.

 Tablas Creadas
clientes: Información de los clientes. Incluye restricción `CHECK` para garantizar que la edad sea mayor o igual a 18 años.
productos: Catálogo de productos. Incluye restricciones `CHECK` para precio positivo y stock no negativo.
ventas: Registro de transacciones con claves foráneas hacia `clientes` y `productos`.

 Cómo Ejecutar el Script

 Desde DBeaver
1. Abre DBeaver y conéctate a tu servidor de PostgreSQL.
2. Crea la base de datos `retail_project` (Clic derecho en *Bases de datos* -> *Crear nueva Database*).
3. Selecciona la base de datos `retail_project`.
4. Abre el archivo `retail_project.sql` desde el Editor SQL de DBeaver.
5. Ejecuta todo el script con la opción **Execute SQL Script** (`Alt + X` o `Ctrl + Shift + Enter`).

 Desde la consola (psql)
```bash
psql -U tu_usuario -d postgres -c "CREATE DATABASE retail_project;"
psql -U tu_usuario -d retail_project -f retail_project.sql

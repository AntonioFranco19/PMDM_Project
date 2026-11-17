# New Bogata

**Comercio:** Pizzería New Bogata (Águilas, Murcia)  
**Equipo:** Antonio Franco Cegarra · Elena Gris · Raúl  
**Módulo:** PMDM · 2.º DAM · Sprint 1 (UT2)

## Cómo ejecutar la app

Desde la carpeta raíz del proyecto, ejecutar:

```bash
flutter pub get
flutter run
```

## Productos o servicios

La aplicación incluye un catálogo inicial de productos organizados por categorías.

| id | Nombre | Descripción | Precio (€) | Categoría |
|---:|---|---|---:|---|
| 1 | Pizza York | Pizza de jamón york | 7,00 | Pizzas |
| 2 | Pizza Barbacoa | Pizza con salsa barbacoa | 8,50 | Pizzas |
| 3 | Pizza Carbonara | Pizza de estilo carbonara | 8,50 | Pizzas |
| 4 | Pizza Aurora | Pizza especial de la casa | 10,00 | Pizzas |
| 5 | Pizza Rústica | Pizza de estilo rústico | 9,50 | Pizzas |
| 6 | Pizza Vegetal | Pizza con ingredientes vegetales | 8,00 | Pizzas |
| 7 | Hamburguesa New Bogata | Hamburguesa de la casa | 6,00 | Hamburguesas |
| 8 | Hamburguesa Angus | Hamburguesa de carne Angus | 8,00 | Hamburguesas |
| 9 | Hamburguesa Crispy Chicken | Hamburguesa de pollo crujiente | 5,00 | Hamburguesas |
| 10 | Bocadillo Serrano | Bocadillo de jamón serrano | 7,00 | Bocadillos |
| 11 | Bocadillo de Bacon | Bocadillo de bacon | 4,50 | Bocadillos |
| 12 | Ensalada New Bogata | Ensalada de la casa | 7,00 | Ensaladas |

## Estructura y clases

| Clase | Carpeta | Hereda de | Qué hace | Autor/a |
|---|---|---|---|---|
| Producto | models | — | Almacena los datos de un producto: identificador, nombre, descripción, precio y categoría. | Antonio |
| productosEjemplo | data | — | Contiene la lista de productos iniciales que se muestran en el catálogo. | Antonio |
| CatalogoScreen | screens | StatefulWidget | Muestra el catálogo, permite ordenar los productos, acceder al detalle, añadir productos y eliminarlos con confirmación. | Elena |
| DetalleScreen | screens | StatelessWidget | Muestra la información detallada de un producto seleccionado. | Elena |
| NuevoProductoScreen | screens | StatefulWidget | Contiene el formulario para introducir un producto nuevo y devolverlo al catálogo. | Raúl |
| ProductoTile | Widgets | StatelessWidget | Muestra la información de un producto en el catálogo y gestiona las pulsaciones mediante callbacks. | Elena |r

## Reparto del trabajo

| Persona | Tareas del sprint 1 | Rama |
|---|---|---|
| Antonio | Modelo Producto y datos iniciales del catálogo. | [rama] |
| Elena | Pantalla de catálogo, listado, ordenación y eliminación. | [rama] |
| Raúl | Pantalla de detalle y formulario para añadir productos. | [rama] |

## Pruebas de interacción (dos emuladores)

**Dispositivos utilizados:**
- Teléfono Android API 37.
- Tableta Google Play Android API 36.

**Nota:** Se ha utilizado un teléfono API 37 porque ya estaba instalado y no se dispone de suficiente memoria en los equipos para instalar otro emulador.

| # | Prueba | Teléfono API 37 | Tableta API 36 |
|---|---|---|---|
| 1 | Todas las pantallas se abren y vuelven con la flecha y con el botón atrás. | Correcta | Correcta |
| 2 | Una lista con muchos elementos se desplaza sin saltos. | Correcta | Correcta |
| 3 | Un texto muy largo no rompe la fila ni se sale de pantalla. | Correcta | Correcta |
| 4 | El formulario rechaza valores vacíos y números no válidos. | Correcta | Correcta |
| 5 | Con el teclado abierto se ve el botón de guardar. | Correcta | Correcta |
| 6 | Al girar la pantalla no se pierde lo escrito ni la posición de la lista. | Correcta | Correcta |
| 7 | Los favoritos marcados en el detalle se ven en el catálogo al volver. | Correcta | Correcta |
| 8 | Tras pulsar Inicio y volver, la app está donde estaba. | Correcta | Correcta |
| 9 | En la tableta la interfaz aprovecha el ancho o al menos no queda rota. | Correcta | Correcta |
| 10 | No hay errores rojos en la consola de depuración. | Correcta | Correcta |

## Flutter Analyze

Se ha ejecutado el comando y la salida es
No issues found!

## Incidencias

| Qué pasa | Dispositivo | Solución o estado | Issue |
|---|---|---|---|
| Los favoritos marcados en el detalle no se reflejan en el catálogo al volver. | Teléfono y tableta | Funcionalidad no implementada. | Pendiente |

## Declaración del uso de IA

Se ha utilizado ChatGPT como herramienta de apoyo durante el desarrollo del sprint. Se ha empleado para ayudar a estructurar el proyecto, revisar código Dart/Flutter y resolver dudas sobre el funcionamiento de determinados componentes.
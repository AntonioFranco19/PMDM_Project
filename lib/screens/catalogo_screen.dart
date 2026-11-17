import 'package:flutter/material.dart';

import '../data/productos_ejemplo.dart';
import '../models/producto.dart';
import 'detalle_screen.dart';
import 'nuevo_producto_screen.dart';
import '../widgets/producto_tile.dart';

/// Pantalla principal del catálogo.
/// Por ahora solo comprueba que los datos se leen bien.
/// En la sesión 2 de la UT2 se convierte en una lista con ListView.builder.

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  // Lista modificable de productos
  final List<Producto> productos = List.from(productosEjemplo);

  // Ordenar los productos
  void ordenarProductos(String criterio) {
    setState(() {
      if (criterio == 'nombre') {
        productos.sort((a, b) => a.nombre.compareTo(b.nombre));
      } else if (criterio == 'precio') {
        productos.sort((a, b) => a.precio.compareTo(b.precio));
      }
    });
  }

  // Mostrar confirmación antes de borrar
  Future<void> confirmarBorrado(Producto producto) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar producto'),
          content: Text('¿Seguro que quieres eliminar ${producto.nombre}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (confirmar == true && mounted) {
      setState(() {
        productos.removeWhere((p) => p.id == producto.id);
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${producto.nombre} eliminado')));
    }
  }

  // Abrir formulario para añadir un producto
  Future<void> abrirFormulario() async {
    final nuevoProducto = await Navigator.push<Producto>(
      context,
      MaterialPageRoute(builder: (context) => const NuevoProductoScreen()),
    );

    if (nuevoProducto != null && mounted) {
      setState(() {
        productos.add(nuevoProducto);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Bogata'),
        centerTitle: true,
        actions: [
          // Menú de opciones
          PopupMenuButton<String>(
            onSelected: (criterio) {
              if (criterio == 'nombre' || criterio == 'precio') {
                ordenarProductos(criterio);
              } else if (criterio == 'acerca') {
                showAboutDialog(
                  context: context,
                  applicationName: 'New Bogata',
                  applicationVersion: '1.0.0',
                  applicationLegalese: 'Proyecto PMDM - UT2',
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'nombre',
                child: Text('Ordenar por nombre'),
              ),
              const PopupMenuItem(
                value: 'precio',
                child: Text('Ordenar por precio'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(value: 'acerca', child: Text('Acerca de')),
            ],
          ),
        ],
      ),

      // Lista de productos
      body: productos.isEmpty
          ? const Center(child: Text('No hay productos en el catálogo'))
          : ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];

                return ProductoTile(
                  producto: producto,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleScreen(producto: producto),
                      ),
                    );
                  },
                  onLongPress: () {
                    confirmarBorrado(producto);
                  },
                );
              },
            ),

      // Botón para añadir productos
      floatingActionButton: FloatingActionButton(
        onPressed: abrirFormulario,
        child: const Icon(Icons.add),
      ),
    );
  }
}

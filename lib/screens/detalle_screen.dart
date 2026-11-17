import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/favoritos_provider.dart';
import '../models/producto.dart';

class DetalleScreen extends StatelessWidget {
  final Producto producto;

  const DetalleScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = context.watch<FavoritosProvider>();
    final esFavorito = favoritosProvider.esFavorito(producto);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        actions: [
          IconButton(
            icon: Icon(
              esFavorito ? Icons.favorite : Icons.favorite_border,
              color: esFavorito ? Colors.red : null,
            ),
            tooltip: esFavorito ? 'Quitar de favoritos' : 'Añadir a favoritos',
            onPressed: () {
              context.read<FavoritosProvider>().alternarFavorito(producto);
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              producto.nombre,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              'Categoría: ${producto.categoria}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            const Text(
              'Descripción',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(producto.descripcion, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 30),

            const Text(
              'Precio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              producto.precioTexto,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

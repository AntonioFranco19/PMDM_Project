import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/producto.dart';
import '../services/favoritos_provider.dart';

class ProductoTile extends StatelessWidget {
  final Producto producto;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const ProductoTile({
    super.key,
    required this.producto,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = context.watch<FavoritosProvider>();
    final esFavorito = favoritosProvider.esFavorito(producto);

    return ListTile(
      title: Text(producto.nombre),
      subtitle: Text(
        producto.categoria,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(producto.precioTexto),
          const SizedBox(width: 12),
          Icon(
            esFavorito ? Icons.favorite : Icons.favorite_border,
            color: esFavorito ? Colors.red : Colors.grey,
          ),
        ],
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}

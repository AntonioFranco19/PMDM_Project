
import 'package:flutter/foundation.dart';
import '../models/producto.dart';

class FavoritosProvider extends ChangeNotifier {
  final List<Producto> _favoritos = [];

  List<Producto> get favoritos => List.unmodifiable(_favoritos);

  bool esFavorito(Producto producto) {
    return _favoritos.any((p) => p.id == producto.id);
  }

  void alternarFavorito(Producto producto) {
    if (esFavorito(producto)) {
      _favoritos.removeWhere((p) => p.id == producto.id);
    } else {
      _favoritos.add(producto);
    }

    notifyListeners();
  }
}

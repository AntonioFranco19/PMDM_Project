import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/favoritos_provider.dart';
import 'screens/catalogo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritosProvider(),
      child: const ComercioApp(),
    ),
  );
}

/// Raíz de la app del comercio.
/// TODO (equipo): cambia el título y el color por los de vuestro comercio.
class ComercioApp extends StatelessWidget {
  const ComercioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzería New Bogata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown)),
      home: const CatalogoScreen(),
    );
  }
}

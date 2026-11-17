
import 'package:flutter/material.dart';
import '../models/producto.dart';

class NuevoProductoScreen extends StatefulWidget {
  const NuevoProductoScreen({super.key});

  @override
  State<NuevoProductoScreen> createState() =>
      _NuevoProductoScreenState();
}

class _NuevoProductoScreenState extends State<NuevoProductoScreen> {

  // Clave para validar el formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores de los campos
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();

  // Categoría seleccionada
  String categoriaSeleccionada = 'Pizzas';

  // Liberar los controladores
  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  // Guardar el producto
  void guardarProducto() {
    if (_formKey.currentState!.validate()) {

      final nuevoProducto = Producto(
        id: DateTime.now().microsecondsSinceEpoch,
        nombre: _nombreController.text.trim(),
        descripcion: _descripcionController.text.trim(),
        precio: double.parse(
          _precioController.text.trim().replaceAll(',', '.'),
        ),
        categoria: categoriaSeleccionada,
      );

      // Devolver el producto al catálogo
      Navigator.pop(context, nuevoProducto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo producto'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Nombre
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Introduce el nombre del producto';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Descripción
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Introduce una descripción';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Precio
              TextFormField(
                controller: _precioController,
                decoration: const InputDecoration(
                  labelText: 'Precio (€)',
                  border: OutlineInputBorder(),
                  prefixText: '€ ',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Introduce un precio';
                  }

                  final precio = double.tryParse(
                    value.trim().replaceAll(',', '.'),
                  );

                  if (precio == null || precio <= 0) {
                    return 'Introduce un precio válido';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Categoría
              DropdownButtonFormField<String>(
                initialValue: categoriaSeleccionada,
                decoration: const InputDecoration(
                  labelText: 'Categoría',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Pizzas',
                    child: Text('Pizzas'),
                  ),
                  DropdownMenuItem(
                    value: 'Hamburguesas',
                    child: Text('Hamburguesas'),
                  ),
                  DropdownMenuItem(
                    value: 'Bocadillos',
                    child: Text('Bocadillos'),
                  ),
                  DropdownMenuItem(
                    value: 'Ensaladas',
                    child: Text('Ensaladas'),
                  ),
                  DropdownMenuItem(
                    value: 'Otros',
                    child: Text('Otros'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    categoriaSeleccionada = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              // Botón guardar
              ElevatedButton(
                onPressed: guardarProducto,
                child: const Text('Guardar producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

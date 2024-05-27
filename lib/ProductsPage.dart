import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final String category;

  ProductsPage({required this.category});

  List<Map<String, dynamic>> products = [];

  void addProducts() {
    if (category == 'PCs de Escritorio') {
      products = [
        {"name": "HP Pavilion", "price": 799, "image": "images/hp_pavilion.jpg"},
        {"name": "Dell Inspiron", "price": 699, "image": "images/dell_inspiron.jpg"},
        {"name": "Lenovo ThinkCentre", "price": 849, "image": "images/lenovo_thinkcentre.jpg"},
        {"name": "Acer Aspire", "price": 599, "image": "images/acer_aspire.jpg"},
        {"name": "Asus VivoPC", "price": 749, "image": "images/asus_vivopc.jpg"},
      ];
    } else if (category == 'Laptops') {
      products = [
        {"name": "MacBook Air", "price": 999, "image": "images/macbook_air.jpg"},
        {"name": "Dell XPS 13", "price": 999, "image": "images/dell_xps13.jpg"},
        {"name": "HP Spectre x360", "price": 1249, "image": "images/hp_spectre.jpg"},
        {"name": "Lenovo ThinkPad X1 Carbon", "price": 1429, "image": "images/lenovo_thinkpad.jpg"},
        {"name": "Asus ZenBook 14", "price": 899, "image": "images/asus_zenbook.jpg"},
      ];
    } else if (category == 'Monitores') {
      products = [
        {"name": "LG UltraGear", "price": 299, "image": "images/lg_ultragear.jpg"},
        {"name": "Dell Ultrasharp", "price": 399, "image": "images/dell_ultrasharp.jpg"},
        {"name": "Asus ROG Strix", "price": 499, "image": "images/asus_rog.jpg"},
        {"name": "Samsung Odyssey", "price": 349, "image": "images/samsung_odyssey.jpg"},
        {"name": "HP Pavilion", "price": 249, "image": "images/hp_monitor.jpg"},
      ];
    } else if (category == 'Periféricos') {
      products = [
        {"name": "Logitech MX Master 3", "price": 99, "image": "images/logitech_mx_master.jpg"},
        {"name": "Razer BlackWidow Elite", "price": 129, "image": "images/razer_blackwidow.jpg"},
        {"name": "Corsair K95 RGB Platinum", "price": 159, "image": "images/corsair_k95.jpg"},
        {"name": "SteelSeries Rival 650", "price": 79, "image": "images/steelseries_rival.jpg"},
        {"name": "HyperX Cloud II", "price": 99, "image": "images/hyperx_cloud.jpg"},
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    addProducts(); // Llamada a la función para inicializar la lista de productos

    // Lista de colores para cada categoría
    List<Color> categoryColors = [
      Colors.orange, // PCs de Escritorio
      Colors.green, // Laptops
      Colors.blue, // Monitores
      Colors.red, // Periféricos
    ];

    int index = ['PCs de Escritorio', 'Laptops', 'Monitores', 'Periféricos'].indexOf(category);
    Color backgroundColor = categoryColors[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Container(
        color: backgroundColor, // Establecer el color de fondo del listado
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4, // Elevación para dar una sensación de capas
              margin: EdgeInsets.all(10), // Margen alrededor del Card
              child: ListTile(
                title: Text(
                  products[index]["name"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${products[index]["price"]}',
                  style: TextStyle(fontSize: 14),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Borde redondeado para la imagen
                  child: Image.asset(
                    products[index]["image"],
                    width: 80,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Producto agregado al carrito'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

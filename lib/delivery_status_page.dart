import 'package:flutter/material.dart';

enum OrderStatus { pending, inProgress, completed }

class Order {
  final String id;
  final String name;
  final OrderStatus status;

  Order({required this.id, required this.name, required this.status});
}

class DeliveryStatusPage extends StatelessWidget {
  final List<Order> orders = [
    Order(id: '1', name: 'Pedido 1', status: OrderStatus.completed),
    Order(id: '2', name: 'Pedido 2', status: OrderStatus.inProgress),
    Order(id: '3', name: 'Pedido 3', status: OrderStatus.pending),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado de la Entrega'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildOrderTimeline(orders[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderTimeline(Order order) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              color: order.status == OrderStatus.pending ? Colors.grey : Colors.green,
            ),
            SizedBox(width: 8),
            Icon(
              Icons.circle,
              color: order.status == OrderStatus.inProgress ? Colors.amber : Colors.grey,
            ),
            SizedBox(width: 8),
            Icon(
              Icons.circle,
              color: order.status == OrderStatus.completed ? Colors.green : Colors.grey,
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text('Pendiente', style: TextStyle(color: order.status == OrderStatus.pending ? Colors.black : Colors.grey)),
            SizedBox(width: 12),
            Text('En Proceso', style: TextStyle(color: order.status == OrderStatus.inProgress ? Colors.black : Colors.grey)),
            SizedBox(width: 12),
            Text('Completado', style: TextStyle(color: order.status == OrderStatus.completed ? Colors.black : Colors.grey)),
          ],
        ),
        SizedBox(height: 16),
        Divider(),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DeliveryStatusPage(),
  ));
}





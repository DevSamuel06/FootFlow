import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/pedido_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import '../models/cliente.dart';
import '../models/pedido.dart';

class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {},
          ),
          title: const Text('Pedidos', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Novo'),
              Tab(text: 'Em Produção'),
              Tab(text: 'Concluído'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _OrderList(status: 'Novo'),
            _OrderList(status: 'Em Produção'),
            _OrderList(status: 'Concluído'),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      ),
    );
  }
}

class _OrderList extends StatelessWidget {
  final String status;
  const _OrderList({required this.status});

  @override
  Widget build(BuildContext context) {
    return Consumer<PedidoController>(
      builder: (context, pedidoController, child) {
        final filteredOrders = pedidoController.pedidos.where((p) => p.status == status).toList();
        
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: filteredOrders.length,
          itemBuilder: (context, index) {
            final order = filteredOrders[index];
            return OrderCard(
              orderId: order.id,
              clientName: 'Cliente: ${order.cliente.nome}',
              status: order.status,
            );
          },
        );
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String clientName;
  final String status;

  const OrderCard({required this.orderId, required this.clientName, required this.status, super.key});

  Color _getStatusColor() {
    switch (status) {
      case 'Novo': return Colors.blue;
      case 'Em Produção': return Colors.orange;
      case 'Concluído': return Colors.green;
      case 'Entregue': return Colors.grey;
      default: return Colors.black;
    }
  }

  Color _getBackgroundColor() {
    switch (status) {
      case 'Novo': return Colors.blue[50]!;
      case 'Em Produção': return Colors.orange[50]!;
      case 'Concluído': return Colors.green[50]!;
      case 'Entregue': return Colors.grey[300]!;
      default: return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.grey[200]!)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pedido $orderId', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4.0),
                Text(clientName, style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(color: _getBackgroundColor(), borderRadius: BorderRadius.circular(6.0)),
                  child: Text(status, style: TextStyle(color: _getStatusColor(), fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 8.0),
                const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

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
            onPressed: () {
              // Ação do menu
            },
          ),
          title: const Text(
            'Pedidos',
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Novo'),
              Tab(text: 'Em Produção'),
              Tab(text: 'Concluído'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Tela de "Novo"
            _OrderList(status: 'Novo'),
            // Tela de "Em Produção"
            _OrderList(status: 'Em Produção'),
            // Tela de "Concluído"
            _OrderList(status: 'Concluído'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[600],
          currentIndex: 1, // Define 'Pedidos' como selecionado
          onTap: (index) {
            // Lógica de navegação para outras telas
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Pedidos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Clientes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para a lista de pedidos
class _OrderList extends StatelessWidget {
  final String status;

  const _OrderList({required this.status});

  @override
  Widget build(BuildContext context) {
    // Exemplo de lista de pedidos. Em um app real, você usaria dados dinâmicos.
    final orders = [
      {'id': '#12345', 'client': 'Calçados Silva', 'status': 'Novo'},
      {'id': '#12346', 'client': 'Calçados Silva', 'status': 'Em Produção'},
      {'id': '#12347', 'client': 'Calçados Silva', 'status': 'Concluído'},
      {'id': '#12348', 'client': 'Calçados Silva', 'status': 'Novo'},
      {'id': '#12349', 'client': 'Calçados Silva', 'status': 'Em Produção'},
      {'id': '#12350', 'client': 'Calçados Silva', 'status': 'Concluído'},
      {'id': '#12351', 'client': 'Calçados Silva', 'status': 'Entregue'},
    ];

    // Filtra a lista com base no status da aba
    final filteredOrders = orders.where((order) => order['status'] == status).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return OrderCard(
          orderId: order['id']!,
          clientName: 'Cliente: ${order['client']!}',
          status: order['status']!,
        );
      },
    );
  }
}

// Widget auxiliar para cada cartão de pedido
class OrderCard extends StatelessWidget {
  final String orderId;
  final String clientName;
  final String status;

  const OrderCard({
    required this.orderId,
    required this.clientName,
    required this.status,
    super.key,
  });

  Color _getStatusColor() {
    switch (status) {
      case 'Novo':
        return Colors.blue;
      case 'Em Produção':
        return Colors.orange;
      case 'Concluído':
        return Colors.green;
      case 'Entregue':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  Color _getBackgroundColor() {
    switch (status) {
      case 'Novo':
        return Colors.blue[50]!;
      case 'Em Produção':
        return Colors.orange[50]!;
      case 'Concluído':
        return Colors.green[50]!;
      case 'Entregue':
        return Colors.grey[300]!;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pedido $orderId',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  clientName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: _getBackgroundColor(),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: _getStatusColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
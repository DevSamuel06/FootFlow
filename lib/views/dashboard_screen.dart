import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Dashboard',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Grid de cartões de estatísticas
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: const [
                  _StatisticCard(
                    title: 'Novo',
                    value: '12',
                    backgroundColor: Color(0xFFE3F2FD), // Azul claro
                    valueColor: Colors.blue,
                  ),
                  _StatisticCard(
                    title: 'Em produção',
                    value: '8',
                    backgroundColor: Color(0xFFFFF3E0), // Laranja claro
                    valueColor: Colors.deepOrange,
                  ),
                  _StatisticCard(
                    title: 'Concluído',
                    value: '25',
                    backgroundColor: Color(0xFFE8F5E9), // Verde claro
                    valueColor: Colors.green,
                  ),
                  _StatisticCard(
                    title: 'Entregue',
                    value: '15',
                    backgroundColor: Color(0xFFEEEEEE), // Cinza claro
                    valueColor: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Botão "Criar Novo Pedido"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Ação para criar novo pedido
                },
                icon: const Icon(Icons.add),
                label: const Text(
                  'Criar Novo Pedido',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Garante que todos os itens são visíveis
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[600],
        currentIndex: 0, // Define 'Dashboard' como selecionado inicialmente
        onTap: (index) {
          // Lógica para navegação entre as telas
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
    );
  }
}

// Widget auxiliar para os cartões de estatísticas
class _StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Color valueColor;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0, // Sem sombra para um visual mais clean
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
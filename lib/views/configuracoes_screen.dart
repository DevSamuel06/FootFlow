import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ConfiguracoesScreen extends StatelessWidget {
  const ConfiguracoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Tela de Configurações'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}
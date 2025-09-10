import 'package:flutter/material.dart';

class NewClientScreen extends StatelessWidget {
  const NewClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context); // Ação para fechar a tela
          },
        ),
        title: const Text(
          'Novo Cliente',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de Nome
            const Text(
              'Nome',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nome do cliente',
                prefixIcon: const Icon(Icons.person_outline, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 24.0),

            // Campo de Telefone
            const Text(
              'Telefone',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '(00) 00000-0000',
                prefixIcon: const Icon(Icons.phone_outlined, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const Spacer(),

            // Botão "Salvar Cliente"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Ação para salvar o cliente
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Salvar Cliente',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
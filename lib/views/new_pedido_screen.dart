import 'package:flutter/material.dart';

class NewPedidoScreen extends StatefulWidget {
  const NewPedidoScreen({super.key});

  @override
  State<NewPedidoScreen> createState() => _NewPedidoScreenState();
}

class _NewPedidoScreenState extends State<NewPedidoScreen> {
  String? _selectedClient;
  final List<String> _clients = ['Calçados Silva', 'Tênis BR', 'Sapataria Ideal'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Novo Pedido',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Campo de seleção do cliente (Dropdown)
            DropdownButtonFormField<String>(
              value: _selectedClient,
              decoration: InputDecoration(
                labelText: 'Selecione o Cliente',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              items: _clients.map((String client) {
                return DropdownMenuItem<String>(
                  value: client,
                  child: Text(client),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedClient = newValue;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Campo "Item do Pedido"
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Item do Pedido',
                suffixIcon: const Icon(Icons.content_copy, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16.0),

            // Campo "Quantidade"
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade',
                suffixIcon: const Icon(Icons.filter_none, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16.0),

            // Campo de Data
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'mm/dd/yyyy',
                suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onTap: () async {
                // Lógica para abrir o seletor de data
                // final date = await showDatePicker(...)
              },
            ),
            const Spacer(),

            // Botão "Salvar Pedido"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Ação para salvar o pedido
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
                  'Salvar Pedido',
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/pedido_controller.dart';
import '../controllers/cliente_controller.dart';
import '../models/pedido.dart';
import '../models/cliente.dart';

class NewPedidoScreen extends StatefulWidget {
  const NewPedidoScreen({super.key});

  @override
  State<NewPedidoScreen> createState() => _NewPedidoScreenState();
}

class _NewPedidoScreenState extends State<NewPedidoScreen> {
  Cliente? _selectedClient;
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final clienteController = Provider.of<ClienteController>(
      context,
      listen: false,
    );

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
            DropdownButtonFormField<Cliente>(
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
              items: clienteController.clientes.map((Cliente cliente) {
                return DropdownMenuItem<Cliente>(
                  value: cliente,
                  child: Text(cliente.nome),
                );
              }).toList(),
              onChanged: (Cliente? newValue) {
                setState(() => _selectedClient = newValue);
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _itemController,
              decoration: InputDecoration(
                labelText: 'Item do Pedido',
                suffixIcon: Icon(Icons.content_copy, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade',
                suffixIcon: Icon(Icons.filter_none, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _dataController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'mm/dd/yyyy',
                suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedClient != null) {
                    final novoPedido = Pedido(
                      id: '12352',
                      item: _itemController.text,
                      quantidade: int.tryParse(_quantidadeController.text) ?? 0,
                      data: DateTime.now(),
                      status: 'Novo',
                      cliente: _selectedClient!,
                    );
                    Provider.of<PedidoController>(
                      context,
                      listen: false,
                    ).adicionarNovoPedido(novoPedido);
                    Navigator.pop(context);
                  }
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

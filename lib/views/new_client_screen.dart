import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/cliente_controller.dart';
import '../models/cliente.dart';

class NewClientScreen extends StatelessWidget {
  const NewClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController telefoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.black87), onPressed: () => Navigator.pop(context)),
        title: const Text('Novo Cliente', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nome', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 8.0),
            TextFormField(controller: nomeController, decoration: InputDecoration(hintText: 'Nome do cliente', prefixIcon: const Icon(Icons.person_outline, color: Colors.grey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.grey)), filled: true, fillColor: Colors.grey[100])),
            const SizedBox(height: 24.0),
            const Text('Telefone', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 8.0),
            TextFormField(controller: telefoneController, keyboardType: TextInputType.phone, decoration: InputDecoration(hintText: '(00) 00000-0000', prefixIcon: const Icon(Icons.phone_outlined, color: Colors.grey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.grey)), filled: true, fillColor: Colors.grey[100])),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final novoCliente = Cliente(id: '4', nome: nomeController.text, telefone: telefoneController.text);
                  Provider.of<ClienteController>(context, listen: false).adicionarNovoCliente(novoCliente);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blue, padding: const EdgeInsets.symmetric(vertical: 16.0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
                child: const Text('Salvar Cliente', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'cliente.dart'; 

class Pedido {
  final String id;
  final String item;
  final int quantidade;
  final DateTime data;
  String status; // Pode ser alterado, como 'Novo', 'Em Produção', 'Concluído'
  final Cliente cliente; // O cliente associado ao pedido

  Pedido({
    required this.id,
    required this.item,
    required this.quantidade,
    required this.data,
    required this.status,
    required this.cliente,
  });

  // Método de conversão de JSON (para consumo de API)
  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'] as String,
      item: json['item'] as String,
      quantidade: json['quantidade'] as int,
      data: DateTime.parse(json['data'] as String),
      status: json['status'] as String,
      cliente: Cliente.fromJson(json['cliente']), // Converte o JSON do cliente
    );
  }

  // Método de conversão para JSON (para enviar para a API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item': item,
      'quantidade': quantidade,
      'data': data.toIso8601String(),
      'status': status,
      'cliente': cliente.toJson(), // Converte o cliente para JSON
    };
  }
}
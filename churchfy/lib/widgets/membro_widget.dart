import 'package:flutter/material.dart';

class MembroWidget extends StatelessWidget {
  final String nome;
  final String cargo;
  final String telefone;

  const MembroWidget(
      {super.key,
      required this.nome,
      required this.cargo,
      required this.telefone});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(nome),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cargo),
          Text(telefone),
        ],
      ),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        // Ação ao clicar no ListTile
      },
    );
  }
}

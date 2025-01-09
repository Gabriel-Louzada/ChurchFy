import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/screens/tela_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Bem-vindo à Tela Inicial!'),
            ElevatedButton(
                onPressed: () {
                  Provider.of<MembroProvider>(context, listen: false)
                      .carregarMembros();
                },
                child: const Text("Clique aqui"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => TelaCadastro(),
              ),
            );
          }),
    );
  }
}

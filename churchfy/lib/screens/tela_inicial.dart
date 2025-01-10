import 'package:churchfy/dao/membro_dao.dart';
import 'package:churchfy/models/membro_model.dart';
import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/screens/tela_cadastro.dart';
import 'package:churchfy/widgets/membro_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final MembroDao membroDao = MembroDao();
  List<MembroModel> membros = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MembroProvider>(context, listen: false).carregarMembros();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Tela Inicial'),
      ),
      body: Consumer<MembroProvider>(builder: (context, provider, child) {
        return ListView.builder(
            itemCount: provider.membros.length + 1,
            itemBuilder: (context, index) {
              if (index == provider.membros.length) {
                return const SizedBox(height: 80);
              } else {
                final membroProvider = provider.membros[index];
                return MembroWidget(membro: membroProvider);
              }
            });
      }),
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

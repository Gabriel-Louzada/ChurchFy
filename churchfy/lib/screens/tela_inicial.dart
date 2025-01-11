import 'package:churchfy/dao/membro_dao.dart';
import 'package:churchfy/models/membro_model.dart';
import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/screens/tela_cadastro.dart';
import 'package:churchfy/screens/tela_inativos.dart';
import 'package:churchfy/widgets/membro_widget.dart';
import 'package:churchfy/widgets/pesquisa.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                "Churchfy",
                style: TextStyle(fontSize: 22),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_off),
              title: const Text("Membros Inativos"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contextNew) => const TelaInativos()));
              },
            ),
          ],
        ),
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

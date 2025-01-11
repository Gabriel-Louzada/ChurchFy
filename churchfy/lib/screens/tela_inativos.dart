import 'package:churchfy/dao/membro_dao.dart';
import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/widgets/membro_inativo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaInativos extends StatefulWidget {
  const TelaInativos({super.key});

  @override
  _TelaInativosState createState() => _TelaInativosState();
}

class _TelaInativosState extends State<TelaInativos> {
  final MembroDao membroDao = MembroDao();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MembroProvider>(context, listen: false)
          .carregarMembrosInativos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Membros Inativos'),
      ),
      body: Consumer<MembroProvider>(builder: (context, provider, child) {
        return ListView.builder(
            itemCount: provider.membrosInativos.length + 1,
            itemBuilder: (context, index) {
              if (index == provider.membrosInativos.length) {
                return const SizedBox(height: 80);
              } else {
                final membroProvider = provider.membrosInativos[index];
                return MembroInativoWidget(membro: membroProvider);
              }
            });
      }),
    );
  }
}

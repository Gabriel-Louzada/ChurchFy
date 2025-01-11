import 'package:churchfy/models/membro_model.dart';
import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/screens/tela_alteracao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MembroInativoWidget extends StatefulWidget {
  final MembroModel membro;

  const MembroInativoWidget({super.key, required this.membro});

  @override
  State<MembroInativoWidget> createState() => _MembroWidgetState();
}

class _MembroWidgetState extends State<MembroInativoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        surfaceTintColor: const Color.fromARGB(255, 77, 111, 129),
        elevation: 4,
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) => AlterarCadastro(
                        membro: widget.membro, membroContext: contextNew)));
          },
          leading: const Icon(Icons.person),
          title: Text(widget.membro.nome),
          subtitle: Text(
              "Cargo: ${widget.membro.cargo}  -  Ativo: ${widget.membro.membroStatus}"),
          trailing: IconButton(
              onPressed: () {
                Provider.of<MembroProvider>(context, listen: false)
                    .ativarMembro(widget.membro.id!);
              },
              icon: const Icon(Icons.person_add_alt_1)),
        ),
      ),
    );
  }
}
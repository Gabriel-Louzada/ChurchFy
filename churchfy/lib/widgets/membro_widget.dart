import 'package:churchfy/models/membro_model.dart';
import 'package:churchfy/screens/tela_alteracao.dart';
import 'package:flutter/material.dart';

class MembroWidget extends StatefulWidget {
  final MembroModel membro;

  const MembroWidget({super.key, required this.membro});

  @override
  State<MembroWidget> createState() => _MembroWidgetState();
}

class _MembroWidgetState extends State<MembroWidget> {
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
          subtitle: Text("Cargo: ${widget.membro.cargo}"),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_remove_alt_1)),
        ),
      ),
    );
  }
}

import 'package:churchfy/dao/membro_dao.dart';
import 'package:churchfy/models/membro_model.dart';
import 'package:flutter/material.dart';

class MembroProvider extends ChangeNotifier {
  List<MembroModel> _membros = [];
  List<MembroModel> get membros => _membros;

  void carregarMembros() {
    _membros = MembroDao().selectMembros();
    notifyListeners();
  }

  void adicionarMembro(MembroModel membro) {
    MembroDao().insertMembro(membro);
    print("Adicionando o membro");
    print(membro);
    carregarMembros();
  }

  void atualizarMembro(MembroModel membro) {
    MembroDao().atualizarMembro(membro);
    print("Atualizando o membro: ${membro.nome}");
    carregarMembros();
  }

  void removerMembro(int id) {
    MembroDao().deletarMembro(id);
    carregarMembros();
  }
}

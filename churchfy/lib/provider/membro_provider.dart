import 'package:churchfy/dao/membro_dao.dart';
import 'package:churchfy/models/membro_model.dart';
import 'package:flutter/material.dart';

class MembroProvider extends ChangeNotifier {
  List<MembroModel> _membros = [];
  List<MembroModel> _membrosInativos = [];

  List<MembroModel> get membros => _membros;
  List<MembroModel> get membrosInativos => _membrosInativos;

  void carregarMembros() {
    _membros = MembroDao().selectMembros();
    notifyListeners();
  }

  void carregarMembrosInativos() {
    _membrosInativos = MembroDao().selectMembrosInativos();
    notifyListeners();
  }

  void adicionarMembro(MembroModel membro) {
    MembroDao().insertMembro(membro);
    carregarMembros();
    carregarMembrosInativos();
  }

  void inativarMembro(int id) {
    MembroDao().inativarMembro(id);
    carregarMembros();
    carregarMembrosInativos();
  }

  void ativarMembro(int id) {
    MembroDao().ativarMembro(id);
    carregarMembros();
    carregarMembrosInativos();
  }

  void atualizarMembro(MembroModel membro) {
    MembroDao().atualizarMembro(membro);
    carregarMembros();
    carregarMembrosInativos();
  }

  void removerMembro(int id) {
    MembroDao().deletarMembro(id);
    carregarMembros();
    carregarMembrosInativos();
  }
}

import 'package:churchfy/models/membro_model.dart';
import 'package:sqlite3/sqlite3.dart';

class MembroDao {
  static const String nomeTabela = "membros";
  static const String id = "id";
  static const String nome = "nome";
  static const String nomePai = "nomePai";
  static const String nomeMae = "nomeMae";
  static const String dataNascimento = "dataNascimento";
  static const String dataBatismo = "dataBatismo";
  static const String membroDesde = "membroDesde";
  static const String membroStatus = "membroStatus";
  static const String cargo = "cargo";
  static const String profissao = "profissao";
  static const String endereco = "endereco";
  static const String numeroCasa = "numeroCasa";
  static const String bairro = "bairro";
  static const String cidade = "cidade";
  static const String estado = "estado";
  static const String observacao = "observacao";
  static const String telefone = "telefone";
  static const String estadoCivil = "estadoCivil";
  static const String naturalidade = "naturalidade";
  static const String nacionalidade = "nascionalidade";
  static const String conjuge = "conjuge";
  static const String numeroFilhos = "numeroFilhos";
  static const String igrejaProcedencia = "igrejaProcedencia";

  static const String tabelaSql = "CREATE TABLE IF NOT EXISTS $nomeTabela ("
      "$id INTEGER PRIMARY KEY, "
      "$nome TEXT, "
      "$nomePai TEXT, "
      "$nomeMae TEXT, "
      "$dataNascimento TEXT, "
      "$dataBatismo TEXT, "
      "$membroDesde TEXT, "
      "$membroStatus TEXT, "
      "$cargo TEXT, "
      "$profissao TEXT, "
      "$endereco TEXT, "
      "$numeroCasa TEXT, "
      "$bairro TEXT, "
      "$cidade TEXT, "
      "$estado TEXT, "
      "$observacao TEXT, "
      "$telefone TEXT, "
      "$estadoCivil TEXT, "
      "$naturalidade TEXT, "
      "$nacionalidade TEXT, "
      "$conjuge TEXT, "
      "$numeroFilhos INTEGER, "
      "$igrejaProcedencia TEXT)";

  Database abrirBd() {
    const databasePath = 'churchfy.db';
    final db = sqlite3.open(databasePath);
    db.execute(tabelaSql);
    return db;
  }

  // FUNÇÃO PARA INSERIR UM MEMBRO NO BANCO DE DADOS
  void insertMembro(MembroModel membro) async {
    abrirBd().execute('''
        INSERT INTO $nomeTabela (
          $nome, 
          $nomePai, 
          $nomeMae, 
          $dataNascimento, 
          $dataBatismo, 
          $membroDesde, 
          $membroStatus, 
          $cargo, 
          $profissao, 
          $endereco, 
          $numeroCasa, 
          $bairro, 
          $cidade, 
          $estado, 
          $observacao, 
          $telefone, 
          $estadoCivil, 
          $naturalidade, 
          $nacionalidade, 
          $conjuge, 
          $numeroFilhos, 
          $igrejaProcedencia
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
     ''', [
      membro.nome,
      membro.nomePai,
      membro.nomeMae,
      membro.dataNascimento,
      membro.dataBatismo,
      membro.membroDesde,
      membro.membroStatus,
      membro.cargo,
      membro.profissao,
      membro.endereco,
      membro.numeroCasa,
      membro.bairro,
      membro.cidade,
      membro.estado,
      membro.observacao,
      membro.telefone,
      membro.estadoCivil,
      membro.naturalidade,
      membro.nacionalidade,
      membro.conjuge,
      membro.numeroFilhos,
      membro.igrejaProcedencia
    ]);
  }

  // FUNÇÃO PARA OBTER TODOS OS MEMBROS DO BANCO DE DADOS
  List<MembroModel> selectMembros() {
    final resultados = abrirBd().select('''SELECT 
    $id,
    $nome,
    $nomePai,
    $nomeMae,
    $dataNascimento,
    $dataBatismo,
    $membroDesde,
    $membroStatus,
    $cargo,
    $profissao,
    $endereco,
    $numeroCasa,
    $bairro,
    $cidade,
    $estado,
    $observacao,
    $telefone,
    $estadoCivil,
    $naturalidade,
    $nacionalidade,
    $conjuge,
    $numeroFilhos,
    $igrejaProcedencia FROM $nomeTabela WHERE $membroStatus = "ativo" ORDER BY $nome''');
    if (resultados.isNotEmpty) {
      List<MembroModel> membros =
          resultados.map((map) => MembroModel.fromMap(map)).toList();
      return membros;
    } else {
      return [];
    }
  }

  List<MembroModel> selectMembrosInativos() {
    final resultados = abrirBd().select('''SELECT 
    $id,
    $nome,
    $nomePai,
    $nomeMae,
    $dataNascimento,
    $dataBatismo,
    $membroDesde,
    $membroStatus,
    $cargo,
    $profissao,
    $endereco,
    $numeroCasa,
    $bairro,
    $cidade,
    $estado,
    $observacao,
    $telefone,
    $estadoCivil,
    $naturalidade,
    $nacionalidade,
    $conjuge,
    $numeroFilhos,
    $igrejaProcedencia FROM $nomeTabela WHERE $membroStatus = "inativo" ORDER BY $nome''');
    if (resultados.isNotEmpty) {
      List<MembroModel> membros =
          resultados.map((map) => MembroModel.fromMap(map)).toList();
      return membros;
    } else {
      return [];
    }
  }

  // FUNÇÃO PARA OBTER UM MEMBRO PELO ID
  void atualizarMembro(MembroModel membro) {
    abrirBd().execute('''
  UPDATE $nomeTabela SET 
    $nome = ?,
    $nomePai = ?,
    $nomeMae = ?,
    $dataNascimento = ?,
    $dataBatismo = ?,
    $membroDesde = ?,
    $membroStatus = ?,
    $cargo = ?,
    $profissao = ?,
    $endereco = ?,
    $numeroCasa = ?,
    $bairro = ?,
    $cidade = ?,
    $estado = ?,
    $observacao = ?,
    $telefone = ?,
    $estadoCivil = ?,
    $naturalidade = ?,
    $nacionalidade = ?,
    $conjuge = ?,
    $numeroFilhos = ?,
    $igrejaProcedencia = ?
  WHERE $id = ?
  ''', [
      membro.nome,
      membro.nomePai,
      membro.nomeMae,
      membro.dataNascimento,
      membro.dataBatismo,
      membro.membroDesde,
      membro.membroStatus,
      membro.cargo,
      membro.profissao,
      membro.endereco,
      membro.numeroCasa,
      membro.bairro,
      membro.cidade,
      membro.estado,
      membro.observacao,
      membro.telefone,
      membro.estadoCivil,
      membro.naturalidade,
      membro.nacionalidade,
      membro.conjuge,
      membro.numeroFilhos,
      membro.igrejaProcedencia,
      membro.id
    ]);
  }

  // FUNÇÃO PARA DELETAR UM MEMBRO PELO ID
  void deletarMembro(int id) {
    abrirBd().execute('''
    DELETE FROM $nomeTabela WHERE $id = ? 
    ''', [id]);
  }

// FUNÇÃO PARA INATIVAR UM MEMBRO PELO ID
  void inativarMembro(int idMembro) {
    abrirBd().execute(
        '''UPDATE $nomeTabela SET $membroStatus = "inativo" WHERE $id = ? ''',
        [idMembro]);
  }

  // FUNÇÃO PARA INATIVAR UM MEMBRO PELO ID
  void ativarMembro(int idMembro) {
    abrirBd().execute(
        '''UPDATE $nomeTabela SET $membroStatus = "ativo" WHERE $id = ? ''',
        [idMembro]);
  }
}

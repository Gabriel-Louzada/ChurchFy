class MembroModel {
  int? id;
  String nome;
  String nomePai;
  String nomeMae;
  String dataNascimento;
  String dataBatismo;
  String membroDesde;
  String? membroStatus;
  String cargo;
  String profissao;
  String endereco;
  String numeroCasa;
  String bairro;
  String cidade;
  String estado;
  String? observacao;
  String telefone;
  String estadoCivil;
  String naturalidade;
  String nacionalidade;
  String? conjuge;
  int? numeroFilhos;
  String igrejaProcedencia;

  MembroModel(
      {this.id,
      required this.nome,
      required this.nomePai,
      required this.nomeMae,
      required this.dataNascimento,
      required this.dataBatismo,
      required this.membroDesde,
      this.membroStatus,
      required this.cargo,
      required this.profissao,
      required this.endereco,
      required this.numeroCasa,
      required this.bairro,
      required this.cidade,
      required this.estado,
      this.observacao,
      required this.telefone,
      required this.estadoCivil,
      required this.naturalidade,
      required this.nacionalidade,
      this.conjuge,
      this.numeroFilhos,
      required this.igrejaProcedencia});

  Map<String, dynamic> toMap() {
    final map = {
      'nome': nome,
      'nomePai': nomePai,
      'nomeMae': nomeMae,
      'dataNascimento': dataNascimento,
      'dataBatismo': dataBatismo,
      'membroDesde': membroDesde,
      'membroStatus': membroStatus,
      'cargo': cargo,
      'profissao': profissao,
      'endereco': endereco,
      'numeroCasa': numeroCasa,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'observacao': observacao,
      'telefone': telefone,
      'estadoCivil': estadoCivil,
      'naturalidade': naturalidade,
      'nacionalidade': nacionalidade,
      'conjuge': conjuge,
      'igrejaProcedencia': igrejaProcedencia,
    };
    return map;
  }

  factory MembroModel.fromMap(Map<String, dynamic> map) {
    return MembroModel(
      id: map['id'],
      nome: map['nome'],
      nomePai: map['nomePai'],
      nomeMae: map['nomeMae'],
      dataNascimento: map['dataNascimento'],
      dataBatismo: map['dataBatismo'],
      membroDesde: map['membroDesde'],
      membroStatus: map['membroStatus'],
      cargo: map['cargo'],
      profissao: map['profissao'],
      endereco: map['endereco'],
      numeroCasa: map['numeroCasa'],
      bairro: map['bairro'],
      cidade: map['cidade'],
      estado: map['estado'],
      observacao: map['observacao'],
      telefone: map['telefone'],
      estadoCivil: map['estadoCivil'],
      naturalidade: map['naturalidade'],
      nacionalidade: map['nascionalidade'],
      conjuge: map['conjuge'],
      numeroFilhos: map['numeroFilhos'],
      igrejaProcedencia: map['igrejaProcedencia'],
    );
  }

  @override
  String toString() {
    return 'MembroModel(id: $id, nome: $nome, nomePai: $nomePai, nomeMae: $nomeMae, dataNascimento: $dataNascimento, dataBatismo: $dataBatismo, membroDesde: $membroDesde, membroStatus: $membroStatus, cargo: $cargo, profissao: $profissao, endereco: $endereco, numeroCasa: $numeroCasa, bairro: $bairro, cidade: $cidade, estado: $estado, observacao: $observacao, telefone: $telefone, estadoCivil: $estadoCivil, naturalidade: $naturalidade, nacionalidade: $nacionalidade, conjuge: $conjuge, numeroFilhos: $numeroFilhos, igrejaProcedencia: $igrejaProcedencia)';
  }
}

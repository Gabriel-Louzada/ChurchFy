import 'package:churchfy/models/membro_model.dart';
import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/util/formatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AlterarCadastro extends StatefulWidget {
  final BuildContext membroContext;
  final MembroModel membro;

  const AlterarCadastro(
      {super.key, required this.membro, required this.membroContext});

  @override
  State<AlterarCadastro> createState() => _AlterarCadastroState();
}

class _AlterarCadastroState extends State<AlterarCadastro> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _nomePaiController = TextEditingController();
  TextEditingController _nomeMaeController = TextEditingController();
  TextEditingController _nascimentoController = TextEditingController();
  TextEditingController _batismoController = TextEditingController();
  TextEditingController _membroDesdeController = TextEditingController();
  TextEditingController _profissaoController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _numeroCasaController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _naturalidadeController = TextEditingController();
  TextEditingController _nacionalidadeController = TextEditingController();
  TextEditingController _conjugeController = TextEditingController();
  TextEditingController _numeroFilhosController = TextEditingController();
  TextEditingController _igrejaProcedenciaController = TextEditingController();
  TextEditingController _observacaoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<String> _optionsCargo = [
    'Bispo',
    'Pastor',
    'Evangelista',
    'Presbitero',
    'Missionario(a)',
    'Diacono',
    'Diaconiza',
    'Membro',
    'Congregado'
  ];

  final List<String> _optionsEstadoCivil = [
    'Casado(a)',
    'Solteiro(a)',
    'Divorciado(a)',
    'Viuvo(a)'
  ];

  String? _selectCargo;

  String? _selectEstadoCivil;

  bool validar(String? valor) {
    if (valor != null && valor.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.membro.nome);
    _nomePaiController = TextEditingController(text: widget.membro.nomePai);
    _nomeMaeController = TextEditingController(text: widget.membro.nomeMae);
    _nascimentoController =
        TextEditingController(text: widget.membro.dataNascimento);
    _batismoController = TextEditingController(text: widget.membro.dataBatismo);
    _membroDesdeController =
        TextEditingController(text: widget.membro.membroDesde);
    _profissaoController = TextEditingController(text: widget.membro.profissao);
    _enderecoController = TextEditingController(text: widget.membro.endereco);
    _numeroCasaController =
        TextEditingController(text: widget.membro.numeroCasa);
    _bairroController = TextEditingController(text: widget.membro.bairro);
    _cidadeController = TextEditingController(text: widget.membro.cidade);
    _estadoController = TextEditingController(text: widget.membro.estado);
    _telefoneController = TextEditingController(text: widget.membro.telefone);
    _naturalidadeController =
        TextEditingController(text: widget.membro.naturalidade);
    _nacionalidadeController =
        TextEditingController(text: widget.membro.nacionalidade);
    _conjugeController = TextEditingController(text: widget.membro.conjuge);
    _numeroFilhosController =
        TextEditingController(text: widget.membro.numeroFilhos.toString());
    _igrejaProcedenciaController =
        TextEditingController(text: widget.membro.igrejaProcedencia);
    _observacaoController =
        TextEditingController(text: widget.membro.observacao);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _nomePaiController.dispose();
    _nomeMaeController.dispose();
    _nascimentoController.dispose();
    _batismoController.dispose();
    _membroDesdeController.dispose();
    _profissaoController.dispose();
    _enderecoController.dispose();
    _numeroCasaController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _telefoneController.dispose();
    _naturalidadeController.dispose();
    _nacionalidadeController.dispose();
    _conjugeController.dispose();
    _numeroFilhosController.dispose();
    _igrejaProcedenciaController.dispose();
    _observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    _selectCargo = widget.membro.cargo;
    _selectEstadoCivil = widget.membro.estadoCivil;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Alterando o cadastro ${widget.membro.nome}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  //NOME MEMBRO
                  TextFormField(
                    maxLength: 50,
                    controller: _nomeController,
                    validator: (String? value) {
                      if (validar(value)) {
                        return "Insira o Nome";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text("Nome:"), border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  //DATA NASCIMENTO
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          maxLength: 10,
                          controller: _nascimentoController,
                          inputFormatters: [CustomDateFormatter()],
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o a Data de Nascimento";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Nascimento:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      //DATA DE BATISMO
                      Expanded(
                        child: TextFormField(
                          controller: _batismoController,
                          maxLength: 10,
                          inputFormatters: [CustomDateFormatter()],
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira a data de batismo";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Batismo:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      //MEMBRO DESDE
                      Expanded(
                        child: TextFormField(
                          controller: _membroDesdeController,
                          maxLength: 10,
                          inputFormatters: [CustomDateFormatter()],
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Membro Desde ?";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Membro Desde:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //CARGO
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectCargo,
                          hint: const Text('Cargos'),
                          items: _optionsCargo.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            _selectCargo = newValue;
                            //O VALOR SELECIONADO FICARÁ ARMAZENADO NO _SELECTCARGO
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Por Favor, Selecione o Cargo do membro';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            label: Text('Cargo do membro:'),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      //PROFISSÃO
                      Expanded(
                        child: TextFormField(
                          controller: _profissaoController,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira a Profissão";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Profissão:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //ENDEREÇO
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _enderecoController,
                          maxLength: 50,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Endereço";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Endereço:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      //NUMERO CASA
                      Expanded(
                        child: TextFormField(
                          controller: _numeroCasaController,
                          maxLength: 5,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Numero da Casa";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Numero da Casa:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      //BAIRRO
                      Expanded(
                        child: TextFormField(
                          controller: _bairroController,
                          maxLength: 50,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Bairro";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Bairro:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: size.width * 0.02),
                  //CIDADE
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _cidadeController,
                          maxLength: 50,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o nome da Cidade";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Cidade:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      //ESTADO
                      Expanded(
                        child: TextFormField(
                          controller: _estadoController,
                          maxLength: 50,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Estado";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Estado:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //TELEFONE
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _telefoneController,
                          inputFormatters: [CustomPhoneFormatter()],
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Numero de Telefone";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Telefone:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      //ESTADO CIVIL
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectEstadoCivil,
                          hint: const Text('Estado Civil'),
                          items: _optionsEstadoCivil.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            _selectEstadoCivil = newValue;
                            //O VALOR SELECIONADO FICARÁ ARMAZENADO NO _SELECTCARGO
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Por Favor, Selecione o Estado Civil do membro';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            label: Text('Estado Civil:'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //NATURALIDADE
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _naturalidadeController,
                          maxLength: 50,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira a Naturalidade";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Naturalidade:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      //NACIONALIDADE
                      Expanded(
                        child: TextFormField(
                          controller: _nacionalidadeController,
                          maxLength: 50,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira a Nacionalidade";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Nacionalidade:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //CONJUGE
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _conjugeController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                              label: Text("Conjuge:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      //NUMERO DE FILHOS
                      Expanded(
                        child: TextFormField(
                          controller: _numeroFilhosController,
                          maxLength: 2,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira a Quantidade de Filhos";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Numero de Filhos:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //IGREJA DE PROCEDENCIA
                  TextFormField(
                    controller: _igrejaProcedenciaController,
                    maxLength: 50,
                    validator: (String? value) {
                      if (validar(value)) {
                        return "Insira o Igreja de Procedencia";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text("Igreja de Procedencia:"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  //NOME PAI
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          maxLength: 50,
                          controller: _nomePaiController,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Nome do Pai";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Nome do Pai:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      //NOME DA MAE
                      Expanded(
                        child: TextFormField(
                          maxLength: 50,
                          controller: _nomeMaeController,
                          validator: (String? value) {
                            if (validar(value)) {
                              return "Insira o Nome da Mãe";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              label: Text("Nome da Mãe:"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //OBSERVAÇÃO
                  TextFormField(
                    controller: _observacaoController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                        label: Text("Observações:"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final nome = _nomeController.text.trim();
                      final nacimento = _nascimentoController.text.trim();
                      final batismo = _batismoController.text.trim();
                      final membroDesde = _membroDesdeController.text.trim();
                      final cargo = _selectCargo!;
                      final profissao = _profissaoController.text.trim();
                      final endereco = _enderecoController.text.trim();
                      final numeroCasa = _numeroCasaController.text.trim();
                      final bairro = _bairroController.text.trim();
                      final cidade = _cidadeController.text.trim();
                      final estado = _estadoController.text.trim();
                      final telefone = _telefoneController.text.trim();
                      final estadoCivil = _selectEstadoCivil!;
                      final naturalidade = _naturalidadeController.text.trim();
                      final nacionalidade =
                          _nacionalidadeController.text.trim();
                      final conjuge = _conjugeController.text.trim();
                      final numeroFilhos = _numeroFilhosController.text.trim();
                      final igrejaProcedencia =
                          _igrejaProcedenciaController.text.trim();
                      final nomePai = _nomePaiController.text.trim();
                      final nomeMae = _nomeMaeController.text.trim();
                      final observacao = _observacaoController.text.trim();

                      MembroModel membro = MembroModel(
                          id: widget.membro.id,
                          nome: nome,
                          nomePai: nomePai,
                          nomeMae: nomeMae,
                          dataNascimento: nacimento,
                          dataBatismo: batismo,
                          membroDesde: membroDesde,
                          cargo: cargo,
                          profissao: profissao,
                          endereco: endereco,
                          numeroCasa: numeroCasa,
                          bairro: bairro,
                          cidade: cidade,
                          estado: estado,
                          telefone: telefone,
                          estadoCivil: estadoCivil,
                          naturalidade: naturalidade,
                          conjuge: conjuge,
                          nacionalidade: nacionalidade,
                          numeroFilhos: int.parse(numeroFilhos),
                          observacao: observacao,
                          igrejaProcedencia: igrejaProcedencia);

                      Provider.of<MembroProvider>(context, listen: false)
                          .atualizarMembro(membro);

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Alterar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

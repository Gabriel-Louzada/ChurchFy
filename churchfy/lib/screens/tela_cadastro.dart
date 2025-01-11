import 'package:churchfy/models/membro_model.dart';
import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/util/formatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  bool isAtivo = true;
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _nomePaiController = TextEditingController();
  final TextEditingController _nomeMaeController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();
  final TextEditingController _batismoController = TextEditingController();
  final TextEditingController _membroDesdeController = TextEditingController();
  final TextEditingController _profissaoController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _numeroCasaController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _naturalidadeController = TextEditingController();
  final TextEditingController _nacionalidadeController =
      TextEditingController();
  final TextEditingController _conjugeController = TextEditingController();
  final TextEditingController _numeroFilhosController = TextEditingController();
  final TextEditingController _igrejaProcedenciaController =
      TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();

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

  String validaAtivo(bool isAtivo) {
    if (isAtivo) {
      return "ativo";
    } else {
      return 'inativo';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    const WidgetStateProperty<Icon> thumbIcon =
        WidgetStateProperty<Icon>.fromMap(
      <WidgetStatesConstraint, Icon>{
        WidgetState.selected: Icon(Icons.check),
        WidgetState.any: Icon(Icons.close),
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Membro Ativo",
                            style: TextStyle(fontSize: 20),
                          ),
                          Switch(
                              thumbIcon: thumbIcon,
                              value: isAtivo,
                              onChanged: (bool value) {
                                setState(() {
                                  isAtivo = value;
                                });
                              }),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final nome = _nomeController.text.trim();
                          final nacimento = _nascimentoController.text.trim();
                          final batismo = _batismoController.text.trim();
                          final membroDesde =
                              _membroDesdeController.text.trim();
                          final cargo = _selectCargo!;
                          final ativo = validaAtivo(isAtivo);
                          final profissao = _profissaoController.text.trim();
                          final endereco = _enderecoController.text.trim();
                          final numeroCasa = _numeroCasaController.text.trim();
                          final bairro = _bairroController.text.trim();
                          final cidade = _cidadeController.text.trim();
                          final estado = _estadoController.text.trim();
                          final telefone = _telefoneController.text.trim();
                          final estadoCivil = _selectEstadoCivil!;
                          final naturalidade =
                              _naturalidadeController.text.trim();
                          final nacionalidade =
                              _nacionalidadeController.text.trim();
                          final conjuge = _conjugeController.text.trim();
                          final numeroFilhos =
                              _numeroFilhosController.text.trim();
                          final igrejaProcedencia =
                              _igrejaProcedenciaController.text.trim();
                          final nomePai = _nomePaiController.text.trim();
                          final nomeMae = _nomeMaeController.text.trim();
                          final observacao = _observacaoController.text.trim();

                          MembroModel membro = MembroModel(
                              nome: nome,
                              nomePai: nomePai,
                              nomeMae: nomeMae,
                              dataNascimento: nacimento,
                              dataBatismo: batismo,
                              membroDesde: membroDesde,
                              membroStatus: ativo,
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
                              .adicionarMembro(membro);

                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vollmed/app/core/utils/text_styles.dart';
import 'package:vollmed/app/model/medico_model.dart';
import 'package:vollmed/app/viewmodel/medicos_view_model.dart';

class MedicosPage extends StatefulWidget {
  const MedicosPage({super.key});

  @override
  State<MedicosPage> createState() => _MedicosPageState();
}

class _MedicosPageState extends State<MedicosPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    if (context.read<MedicosViewModel>().medicos.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<MedicosViewModel>(context, listen: false).getUsers();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Médicos"),
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
          child: Column(
            children: [
              SafeArea(
                  child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                    hintText: "Pesquisar",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF90989F)),
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onChanged: (value) {
                  print(value);
                },
              )),
              Consumer<MedicosViewModel>(builder: (context, model, child) {
                if (model.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (model.medicos.isEmpty) {
                  return const Center(child: Text("Nenhum médico cadastrado"));
                }

                Map<String, List<Medico>> medicosAgrupados = {};
                for (var medico in model.medicos) {
                  String letra = medico.nome[0].toUpperCase();
                  medicosAgrupados.putIfAbsent(letra, () => []).add(medico);
                }
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: medicosAgrupados.length,
                    itemBuilder: (context, index) {
                      String letra = medicosAgrupados.keys.elementAt(index);
                      List<Medico> listaMedicos = medicosAgrupados[letra]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Text(
                                    letra,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Image.asset(
                                    "lib/app/shared/assets/imgs/logo_no_word.png",
                                  ),
                                ],
                              )),
                          ...listaMedicos
                              .map((medico) => MedicoTile(medico: medico))
                              .toList(),
                        ],
                      );
                    },
                  ),
                );
              }),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Column(
            children: [
              Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.white.withOpacity(0),
                      Colors.grey.withOpacity(0.5)
                    ])),
              ),
              SizedBox(
                height: 88,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Cadastrar novo perfil")),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class MedicoTile extends StatelessWidget {
  final Medico medico;

  const MedicoTile({super.key, required this.medico});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          shape: Border.all(color: Colors.transparent),
          expansionAnimationStyle: AnimationStyle(curve: Curves.easeInOut, duration: Duration(milliseconds: 500)),
          title: Text(medico.nome),
          subtitle: Text("${medico.especialidade} | CRM ${medico.crm}"),
          children: [
            ListTile(
              title: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    medico.email ?? "Email Não informado",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "${medico.endereco.logradouro}, ${medico.endereco.numero} - "
                    "${medico.endereco.cidade}/${medico.endereco.uf}\n"
                    "CEP: ${medico.endereco.cep}",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: TextStyles.caption.merge(TextStyle(color: Color(0xFF0B3B60))),  
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF0B3B60)),
                              borderRadius: BorderRadius.circular(10),
                          ),),
                            onPressed: () {},
                            child: const Text("Editar")),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: TextStyles.caption.merge(TextStyle(color: Color(0xFF0B3B60))),  
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF0B3B60)),
                              borderRadius: BorderRadius.circular(10),
                          ),),
                            onPressed: () {},
                            child: const Text("Desativar perfil", textAlign: TextAlign.center,)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}

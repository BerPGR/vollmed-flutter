import 'package:flutter/material.dart';
import 'package:vollmed/app/model/medico_model.dart';

class MedicosPage extends StatefulWidget {
  const MedicosPage({super.key});

  @override
  State<MedicosPage> createState() => _MedicosPageState();
}

class _MedicosPageState extends State<MedicosPage> {
  final List<Medico> medicos = [
    Medico(
        nome: "Adriano Moreira Sales",
        especialidade: "Ginecologista",
        crm: "15.879-SP"),
    Medico(
        nome: "Amanda Siqueira",
        especialidade: "Oftalmologista",
        crm: "65.789-SP"),
    Medico(
        nome: "Antônio Santana",
        especialidade: "Clínico Geral",
        crm: "37.124-SP"),
    Medico(
        nome: "Barbara Aparecida", especialidade: "Pediatra", crm: "15.879-SP"),
    Medico(
        nome: "Bernardo Oliveira", especialidade: "Pediatra", crm: "15.879-SP"),
    Medico(
      nome: "Brenda de Almeida",
      especialidade: "Ortopedista",
      crm: "47.889-PR",
      email: "brenda.almeida@med.com.br",
      telefone: "(51) 99999-8888",
      endereco: "Av. das Graças Altas, 633 - Curitiba/PR\nCEP: 66.777-100",
    ),
  ];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    medicos.sort((a, b) => a.nome.compareTo(b.nome));

    Map<String, List<Medico>> medicosAgrupados = {};
    for (var medico in medicos) {
      String letra = medico.nome[0].toUpperCase();
      medicosAgrupados.putIfAbsent(letra, () => []).add(medico);
    }

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
              Expanded(
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
                                Image.asset("lib/app/shared/assets/imgs/logo_no_word.png",),
                              ],
                            )),
                        ...listaMedicos
                            .map((medico) => MedicoTile(medico: medico))
                            .toList(),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 60,)
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
      children: [
        ListTile(
        
          title: Text(medico.nome,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${medico.especialidade} | CRM ${medico.crm}"),
              if (medico.email != null)
                Text(medico.email!, style: TextStyle(color: Colors.grey[700])),
              if (medico.telefone != null)
                Text(medico.telefone!, style: TextStyle(color: Colors.grey[700])),
              if (medico.endereco != null)
                Text(medico.endereco!, style: TextStyle(color: Colors.grey[700])),
            ],
          ),
          trailing: const Icon(Icons.arrow_drop_down),
        ),
        const Divider()
      ],
    );
  }
}

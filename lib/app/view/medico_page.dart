import 'package:flutter/material.dart';

class MedicosPage extends StatefulWidget {
  const MedicosPage({super.key});

  @override
  State<MedicosPage> createState() => _MedicosPageState();
}

class _MedicosPageState extends State<MedicosPage> {
  final TextEditingController _searchController = TextEditingController();

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(children: [
              SafeArea(child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Pesquisar",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF90989F)),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )
                ),
                onChanged: (value) {
                  print(value);
                },
              ))
            ],),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
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
                  ])
                ),
              ),
              SizedBox(
                height: 88,
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text("Cadastrar novo perfil")),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

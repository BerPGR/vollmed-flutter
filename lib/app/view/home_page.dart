import 'package:flutter/material.dart';
import 'package:vollmed/app/core/utils/text_styles.dart';
import 'package:vollmed/app/shared/widgets/home_choice_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final buttonOptions = [
    {
      "title": "Médicos(as)",
      "image": "lib/app/shared/assets/imgs/img_doctor.png",
      "page": "/medicos",
    },
    {
      "title": "Pacientes",
      "image": "lib/app/shared/assets/imgs/img_paciente.png",
      "page": "/paciente",
    },
    {
      "title": "Consultas",
      "image": "lib/app/shared/assets/imgs/img_calendario.png",
      "page": "/consulta",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SafeArea(
                child: Image.asset(
                  "lib/app/shared/assets/imgs/Logo.png",
                  fit: BoxFit.contain,
                  width: 137,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Gerenciando sua clínica",
                style:
                    TextStyles.pBold.merge(TextStyle(color: Color(0xFF0B3B60))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42.0),
              child: Text(
                "Escolha qual seção deseja iniciar:",
                style: TextStyles.p,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      final option = buttonOptions[index];
                      return HomeChoiceButton(
                        title: option["title"] as String, 
                        image: option["image"] as String,
                      );
                    },
                    itemCount: buttonOptions.length))
          ],
        ),
      ),
    );
  }
}

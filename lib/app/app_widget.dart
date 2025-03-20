import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vollmed/app/view/consulta_page.dart';
import 'package:vollmed/app/view/home_page.dart';
import 'package:vollmed/app/view/medico_page.dart';
import 'package:vollmed/app/view/pacientes_page.dart';
import 'package:vollmed/app/viewmodel/medicos_view_model.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF00213D),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MedicosViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFF0B3B60),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        initialRoute: "/",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/":
              return MaterialPageRoute(builder: (_) => HomePage());
            case "/medicos":
              return MaterialPageRoute(builder: (_) => MedicosPage());
            case "/paciente":
              return MaterialPageRoute(builder: (_) => PacientesPage());
            case "/consulta":
              return MaterialPageRoute(builder: (_) => ConsultasPage());
          }
        },
      ),
    );
  }
}
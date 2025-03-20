import 'package:flutter/material.dart';
import 'package:vollmed/app/model/medico_model.dart';
import 'package:vollmed/app/service/api_service.dart';

class MedicosViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Medico> medicos = [];
  bool isLoading = false;

  Future<void> getUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.fetchMedicos();
      medicos = response.map((medico) => Medico.fromJson(medico)).toList();
      medicos.sort((a, b) => a.nome.compareTo(b.nome));
    } catch (e) {
      print(e);
      medicos = [];
    }

    print(medicos);
    isLoading = false;
    notifyListeners();
  }
}

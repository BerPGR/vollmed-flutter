import 'package:dio/dio.dart';
import 'package:vollmed/app/core/constants/constants.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Map<String, dynamic>>> fetchMedicos() async {
    try {
      final response = await dio.get('$apiUrl/medico', options: Options(headers: {"Authorization": "Bearer $token"}));
      
      if (response.statusCode == 200) {
        final data = response.data;
        print(data is List);
        if (data is List) {
          return List<Map<String, dynamic>>.from(data);
        }
      }
      return response.data;
    } catch (e) {
      return [];
    }
  } 
}
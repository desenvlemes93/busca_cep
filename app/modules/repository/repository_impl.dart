import 'dart:convert';

import 'package:busca_cep/app/modules/model/endereco.dart';
import 'package:http/http.dart' as http;

import './repository.dart';

class RepositoryImpl implements Repository {
  @override
  Future<Endereco> buscarCep(String cep) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/${cep}/json/'));

    final responseData = jsonDecode(response.body);

    print(responseData);
    final da = Endereco.fromMap(responseData);
    return da;
  }
}

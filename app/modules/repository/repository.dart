import 'package:busca_cep/app/modules/model/endereco.dart';

abstract class Repository {
  Future<Endereco> buscarCep(String cep);
}

import 'package:busca_cep/app/modules/model/endereco.dart';
import 'package:busca_cep/app/modules/repository/repository.dart';
import 'package:busca_cep/app/modules/repository/repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends ChangeNotifier {
  var endereco2 = Endereco(
    cep: '',
    logradouro: '',
    complemento: '',
    bairro: '',
    localidade: '',
    uf: '',
    ibge: '',
    gia: '',
    ddd: '',
    siafi: '',
  ).obs;

  Future<void> buscarCep(String cep) async {
    var ender = await Get.find<Repository>().buscarCep(cep);

    armazenarDados(ender);
  }

  Future<void> armazenarDados(Endereco end) async {
    endereco2.value.logradouro =
        end.logradouro.isEmpty ? 'Não Encontrado' : end.logradouro;
    endereco2.value.bairro =
        endereco2.value.bairro.isEmpty ? 'Não Encontrado' : end.bairro;
    endereco2.value.cep =
        endereco2.value.cep.isEmpty ? 'Não Encontrado' : end.cep;
    endereco2.value.complemento = end.complemento;
    endereco2.value.ddd =
        endereco2.value.ddd.isEmpty ? 'Não Encontrado' : end.ddd;
    endereco2.value.gia = endereco2.value.gia = end.gia;
    endereco2.value.ibge =
        endereco2.value.ibge.isEmpty ? 'Não Encontrado' : end.ibge;
    endereco2.value.uf = endereco2.value.uf.isEmpty ? 'Não Encontrado' : end.uf;
    endereco2.value.localidade =
        endereco2.value.localidade.isEmpty ? 'Não encontado' : end.localidade;
  }
}

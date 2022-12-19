import 'package:busca_cep/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cepEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _cepEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enderecoFinal = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cepEC,
                  decoration: const InputDecoration(labelText: 'Informe o Cep'),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await enderecoFinal.buscarCep(_cepEC.text);
                      setState(() {});
                    },
                    child: const Text('Buscar Cep'),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(top: 20, right: 150),
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 60,
                      children: [
                        Text(
                            'Endereço: ${enderecoFinal.endereco2.value.logradouro} '),
                        Text(
                            'Cidade: ${enderecoFinal.endereco2.value.localidade}'),
                        Text('Cep :${enderecoFinal.endereco2.value.cep}'),
                        Text('Ibge: ${enderecoFinal.endereco2.value.ibge}'),
                        Text('Estado:${enderecoFinal.endereco2.value.uf}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    'http://i.pinimg.com/originals/24/75/9f/24759fca9a3d3b7ca2c06ad9228ce278.jpg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

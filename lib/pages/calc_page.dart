import 'package:calculadora_imc/model/user.dart';
import 'package:calculadora_imc/repository/user_repository.dart';
import 'package:calculadora_imc/utils/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/card_page.dart';
import '../widgets/text_field_page.dart';

class CalcPage extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const CalcPage({
    super.key,
    this.formKey,
  });

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var lsUser = <User>[];

  late UserRepository userRepository;

  var user = User.vazio();

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  void carregarDados() async {
    userRepository = await UserRepository.load();
    lsUser = userRepository.obterDados();
    heightController.text = lsUser == [] || lsUser.isEmpty
        ? ''
        : lsUser.last.height == 0.0
            ? ''
            : lsUser.last.height.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      child: Column(
        children: [
          Expanded(child: Container()),
          const CardPage(texto: "Calcula IMC"),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldPage(
              controller: weightController,
              texto: "Peso",
              validator: (value) {
                if (Utils.validatorValue(value)) {
                  return "Informe um peso";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldPage(
              controller: heightController,
              texto: "Altura",
              validator: (value) {
                if (Utils.validatorValue(value)) {
                  return "Informe uma altura";
                }
                return null;
              },
            ),
          ),
          Expanded(child: Container()),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey),
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                if (widget.formKey!.currentState!.validate()) {
                  FocusManager.instance.primaryFocus?.unfocus();

                  user.height = double.parse(heightController.text);
                  user.weigth = double.parse(weightController.text);
                  user.calculaImc(user.weigth, user.height);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'IMC ${user.imc.toStringAsFixed(2)} - ${Utils.statusImc(user.imc)}'),
                    ),
                  );

                  userRepository.salvar(user);
                  weightController.clear();
                }
              },
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

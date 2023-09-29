import 'package:calculadora_imc/model/user.dart';
import 'package:calculadora_imc/repository/user_repository.dart';
import 'package:calculadora_imc/utils/utils.dart';
import 'package:calculadora_imc/widgets/list_imc_page.dart';
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
  var imc = 0.0;
  var userRepository = UserRepository();
  var lsImc = <User>[];

  @override
  void initState() {
    returnListImc();
    super.initState();
  }

  void returnListImc() async {
    lsImc = await userRepository.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      child: Column(
        children: [
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
                  var user = User(double.parse(weightController.text),
                      double.parse(heightController.text));
                  imc = user.calculaImc(user.weigth, user.height);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'IMC ${imc.toStringAsFixed(2)} - ${Utils.statusImc(imc)}'),
                    ),
                  );
                  await userRepository.adicionar(user);
                  setState(() {});
                }
              },
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(child: Container()),
          Expanded(
            flex: 3,
            child: ListImcPage(lsImc: lsImc),
          ),
        ],
      ),
    );
  }
}

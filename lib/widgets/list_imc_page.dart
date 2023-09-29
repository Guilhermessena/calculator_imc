import 'package:calculadora_imc/model/user.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ListImcPage extends StatefulWidget {
  final List<User> lsImc;
  const ListImcPage({super.key, required this.lsImc,});

  @override
  State<ListImcPage> createState() => _ListImcPageState();
}

class _ListImcPageState extends State<ListImcPage> {
  double imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lsImc.length,
      itemBuilder: (context, index) {
        var imcUser = widget.lsImc[index];
        imc = imcUser.calculaImc(imcUser.weigth, imcUser.height);
        return ListTile(
          title: Text(imcUser.id),
          trailing: Text(
              "${imcUser.calculaImc(imcUser.weigth, imcUser.height).toStringAsFixed(2)} - ${Utils.statusImc(imc)}"),
        );
      },
    );
  }
}

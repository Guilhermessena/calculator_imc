import 'package:calculadora_imc/model/user.dart';
import 'package:calculadora_imc/repository/user_repository.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ListImcPage extends StatefulWidget {
  const ListImcPage({
    super.key,
  });

  @override
  State<ListImcPage> createState() => _ListImcPageState();
}

class _ListImcPageState extends State<ListImcPage> {
  late UserRepository userRepository;

  var _users = <User>[];

  @override
  void initState() {
    obterImcs();
    super.initState();
  }

  void obterImcs() async {
    userRepository = await UserRepository.load();
    _users = userRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      child: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          var imcUser = _users[index];
          return ListTile(
            title: Text(imcUser.id),
            trailing: Text(
                "${imcUser.imc.toStringAsFixed(2)} - ${Utils.statusImc(imcUser.imc)}"),
          );
        },
      ),
    );
  }
}

import 'package:calculadora_imc/pages/calc_page.dart';
import 'package:calculadora_imc/widgets/list_imc_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: PageView(children: [CalcPage(formKey: _formKey), const ListImcPage()]),
        ),
      ),
    );
  }
}

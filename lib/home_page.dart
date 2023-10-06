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
  var pageController = PageController();
  var posPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView(
                    controller: pageController,
                    onPageChanged: (value) => setState(() {
                          posPage = value;
                        }),
                    children: [
                      CalcPage(formKey: _formKey),
                      const ListImcPage()
                    ]),
              ),
              BottomNavigationBar(
                onTap: (value) => pageController.jumpToPage(value),
                currentIndex: posPage,
                items: const [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "List", icon: Icon(Icons.list)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

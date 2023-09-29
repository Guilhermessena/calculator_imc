import 'package:calculadora_imc/model/user.dart';

class UserRepository {
  List<User> lsImc = [];

  Future<List<User>> listar() async {
    await Future.delayed(const Duration(seconds: 1));
    return lsImc;
  }

  Future<void> adicionar(User user) async {
    await Future.delayed(const Duration(seconds: 1));
    lsImc.add(user);
  }
}

import 'package:calculadora_imc/model/user.dart';
import 'package:hive/hive.dart';

enum STORAGE_CHAVES {
  CHAVE_USER,
}

class UserRepository {
  var userRepoList = <User>[];
  static late Box _box;

  UserRepository._load();

  static Future<UserRepository> load() async {
    if (Hive.isBoxOpen(STORAGE_CHAVES.CHAVE_USER.toString())) {
      _box = Hive.box(STORAGE_CHAVES.CHAVE_USER.toString());
    } else {
      _box = await Hive.openBox(STORAGE_CHAVES.CHAVE_USER.toString());
    }
    return UserRepository._load();
  }

  salvar(User user) {
    _box.add(user);
  }

  List<User> obterDados() {
    return _box.values.cast<User>().toList();
  }
}

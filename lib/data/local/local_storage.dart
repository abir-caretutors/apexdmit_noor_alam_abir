import 'package:hive/hive.dart';


class SetUserLocalStorageV2 {
  final box = Hive.box(UserStorageKey.mainBox);
  storingDataInBox(String key, dynamic v) {
    try {
      box.put(key, v);
    } catch (e, err) {
      print("Got an error ==> $e");
      print('Error stack => $err');
    }
  }

  void isLogin(bool value) => storingDataInBox(UserStorageKey.isLogin, value);

  void token(String value) => storingDataInBox(UserStorageKey.token, value);

  void clearUser() {
    box.delete(UserStorageKey.isLogin);
    box.delete(UserStorageKey.token);
  }

  void clear() => box.clear();
}

class GetUserLocalStorageV2 {
  final box = Hive.box(UserStorageKey.mainBox);
  bool? isLogin() => box.get(UserStorageKey.isLogin);
  String? token() => box.get(UserStorageKey.token);

}

class UserStorageKey {
  static String get mainBox => "apexDMIT";

  static String get isLogin => "isLogin";

  static String get token => "token";


}

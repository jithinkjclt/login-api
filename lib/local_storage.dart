import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  getApi(String token) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("token", token);
  }

   setApi() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getString("token");
  }
}

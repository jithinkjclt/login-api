import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  getApi(String datatoken) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("token", datatoken);
  }

   setApi() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getString("token");
  }
}

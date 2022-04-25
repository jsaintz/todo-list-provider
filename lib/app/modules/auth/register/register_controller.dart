import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends ChangeNotifier {
  final UserService _userService;

  RegisterController({required UserService userService})
      : _userService = userService;

  void registerUser(String email, String password) async {
    final user = await _userService.register(email, password);
    if (user != null) {
    } else {}
  }
}

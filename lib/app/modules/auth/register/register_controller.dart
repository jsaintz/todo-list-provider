import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends ChangeNotifier {
  final UserService _userService;
  String? error;
  bool success = false;

  RegisterController({required UserService userService})
      : _userService = userService;

  void registerUser(String email, String password) async {
    try {
      error = null;
      success = false;
      notifyListeners();

      final user = await _userService.register(email, password);
      if (user != null) {
        success = true;
      } else {
        error = 'Erro ao Registrar usuário';
      }
      notifyListeners();
    } on AuthException catch (e) {
      error = e.message;
    } finally {
      notifyListeners();
    }
  }
}

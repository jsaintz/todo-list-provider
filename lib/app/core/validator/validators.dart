import 'package:flutter/widgets.dart';

class Validators {
  Validators._();

  static FormFieldValidator compare(TextEditingController? valueEC, String message) {
    // ignore: body_might_complete_normally_nullable
    return (value) {
      final valueCompare = valueEC?.text ?? '';
      if (value == null || (value != null && value != valueCompare)) {
        return message;
      }
    };
  }
}

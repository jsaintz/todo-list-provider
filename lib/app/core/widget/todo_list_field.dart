import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVn;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  TodoListField({
    Key? key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : assert(obscureText == true ? suffixIconButton == null : true, ''),
        obscureTextVn = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVn,
      builder: (_, obscureTextValue, child) => TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.red),
          ),
          isDense: true,
          suffixIcon: suffixIconButton ??
              (obscureText == true
                  ? IconButton(
                      onPressed: () {
                        obscureTextVn.value = !obscureTextValue;
                      },
                      icon: Icon(
                        !obscureTextValue
                            ? TodoListIcons.eye_slash
                            : TodoListIcons.eye,
                        size: 15,
                      ),
                    )
                  : null),
        ),
        obscureText: obscureTextValue,
      ),
    );
  }
}

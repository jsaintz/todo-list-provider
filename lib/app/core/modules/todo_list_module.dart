import 'package:flutter/cupertino.dart';
import 'package:provider/single_child_widget.dart';

abstract class TodoListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  TodoListModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return {};
  }
}

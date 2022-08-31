import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class HomeDrawer extends StatelessWidget {
  final nameValueNotifier = ValueNotifier<String>('');
  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: context.primaryColor.withAlpha(70)),
            child: Row(
              children: [
                Selector<AuthProvider, String>(selector: (context, authProvider) {
                  return authProvider.user?.photoURL ??
                      'https://myloview.com.br/quadro-user-icon-user-sign-and-symbol-vector-no-C50B417';
                }, builder: (_, value, __) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(value),
                    radius: 30,
                  );
                }),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String>(selector: (context, authProvider) {
                      return authProvider.user?.displayName ?? 'Não Informado';
                    }, builder: (_, value, __) {
                      return Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Alterar Nome'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Alterar Nome'),
                    content: TextField(
                      onChanged: (value) => nameValueNotifier.value = value,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        child: const Text('Alterar'),
                        onPressed: () async {
                          final namevalue = nameValueNotifier.value;
                          if (namevalue.isEmpty) {
                            Messages.of(context).showError('Nome Obrigatório');
                          } else {
                            Loader.show(context);
                            await context.read<UserService>().updateDisplayName(namevalue);
                            Loader.hide();
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () => context.read<AuthProvider>().logout(),
          )
        ],
      ),
    );
  }
}

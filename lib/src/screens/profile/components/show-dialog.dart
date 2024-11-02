import 'package:flutter/material.dart';
import 'package:quiz/src/screens/initial/initial_screen.dart';
import 'package:quiz/src/services/auth_service.dart';

class Utils {
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                'Você tem certeza que quer excluir permanentemente a sua conta?'),
            content: Text(
                "Ao clicar em 'Deletar conta' você estará excluindo permanentemente a sua conta e não poderá recuperá-la, apenas criar uma nova."),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String userEmail = AuthService().getCurrentUser()?.email ?? "";
                  await AuthService().deleteUser(userEmail);
                  Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FirstScreen()),
                              (route) => false);
                  
                  

                },
                child: const Text('Deletar Conta'),
              ),
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final isCguChecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 8,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
                autofillHints: [AutofillHints.email],
                validator: (text) {
                  if (text?.isNotEmpty == true && text?.contains('@') == true) {
                    return null;
                  } else {
                    return "Email invalide";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Mot de passe"),
                obscureText: true,
                controller: pwdController,
                autofillHints: [AutofillHints.password],
                validator: (text) {
                  if (text?.isNotEmpty == true) {
                    return null;
                  } else {
                    return "Mot de passe vide";
                  }
                },
              ),
              SizedBox(height: 32),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true &&
                        isCguChecked.value == true) {
                      post(
                        Uri.parse("https://post.com"),
                        body: {
                          "email": emailController.text,
                          "password": pwdController.text,
                        },
                      ).then((val) {});
                      context.go('/');
                    }
                  },
                  child: Text("S'inscrire"),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isCguChecked.value,
                    onChanged: (val) {
                      setState(() {
                        isCguChecked.value = val == true;
                      });
                    },
                    semanticLabel: "J'accepte les CGU",
                  ),
                  Text("J'accepte les CGUs"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

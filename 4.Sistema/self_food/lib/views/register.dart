import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_food/controllers/user_manager.dart';
import 'package:self_food/models/users/user_store.dart';
import 'package:self_food/views/menu_adm.dart';
import 'package:self_food/views/login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  get sd => null;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 0, 24),
        toolbarHeight: 125,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/selfFood2.jpeg',
              fit: BoxFit.cover,
              height: 100,
            ),
          ],
        ),
      ),
      body: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Cadastro',
                        textScaleFactor: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: TextFormField(
                        controller: controllerName,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Digite seu nome:',
                          fillColor: Colors.grey[400],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: TextFormField(
                        controller: controllerEmail,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Digite seu email:',
                          fillColor: Colors.grey[400],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: TextFormField(
                        controller: controllerPassword,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Digite sua senha:',
                          fillColor: Colors.grey[400],
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: TextFormField(
                          controller: controllerConfirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirme sua senha:',
                            fillColor: Colors.grey[400],
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),     
                          ),
                          obscureText: true,
                        ),
                      ),
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                      child: Container(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserManager>().signUp(
                                user: UserStore(
                                  email: controllerEmail.text,
                                  password: controllerPassword.text,
                                  name: controllerName.text,
                                ),
                                onSuccess: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MenuAdm()),
                                    (Route<dynamic> route) => false,
                                  );
                                });
                          },
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('Cadastrar'),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 208, 0, 24),
                            elevation: 10,
                            shadowColor: Color.fromARGB(255, 208, 0, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Já possui cadastro?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => Login()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          'Fazer Login',
                          style: TextStyle(color: Color.fromARGB(255, 208, 0, 24)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

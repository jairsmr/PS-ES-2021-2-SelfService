import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_food/controllers/user_manager.dart';
import 'package:self_food/models/users/user_store.dart';
import 'package:self_food/views/register.dart';
import 'package:self_food/views/menu.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get sd => null;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

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
          return Container(
              padding: EdgeInsets.only(bottom: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Text(
                            'Login',
                            textScaleFactor: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          child: TextFormField(
                            controller: controllerEmail,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.grey[400],
                              labelText: 'Email:',
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: controllerPassword,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Senha:',
                              fillColor: Colors.grey[400],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                          child: Container(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<UserManager>().signIn(
                                  user: UserStore(
                                    email: controllerEmail.text,
                                    password: controllerPassword.text,
                                  ),
                                  onSuccess: (){
                                    Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Menu()),
                                    (Route<dynamic> route) => false);
                                  }
                                );
                                
                              },
                              child:userManager.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text('Entrar'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red[900],
                                elevation: 10,
                                shadowColor: Colors.red[900],
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
                          Text('Não possui cadastro?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (_) => Register()),
                                  (Route<dynamic> route) => false);
                            },
                            child: Text(
                              'Cadastrar-se',
                              style: TextStyle(color: Colors.red[900]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:self_food/views/cadastro.dart';
import 'package:self_food/views/cardapio.dart';

class Login extends StatelessWidget {
  get sd => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
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
      body: Container(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Expanded(
              child: Column(
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
                          Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Cardapio()),
                        (Route<dynamic> route) => false);
                        },
                        child: Text('Entrar'),
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
            ),
            Column(
              children: [
                Text('Não possui cadastro?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Cadastro()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Cadastrar-se',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

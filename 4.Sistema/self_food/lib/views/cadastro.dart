import 'package:flutter/material.dart';
import 'package:self_food/views/cardapio_adm.dart';
import 'package:self_food/views/login.dart';

class Cadastro extends StatelessWidget {
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
      body: Column(
        children: [
          Expanded(
            child: Column(
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
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Digite sua senha:',
                  fillColor: Colors.grey[400],
                  filled: true,
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Material(
                elevation: 20.0,
                shadowColor: Colors.black,
                child: TextFormField(
                  
                  decoration: InputDecoration(
                    labelText: 'Confirme sua senha:',
                    fillColor: Colors.grey[400],
                    filled: true,
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  obscureText: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => CardapioAdm()),
                  (Route<dynamic> route) => false,
                  );
                  },
                  child: Text('Cadastrar'),
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
          Padding(
            padding: const EdgeInsets.only(bottom:16.0),
            child: Column(
              children: [
                Text('Já possui cadastro?'),
            TextButton(
              onPressed: () {
                 Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => Login()),
                  (Route<dynamic> route) => false
                );
              },
              child: Text(
                'Fazer Login',
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:self_food/views/cardapio_adm.dart';
import 'package:self_food/views/carrinho.dart';

class Pedidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        toolbarHeight: 75,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image/selfFood1.jpeg',
              fit: BoxFit.cover,
              height: 75,
            ),
            Expanded(child: Row()),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => CardapioAdm()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(Icons.menu_book)),
              ],
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:self_food/views/carrinho.dart';
import 'package:self_food/views/pedidos.dart';

class CardapioAdm extends StatelessWidget {
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
                          MaterialPageRoute(builder: (_) => Pedidos()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(Icons.format_list_numbered_rounded)),
              ],
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}

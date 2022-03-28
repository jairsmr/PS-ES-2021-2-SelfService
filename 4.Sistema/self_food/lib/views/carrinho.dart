import 'package:flutter/material.dart';

class Carrinho extends StatelessWidget {
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
                      return;
                    },
                    icon: Icon(Icons.shopping_cart)),
              ],
            )
              
          ],
        ),
      ),
      body: Container(),
    );
  }
}

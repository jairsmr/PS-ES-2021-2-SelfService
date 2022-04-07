import 'package:flutter/material.dart';
import 'package:self_food/models/item_menu.dart';

class ShoppingTile extends StatefulWidget {
  final ItemMenu itemMenu;
  ShoppingTile({required this.itemMenu});
  @override
  State<ShoppingTile> createState() => _ShoppingTileState();
}

class _ShoppingTileState extends State<ShoppingTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          
          child: Image.network(
            widget.itemMenu.imagem!,
            fit: BoxFit.fill,
            width: 200,
            height: 100,
          ),
        ),
        Container(
          width: 200,
          height: 30,
          alignment: Alignment.center,
          color: Color.fromARGB(255, 208, 0, 24),
          child: Text(
            widget.itemMenu.nome!,
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

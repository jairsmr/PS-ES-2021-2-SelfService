import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:self_food/models/item_menu.dart';

class MenuTiles extends StatefulWidget {
  final ItemMenu itemMenu;
  MenuTiles({required this.itemMenu});
  @override
  State<MenuTiles> createState() => _MenuTilesState();
}

class _MenuTilesState extends State<MenuTiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: (() {
                
              }),
              child: Container(
                alignment: Alignment.topCenter,
                
                child: Image.network(
                  widget.itemMenu.imagem!,
                  fit: BoxFit.fill,
                  width: 200,
                  height: 100,
                  
                ),
              ),
            ),
            !(widget.itemMenu.disponivel!)?
            GestureDetector
            (
              onTap: () {
                Fluttertoast.showToast(
                              msg: "Item indisponível",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
              },
              child: Container(color: Colors.grey.withOpacity(0.8),width: 200,height:100 ,))
            :
            Container()
          ],
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

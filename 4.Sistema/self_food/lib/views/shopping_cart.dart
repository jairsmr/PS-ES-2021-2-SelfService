import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_food/controllers/menu_manager.dart';
import 'package:self_food/models/item_menu.dart';
import 'package:self_food/models/item_order.dart';
import 'package:self_food/widgets/menu_tiles.dart';
import 'package:self_food/widgets/menu_tiles2.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<ItemMenu> dataCardapio = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 0, 24),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Carrinho',
                textScaleFactor: 2,
              ),
            ),
            Column(
              children: [
                Consumer<MenuManager>(
                  builder: (_, menuManager, __) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (ctx, i) => MenuTiles2(
                          itemMenu: menuManager.listMenu[i],
                        ),
                        itemCount: 4,
                      ),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'pagamento no local',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(child: Row()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check_box_outline_blank,
                            size: 30,
                            color: Color.fromARGB(255, 208, 0, 24),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'pagamento via cartao',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(child: Row()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check_box_outline_blank,
                            size: 30,
                            color: Color.fromARGB(255, 208, 0, 24),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'pagamento via pix',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(child: Row()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check_box,
                            size: 30,
                            color: Color.fromARGB(255, 208, 0, 24),
                          )),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Finalizar Compra'),
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
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_food/controllers/menu_manager.dart';
import 'package:self_food/models/item_menu.dart';
import 'package:self_food/views/shopping_cart.dart';
import 'package:self_food/widgets/menu_tiles.dart';
import 'package:self_food/widgets/menu_tiles2.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<ItemMenu> dataCardapio = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 0, 24),
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
                          MaterialPageRoute(builder: (_) => ShoppingCart()),
                          (Route<dynamic> route) => false);
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
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Pesquisar',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cardápio',
                  textScaleFactor: 2,
                ),
              ],
            ),
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
                   itemBuilder: (ctx, i) => MenuTiles(
                    itemMenu: menuManager.listMenu[i],
                  ),
                  itemCount:  menuManager.listMenu.length,
                ),
                  
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

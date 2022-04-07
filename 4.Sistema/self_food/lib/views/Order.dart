import 'package:flutter/material.dart';
import 'package:self_food/models/item_order.dart';
import 'package:self_food/views/menu_adm.dart';
import 'package:self_food/views/shopping_cart.dart';
import 'package:self_food/widgets/order_tiles.dart';

class Order extends StatelessWidget {
  List<ItemOrder> dataOrder = [
    ItemOrder(id: '1', numOrder: 'Pedido 1', cartList: [
      'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/Strogonoff-frango.jpg',
      'https://vivareceita-cdn.s3.amazonaws.com/uploads/2020/11/Aprenda-como-fazer-um-arroz-dos-deuses.-Fonte-Pinterest-500x500.jpg',
      'https://pubimg.band.uol.com.br/files/e3cc6ec99acee03db3b9.png'
    ]),
    ItemOrder(id: '2', numOrder: 'Pedido 2', cartList: [
      'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/Strogonoff-frango.jpg',
      'https://vivareceita-cdn.s3.amazonaws.com/uploads/2020/11/Aprenda-como-fazer-um-arroz-dos-deuses.-Fonte-Pinterest-500x500.jpg',
      'https://pubimg.band.uol.com.br/files/e3cc6ec99acee03db3b9.png',
      
    ]),
    ItemOrder(id: '3', numOrder: 'Pedido 3', cartList: [
      'https://vivareceita-cdn.s3.amazonaws.com/uploads/2020/11/Aprenda-como-fazer-um-arroz-dos-deuses.-Fonte-Pinterest-500x500.jpg',
      'https://conteudo.imguol.com.br/c/entretenimento/19/2020/11/09/costela-de-boi-1604926430242_v2_615x300.jpg',
      'https://pubimg.band.uol.com.br/files/e3cc6ec99acee03db3b9.png',
    ]),
  ];

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
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => MenuAdm()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(Icons.menu_book)),
              ],
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Pedidos',
                textScaleFactor: 3,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) => OrderTiles(itemOrder: dataOrder[i]),
                itemCount: dataOrder.length,
                separatorBuilder: (context,index) => SizedBox(height: 16,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

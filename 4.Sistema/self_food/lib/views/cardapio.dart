import 'package:flutter/material.dart';
import 'package:self_food/data/data_cardapio.dart';
import 'package:self_food/models/item_cardapio.dart';
import 'package:self_food/views/carrinho.dart';
import 'package:self_food/widgets/cardapio_tiles.dart';

class Cardapio extends StatefulWidget {
  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  List<ItemCardapio> dataCardapio = [
    ItemCardapio(
      id: '1',
      nome: 'Strognoff',
      imagem:
          'https://www.mundoboaforma.com.br/wp-content/uploads/2021/04/Strogonoff-frango.jpg',
    ),
    ItemCardapio(
      id: '2',
      nome: 'Arroz',
      imagem:
          'https://vivareceita-cdn.s3.amazonaws.com/uploads/2020/11/Aprenda-como-fazer-um-arroz-dos-deuses.-Fonte-Pinterest-500x500.jpg',
    ),
    ItemCardapio(
      id: '3',
      nome: 'Feijão',
      imagem:
          'https://s2.glbimg.com/VShdvjDcr6qXK6tajbkwklBCSz0=/0x0:1280x853/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/b/2/PbQQZ0TgywV5viyz1Ysw/download.png',
    ),
    ItemCardapio(
      id: '4',
      nome: 'Omelete',
      imagem:
          'https://img.cybercook.com.br/receitas/105/omelete-classica-1.jpeg',
    ),
    ItemCardapio(
      id: '5',
      nome: 'Costela',
      imagem:
          'https://conteudo.imguol.com.br/c/entretenimento/19/2020/11/09/costela-de-boi-1604926430242_v2_615x300.jpg',
    ),
    ItemCardapio(
      id: '6',
      nome: 'Camarão',
      imagem:
          'https://img.itdg.com.br/tdg/images/recipes/000/015/286/326210/326210_original.jpg?mode=crop&width=710&height=400',
    ),
    ItemCardapio(
      id: '7',
      nome: 'Salmão',
      imagem: 'https://pubimg.band.uol.com.br/files/e3cc6ec99acee03db3b9.png',
    ),
    ItemCardapio(
      id: '8',
      nome: 'Lasanha',
      imagem:
          'https://img.itdg.com.br/tdg/images/recipes/000/000/876/324587/324587_original.jpg?mode=crop&width=710&height=400',
    ),
  ];
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
                          MaterialPageRoute(builder: (_) => Carrinho()),
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
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (ctx, i) => CardapioTiles(
                  itemCardapio: dataCardapio[i],
                ),
                itemCount: dataCardapio.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

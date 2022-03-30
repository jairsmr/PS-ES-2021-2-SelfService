import 'package:flutter/material.dart';
import 'package:self_food/data/data_cardapio.dart';
import 'package:self_food/models/item_cardapio.dart';

class CardapioTiles extends StatefulWidget {
  final ItemCardapio itemCardapio;
  CardapioTiles({required this.itemCardapio});
  @override
  State<CardapioTiles> createState() => _CardapioTilesState();
}

class _CardapioTilesState extends State<CardapioTiles> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(widget.itemCardapio.nome!),
          backgroundColor: Colors.redAccent[700],
        ),
        child: ClipRRect(
            borderRadius:  BorderRadius.circular(8),
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.network(widget.itemCardapio.imagem!, fit: BoxFit.cover),
            ),
          ),
        
        // Container(
        //   decoration: BoxDecoration(
        //  border: Border.all(
        //    color: Colors.black,
        //  ),
        //  borderRadius: BorderRadius.circular(32)

        // ),
        //   width: 150,
        //   height: 100,
        //   child: Image.network(widget.itemCardapio.imagem!,fit: BoxFit.cover,),

        // ),
        );
  }
}

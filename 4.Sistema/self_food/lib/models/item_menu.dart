import 'package:cloud_firestore/cloud_firestore.dart';

class ItemMenu {
  String? id;
  bool? disponivel;
  String? nome;
  String? imagem;

  ItemMenu({this.disponivel, this.nome, this.imagem,this.id});

  ItemMenu.fromDocument(DocumentSnapshot document) {
    disponivel = document.get('disponivel');
    nome = document.get('nome');
    imagem = document.get('imagem');
    id = document.id;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:self_food/models/item_menu.dart';
import 'package:self_food/models/users/user_store.dart';



class MenuManager extends ChangeNotifier {
  MenuManager(){
    _loadMenuItem();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserStore? user;

  bool _loading = false;
  bool get loading => _loading;
  bool get isLoggedIn => user != null;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<ItemMenu> listMenu = [];

  Future<void> _loadMenuItem() async {
      firestore.collection('cardapio')
      .snapshots().listen((snapshot) {
        listMenu.clear();
        for(final DocumentSnapshot document in snapshot.docs){
          listMenu.add(ItemMenu.fromDocument(document));
        }
        notifyListeners();
      print(listMenu);
      });
    }

  Future<void> itemRegister(ItemMenu itemMenu,{Function? onSuccess}) async{
    loading = true;
    final Map<String,dynamic> data = {
      'nome':itemMenu.nome,
      'imagem':itemMenu.imagem,
      'disponivel':true,
    };
    final doc = await firestore.collection('cardapio').add(data); 
    if (doc!=null) {
      loading = false;
      onSuccess?.call();
    }   
  }
  Future<void> editItem(ItemMenu itemMenu,{Function? onSuccess}) async{
    loading = true;
    final Map<String,dynamic> data = {
      'nome':itemMenu.nome,
      'imagem':itemMenu.imagem,
      'disponivel':true,
      'id':itemMenu.id
    };
    await firestore.collection('cardapio').doc(itemMenu.id).set(data); 
    
      loading = false;
      onSuccess?.call();
      
  }
}
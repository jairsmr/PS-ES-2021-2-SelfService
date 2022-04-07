import 'package:cloud_firestore/cloud_firestore.dart';

class ItemOrder {
	String? id;
	String? numOrder;
	List<String>? cartList;

	 ItemOrder({
		this.id,
		this.numOrder,
		this.cartList
	});

   ItemOrder.fromDocument(DocumentSnapshot document, this.id, this.numOrder, this.cartList) {
    id = document.id;
    numOrder = document.get('nome');
    cartList = document.get('imagem');
    Map<String, dynamic> dataMap = document.data() as Map<String, dynamic>;
  }
  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('pedido/$id');

  bool admin = false;

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'numPedido': numOrder,
      'listaCarrinho': cartList,
    };
  }
}
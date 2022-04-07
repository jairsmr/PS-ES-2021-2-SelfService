import 'package:self_food/models/item_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemShoppingCart {
	String? id;
	String? numCart;

	ItemShoppingCart({
		this.id,
		this.numCart,
	});

    List<ItemMenu> listCart = [];

    ItemShoppingCart.fromDocument(DocumentSnapshot document, this.id, this.numCart,) {
    id = document.id;
    numCart = document.get('numCart');
    listCart = document.get('listCart');
  }
}
import 'package:flutter/material.dart';
import 'package:self_food/views/Order.dart';
import 'package:self_food/models/item_order.dart';

class OrderTiles extends StatefulWidget {
  final ItemOrder itemOrder;
  OrderTiles({required this.itemOrder});
  @override
  State<OrderTiles> createState() => _OrderTilesState();
}

class _OrderTilesState extends State<OrderTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(
            widget.itemOrder.numOrder!,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                widget.itemOrder.cartList![0],
                width: 100,
                height: 75,
                fit: BoxFit.fill,
              ),
              Image.network(
                widget.itemOrder.cartList![1],
                width: 100,
                height: 75,
                fit: BoxFit.fill,
              ),
              Image.network(
                widget.itemOrder.cartList![2],
                width: 100,
                height: 75,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check_circle_outline_outlined,
                  size: 30,
                  color: Color.fromARGB(255, 53, 161, 13),
                ),
              ),
              SizedBox(width: 30,),
              IconButton(
                onPressed: () {
                  
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  size: 30,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

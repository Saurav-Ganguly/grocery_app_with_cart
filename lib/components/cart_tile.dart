import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_item.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.cartItem,
    required this.addItem,
    required this.removeItem,
  });
  final CartItem cartItem;
  final void Function()? addItem;
  final void Function()? removeItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 70,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            cartItem.product.productImgPath,
            height: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.product.productName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text('Rs ${cartItem.product.productAmt.toString()}'),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: removeItem,
                icon: const Icon(
                  Icons.remove,
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Text(cartItem.count.toString()),
              ),
              IconButton(
                onPressed: addItem,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

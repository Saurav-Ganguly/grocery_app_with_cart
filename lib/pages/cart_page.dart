import 'package:flutter/material.dart';
import 'package:grocery_app/components/cart_tile.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/models/cart_item.dart';
import 'package:grocery_app/models/product.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void addItemToCart(Product product) {
    var cartItem = CartItem(product: product);
    Provider.of<Cart>(context, listen: false).addItemToCart(cartItem);
  }

  void removeItemFromCart(Product product) {
    var cartItem = CartItem(product: product);
    Provider.of<Cart>(context, listen: false).removeItemFromCart(cartItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Cart',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Consumer<Cart>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) => CartTile(
                        cartItem: value.cart[index],
                        addItem: () => addItemToCart(value.cart[index].product),
                        removeItem: () =>
                            removeItemFromCart(value.cart[index].product),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFF418F42),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Your Price',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Rs ${Provider.of<Cart>(context).totalPriceOfCart().toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        'Pay Now >',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

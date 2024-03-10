import 'package:flutter/material.dart';
import 'package:grocery_app/components/product_tile.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/models/cart_item.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _greetingString = '';

  // return a greeting string according to the time of the day
  String greeting() {
    final now = DateTime.now();
    final hour = now.hour;
    String greetingStr = '';

    if (hour < 12) {
      greetingStr = 'Good morning!';
    } else if (hour < 17) {
      greetingStr = 'Good afternoon!';
    } else {
      greetingStr = 'Good evening';
    }

    return greetingStr;
  }

  //add item to cart
  void addItemToCart(Product product) {
    var cartItem = CartItem(product: product);
    Provider.of<Cart>(context, listen: false).addItemToCart(cartItem);
  }

  @override
  void initState() {
    //set the greeting string
    _greetingString = greeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart_sharp),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _greetingString,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Let\'s order fresh items for you',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Divider(
                color: Colors.grey[200],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Fresh Items',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Consumer<Cart>(
                  builder: (context, value, child) => GridView.builder(
                    itemCount: value.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.4,
                    ),
                    itemBuilder: (context, index) => ProductTile(
                      product: value.products[index],
                      onPressed: () => addItemToCart(value.products[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

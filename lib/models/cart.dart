import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_item.dart';
import 'package:grocery_app/models/product.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Cart extends ChangeNotifier {
  //product list
  final List<Product> _products = [
    Product(
      productName: 'Avocado',
      productAmt: 150,
      productImgPath: 'assets/imgs/avocado.png',
      backgroundColor: Colors.green,
    ),
    Product(
      productName: 'Banana',
      productAmt: 20,
      productImgPath: 'assets/imgs/banana.png',
      backgroundColor: const Color.fromARGB(255, 206, 192, 66),
    ),
    Product(
      productName: 'Chicken',
      productAmt: 220,
      productImgPath: 'assets/imgs/chicken.png',
      backgroundColor: Colors.brown,
    ),
    Product(
      productName: 'Water',
      productAmt: 20,
      productImgPath: 'assets/imgs/water.png',
      backgroundColor: Colors.blue,
    ),
  ];
  //get product list
  List<Product> get products => _products;

  //cart
  List<CartItem> _cart = [
    CartItem(
      product: Product(
        productName: 'Water',
        productAmt: 20,
        productImgPath: 'assets/imgs/water.png',
        backgroundColor: Colors.blue,
      ),
    ),
  ];

  //get cart
  List<CartItem> get cart => _cart;

  //add item to cart
  void addItemToCart(CartItem cartItem) {
    for (var item in _cart) {
      if (item.product.id == cartItem.product.id) {
        item.addItem();
        notifyListeners();
        return;
      }
    }
    _cart.add(cartItem);
    return;
  }

  //remove item from the cart
  void removeItemFromCart(CartItem cartItem) {
    List<CartItem> newCart = List.from(_cart);
    for (var item in _cart) {
      if (item.product.id == cartItem.product.id) {
        if (item.count <= 1) {
          newCart.remove(item);
        } else {
          item.removeItem();
        }
        _cart = newCart;
        notifyListeners();
      }
    }
  }

  //total price in the cart
  double totalPriceOfCart() {
    double price = 0;
    for (var item in _cart) {
      double totalCostOfItem = item.count * item.product.productAmt;
      price += totalCostOfItem;
    }
    return price;
  }
}

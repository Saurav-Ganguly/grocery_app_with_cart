import 'package:grocery_app/models/product.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CartItem {
  final String id = uuid.v4();
  final Product product;
  int _count = 1;

  CartItem({required this.product});

  int get count => _count;

  void addItem() {
    _count++;
  }

  void removeItem() {
    _count--;
  }
}

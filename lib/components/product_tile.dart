import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
    required this.onPressed,
  });
  final Product product;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: product.backgroundColor.withAlpha(70),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              product.productImgPath,
              height: 100,
            ),
            Text(
              product.productName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            MaterialButton(
              onPressed: onPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: product.backgroundColor,
                ),
                child: Text(
                  'Rs ${product.productAmt.toString()}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

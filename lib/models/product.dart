import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//generate id
const uuid = Uuid();

class Product {
  final String id = uuid.v4();
  final String productName;
  final double productAmt;
  final String productImgPath;
  final Color backgroundColor;

  Product({
    required this.productName,
    required this.productAmt,
    required this.productImgPath,
    required this.backgroundColor,
  });
}

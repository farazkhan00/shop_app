import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/conatants/string_constants.dart';
import 'package:shop_app/models/product_model.dart';

// product controller for CRUD operations
class ProductController {
  late Box<ProductModel> productBox;

  initFunction() {
    productBox = Hive.box<ProductModel>(StringConstants.productBoxName);
  }

  addProduct(ProductModel product) {
    productBox.add(product);
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/widgets/my_appbar_widget.dart';
import 'package:shop_app/widgets/my_listtile.dart';
import 'package:shop_app/widgets/my_pagetitle_widget.dart';

class ProductsListing extends StatefulWidget {
  const ProductsListing({Key? key, this.productController}) : super(key: key);

  final ProductController? productController;
  @override
  _ProductsListingState createState() => _ProductsListingState();
}

class _ProductsListingState extends State<ProductsListing> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MyAppBArWidget(
        actionWidget: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          icon: const Icon(Icons.notifications_active_outlined),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          MyPageTitleWidget(
            textTheme: textTheme,
            pageTitle: "Bookmarks",
          ),
          ValueListenableBuilder(
              valueListenable:
                  widget.productController!.productBox.listenable(),
              builder: (context, Box<ProductModel> prodBox, _) {
                List<int> keys = prodBox.keys.cast<int>().toList();
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: keys.length,
                    itemBuilder: (context, index) {
                      int key = keys[index];
                      ProductModel? product = prodBox.get(key);
                      return MyListTile(product: product!);
                    });
              }),
        ],
      ),
    );
  }
}

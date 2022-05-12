import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app/conatants/color_constants.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/widgets/rounded_button.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListTile(
        horizontalTitleGap: 20,
        contentPadding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        trailing: RoundedButton(
          child: const Icon(Icons.door_front_door),
          onPressed: () {},
        ),
        title: Text(product.title),
        subtitle: Wrap(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: ColorConstants.primarySimpleColor.withOpacity(0.3),
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.star,
                    color: ColorConstants.primarySimpleColor.withOpacity(0.3))),
          ],
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          clipBehavior: Clip.antiAlias,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.file(
            File(product.imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/conatants/color_constants.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/product_listing_screen.dart';
import 'package:shop_app/utils/image_picker.dart';
import 'package:shop_app/widgets/my_text_form_field.dart';
import 'package:shop_app/widgets/rounded_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  ProductController productController = ProductController();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? image;

  @override
  void initState() {
    super.initState();
    productController.initFunction();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    image?.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 2,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Cupcake"),
        actions: [
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              onPressed: () {},
              icon: const Icon(Icons.share))
        ],
      ),
      backgroundColor: ColorConstants.primaryColor,
      body: Container(
        decoration: const BoxDecoration(
            color: ColorConstants.background,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -20,
              right: 40,
              child: Wrap(
                children: [
                  RoundedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.notifications,
                      color: ColorConstants.primarySimpleColor,
                    ),
                  ),
                  RoundedButton(
                    onPressed: () {},
                    child: const Icon(Icons.star, color: Colors.orange),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyTextFormField(
                        textTheme: textTheme, controller: titleController),
                    const SizedBox(height: 30),
                    MyTextFormField(
                      textTheme: textTheme,
                      controller: descriptionController,
                      hintIcon: Icons.description,
                      hintTextTitle: "Description",
                      maxlines: 10,
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        Wrap(
                          children: [
                            const Icon(
                              Icons.image,
                            ),
                            Text("Photos", style: textTheme.subtitle1),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                            maxHeight: 100,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.primarySimpleColor
                                  .withOpacity(0.3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    MyImagePicker.getImagePicker(context)
                                        .then((value) {
                                      setState(() {
                                        image = value;
                                      });
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2,
                                        color:
                                            ColorConstants.primarySimpleColor),
                                    minimumSize: const Size(90, 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                ),
                                image != null
                                    ? Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        clipBehavior: Clip.antiAlias,
                                        height: 80,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.file(
                                          image!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(200, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Cancel")),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size(200, 50),
                              ),
                              onPressed: () {
                                if (titleController.text != "" &&
                                    descriptionController.text != "" &&
                                    image != null) {
                                  productController.addProduct(ProductModel(
                                      titleController.text,
                                      descriptionController.text,
                                      image!.path));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductsListing(
                                                productController:
                                                    productController,
                                              )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CupertinoAlertDialog(
                                            title: const Text('Alert'),
                                            content: const Text(
                                                'Please fill all fields'),
                                            actions: <Widget>[
                                              CupertinoDialogAction(
                                                child: const Text('Ok'),
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                              )
                                            ],
                                          ));
                                }
                              },
                              child: const Text("Save")),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

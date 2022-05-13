import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/conatants/color_constants.dart';
import 'package:shop_app/conatants/string_constants.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(StringConstants.productBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            accentColor: ColorConstants.primaryColor,
            primarySwatch: ColorConstants.primaryColor),
      ),
      home: const HomeScreen(),
    );
  }
}

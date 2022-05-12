import 'package:flutter/material.dart';
import 'package:shop_app/conatants/color_constants.dart';
import 'package:shop_app/models/home_category_model.dart';
import 'package:shop_app/screens/add_product_screen.dart';
import 'package:shop_app/widgets/my_appbar_widget.dart';
import 'package:shop_app/widgets/my_pagetitle_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeCategories> categories = [
    HomeCategories(Icons.lightbulb_outline, "Ideas"),
    HomeCategories(Icons.music_note, "Music"),
    HomeCategories(Icons.computer_outlined, "Programming"),
    HomeCategories(Icons.fastfood_outlined, "Cooking"),
    HomeCategories(Icons.flight_takeoff_outlined, "Flight")
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppBArWidget(
          isWelcomeMessage: true,
          actionWidget: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_outlined))),
      drawer: const Drawer(),
      body: Column(
        children: [
          MyPageTitleWidget(
            textTheme: textTheme,
            pageTitle: "Categories",
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext ctx, index) {
                    HomeCategories homeCategories = categories[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                              ),
                              child: Icon(
                                homeCategories.icon,
                                color: ColorConstants.primaryColor,
                                size: 70,
                              ),
                            ),
                            Text(
                              homeCategories.name,
                              style: textTheme.headline6?.copyWith(
                                  color: ColorConstants.primaryColor),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: kToolbarHeight,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

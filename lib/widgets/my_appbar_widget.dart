import 'package:flutter/material.dart';
import 'package:shop_app/widgets/search_textfield_widget.dart';

class MyAppBArWidget extends StatelessWidget with PreferredSizeWidget {
  const MyAppBArWidget({
    Key? key,
    this.actionWidget,
    this.isWelcomeMessage = false,
  }) : super(key: key);

  final Widget? actionWidget;
  final bool isWelcomeMessage;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context)
        .textTheme
        .apply(bodyColor: Colors.white, displayColor: Colors.white);
    return AppBar(
      actions: [actionWidget ?? const SizedBox.shrink()],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      )),
      toolbarHeight: kToolbarHeight * 3,
      bottom: PreferredSize(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isWelcomeMessage,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Hi Sonia",
                      style: textTheme.headline5,
                    ),
                    Text(
                      "Welcome back",
                      style: textTheme.headline4
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: SearchTextFieldWidget(),
            ),
          ],
        ),
        preferredSize: const Size.fromHeight(0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 4);
}

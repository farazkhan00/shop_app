import 'package:flutter/material.dart';
import 'package:shop_app/conatants/color_constants.dart';

class MyPageTitleWidget extends StatelessWidget {
  const MyPageTitleWidget({
    Key? key,
    required this.textTheme,
    this.pageTitle,
  }) : super(key: key);

  final TextTheme textTheme;
  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pageTitle ?? "Categories",
            style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
          ),
          Wrap(
            children: [
              IconButton(
                  color: ColorConstants.primaryColor,
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: const Icon(Icons.delete)),
              IconButton(
                  color: ColorConstants.primaryColor,
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: const Icon(Icons.mode_edit_outline)),
              IconButton(
                  color: ColorConstants.primaryColor,
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  icon: const Icon(Icons.compare_outlined))
            ],
          )
        ],
      ),
    );
  }
}

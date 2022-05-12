import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.textTheme,
    required this.controller,
    this.hintIcon,
    this.hintTextTitle,
    this.maxlines,
  }) : super(key: key);

  final TextTheme textTheme;
  final TextEditingController controller;
  final IconData? hintIcon;
  final String? hintTextTitle;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Wrap(
          children: [
            Icon(
              hintIcon ?? Icons.text_fields,
            ),
            Text(hintTextTitle ?? "Title", style: textTheme.subtitle1),
          ],
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: TextFormField(
            controller: controller,
            maxLines: maxlines ?? 1,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}

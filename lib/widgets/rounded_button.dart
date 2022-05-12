import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 55, minHeight: 44),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const CircleBorder(),
      fillColor: Colors.white,
      onPressed: onPressed,
      child: child,
    );
  }
}

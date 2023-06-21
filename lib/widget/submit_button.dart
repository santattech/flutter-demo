import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final Function onTapFunc;

  const SubmitButton({
    super.key,
    required this.buttonText,
    required this.onTapFunc,
  });

  @override
  Widget build(BuildContext context) {
    return GFButton(
        size: GFSize.LARGE,
        shape: GFButtonShape.pills,
        text: buttonText,
        textStyle: const TextStyle(
          fontSize: 16,
          color: GFColors.WHITE,
        ),
        color: GFColors.INFO,
        blockButton: true,
        onPressed: () {
          onTapFunc();
        });
  }
}

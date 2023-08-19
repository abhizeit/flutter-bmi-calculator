import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.handlePress, this.iconData});
  final Function? handlePress;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => handlePress!(),
      constraints: const BoxConstraints.tightFor(height: 56.0, width: 56.0),
      fillColor: const Color(0xFF111328),
      shape: const CircleBorder(),
      elevation: 5.0,
      child: Icon(iconData),
    );
  }
}

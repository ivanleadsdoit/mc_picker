import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollWidget extends StatelessWidget {
  const RollWidget({
    required this.onSelectedItemChanged,
    required this.viewIndex,
    required this.values,
    this.offAxisFraction = 0,
    this.align = TextAlign.center,
    super.key,
  });

  final ValueChanged<int> onSelectedItemChanged;
  final int viewIndex;
  final List<String> values;
  final double offAxisFraction;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      onSelectedItemChanged: onSelectedItemChanged,
      looping: true,
      itemExtent: 36,
      offAxisFraction: offAxisFraction,
      selectionOverlay: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFD6FF7D),
              width: 1,
            ),
            bottom: BorderSide(
              color: Color(0xFFD6FF7D),
              width: 1,
            ),
          ),
        ),
      ),
      children: values.map(
        (e) {
          final selected = e == values[viewIndex];

          return Align(
            alignment: _getAlignment(),
            child: Padding(
              padding: _getPadding(),
              child: Text(
                e,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFF596698),
                  fontSize: selected ? 25 : 19,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Alignment _getAlignment() {
    switch (align) {
      case TextAlign.left:
        return Alignment.centerLeft;
      case TextAlign.right:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }

  EdgeInsets _getPadding() {
    switch (align) {
      case TextAlign.left:
        return const EdgeInsets.only(left: 10);
      case TextAlign.right:
        return const EdgeInsets.only(right: 10);
      default:
        return EdgeInsets.zero;
    }
  }
}

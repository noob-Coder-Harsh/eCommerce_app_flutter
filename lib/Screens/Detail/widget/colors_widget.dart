import 'package:flutter/material.dart';

class ColorSelectionRow extends StatefulWidget {
  final List<Color> colors;
  final Function(int) onColorSelected;

  const ColorSelectionRow({
    Key? key,
    required this.colors,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  State<ColorSelectionRow> createState() => _ColorSelectionRowState();
}

class _ColorSelectionRowState extends State<ColorSelectionRow> {
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.colors.length,
            (index) => GestureDetector(
          onTap: () {
            setState(() {
              currentColor = index;
            });
            widget.onColorSelected(index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentColor == index
                  ? Colors.white
                  : widget.colors[index],
              border: currentColor == index
                  ? Border.all(color: widget.colors[index])
                  : null,
            ),
            padding: currentColor == index ? const EdgeInsets.all(2) : null,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: widget.colors[index],
                shape: BoxShape.circle,
                boxShadow: currentColor == index
                    ? null
                    : [BoxShadow(color: widget.colors[index], blurRadius: 5)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

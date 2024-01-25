import 'package:flutter/material.dart';
class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors, required this.onTap});
  final List<Color> colors ;
  final Function(Color) onTap;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color isSelectedColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelectedColor=widget.colors.first;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors.map((e) => InkWell(
        splashColor: Colors.transparent,
        onTap: (){
          widget.onTap(e);
          setState(() {
            isSelectedColor=e;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CircleAvatar(
            backgroundColor: e,
            radius: 12,
            child: isSelectedColor==e?Icon(Icons.check, color: Colors.white):null,
          ),
        ),
      )).toList(),

    );
  }
}
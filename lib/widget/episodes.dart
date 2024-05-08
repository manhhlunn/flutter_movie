import 'package:flutter/material.dart';

class ValuesWidget extends StatelessWidget {
  final int idx;
  final List<String> values;
  final ValueChanged<int> onChanged;

  const ValuesWidget(
      {super.key,
      required this.idx,
      required this.values,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: values.map((key) {
            var index = values.indexOf(key);
            var leftSpace = index == 0 ? 16.0 : 0.0;
            var rightSpace = index == values.length - 1 ? 16.0 : 6.0;
            return GestureDetector(
                onTap: () {
                  onChanged(index);
                },
                child: Container(
                    margin: EdgeInsets.only(left: leftSpace, right: rightSpace),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: idx == index
                          ? const Color.fromRGBO(105, 105, 105, 100)
                          : const Color.fromRGBO(211, 211, 211, 100),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      key,
                      style: TextStyle(
                        color: idx == index ? Colors.white : Colors.black,
                      ),
                    )));
          }).toList()),
    );
  }
}

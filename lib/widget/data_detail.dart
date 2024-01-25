import 'package:flutter/material.dart';

class DataDetailWidget extends StatelessWidget {
  final Map<String, String> values;

  const DataDetailWidget({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 42,
      alignment: Alignment.center,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            ...values.keys.map((data) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                    children: [
                      Text(data),
                      Text(values[data] ?? '',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
            )),
          ]),
    );
  }
}

import 'package:flutter/material.dart';

Widget buildMarker(DateTime day, Color color) {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(1),
          child: Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        );
      });
}

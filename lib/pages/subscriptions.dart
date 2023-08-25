import 'package:flutter/material.dart';

import 'filters.dart';
import 'subs.dart';
import 'videocard.dart';

class Subscriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
       
        const SizedBox(
          height: 16,
        ),
        Expanded(child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
          return SubsFilter();
        }))
      ],
    );
  }
}
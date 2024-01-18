import 'package:flutter/material.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({super.key});

  @override
  State<AlarmsView> createState() => AalarmViewsState();
}

class AalarmViewsState extends State<AlarmsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(child: Text('알람')),
        ],
      ),
    );
  }
}

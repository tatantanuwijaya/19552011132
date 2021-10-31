import 'package:flutter/material.dart';

class DashboadPage extends StatefulWidget {
  const DashboadPage({ Key? key }) : super(key: key);

  @override
  _DashboadPageState createState() => _DashboadPageState();
}

class _DashboadPageState extends State<DashboadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is dashboard page',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade500,
    );
  }
}
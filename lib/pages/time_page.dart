import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({ Key? key }) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showTime(context);
              }, 
              child: Text(
                'Time Picker',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Time Value: ' + _selectedTime.format(context),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.greenAccent.shade700,
    );
  }

  _showTime(context) async{
    final _timePicker = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ), 
          child: child!,
        );
      }
    );
    if(_timePicker != null){
      setState(() {
        _selectedTime = _timePicker;
      });
    }
  }
}
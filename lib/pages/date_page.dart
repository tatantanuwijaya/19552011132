import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  const DatePage({ Key? key }) : super(key: key);

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd-MM-yy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                _showDate(context);
              }, 
              child: Text(
                'Date Picker',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Date Value: ' + _dateFormat.format(_selectedDate),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.redAccent.shade700,
    );
  }

  _showDate(context) async{
    final _datePicked = await showDatePicker(
      context: context, 
      initialDate: _selectedDate, 
      firstDate: _selectedDate.subtract(
        Duration(days: 30),
      ), 
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if(_datePicked != null){
      setState(() {
        _selectedDate = _datePicked;
      });
    }
  }
}
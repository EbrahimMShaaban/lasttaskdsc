import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  DateTime dataInput = DateTime.now();

  Future<void> _dataInput(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: dataInput,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2100));
    if (date != null && date != dataInput)
      setState(() {
        dataInput = date;
      });
  }

  TimeOfDay timeInput = TimeOfDay.now();

  Future<void> _timeInput(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: timeInput,
    );

    if (time != null && time != timeInput)
      setState(() {
        timeInput = time;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: Text(
            'Last Task DSC',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 250,
              child: Column(
                children: [
                  Text(
                    "${timeInput.toString()}".split('   ')[0],
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${dataInput.toLocal()}".split(' ')[0],
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                await _dataInput(context);
                await _timeInput(context);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.purple,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${timeInput.toString()}".split(' ')[0],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.date_range, color: Colors.purple),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${dataInput.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    duration: Duration(seconds: 150),
                    backgroundColor: Colors.amberAccent));
              },
              child: Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Enter time & date',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

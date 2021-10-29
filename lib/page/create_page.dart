import 'package:campaign_app/page/save_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreateState();
  }
}

class CreateState extends State<CreatePage> {
  final dateFormate = DateFormat.yMd();
  DateTime? date;

  @override
  void initState() {
    super.initState();
    date;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 30, 10, 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Create Campaign",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 5),
        const Text(
          " Create Your Campaign",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        const SizedBox(height: 15),
        const Text(
          " Campaign Title",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: "Enter email"),
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          " Date",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black87, fontSize: 10),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black38,
          )),
          child: Row(children: [
            Text(
              (date == null) ? '  Select Date ' : dateFormate.format(date!),
              style: TextStyle(
                  wordSpacing: 5, color: Colors.black87, fontSize: 10),
            ),
            SizedBox(width: 180),
            IconButton(
              splashRadius: 0.5,
              icon:
                  new Icon(Icons.calendar_today, color: Colors.blue, size: 20),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2022),
                ).then((value) {
                  setState(() {
                    date = value!;
                  });
                  print(value);
                });
              },
            )
          ]),
        ),
        const SizedBox(height: 15),
        const Text(
          " Venue",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black87, fontSize: 10),
        ),
        const SizedBox(height: 15),
        TextFormField(
          maxLines: 3,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: "Enter Venue Details"),
          style: const TextStyle(
            fontSize: 10,
            wordSpacing: 5,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 100),
        Center(
          child: ElevatedButton(
            child: const Text(
              'CREATE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextButton.styleFrom(
              fixedSize: const Size(300, 50),
              primary: Colors.white,
              backgroundColor: Colors.orange[800],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SavePage()));
            },
          ),
        )
      ]),
    )));
  }
}

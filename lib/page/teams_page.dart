import 'package:flutter/material.dart';

class Contact {
  final String name, mobile;

  Contact(this.name, this.mobile);
}

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<TeamsPage> {
  TextEditingController editingController = TextEditingController();



  List<Contact> words = [
    Contact("1.John Doe", "+91 9658245236"),
    Contact("2.Matt Brittin", "+91 9658245236"),
    Contact("3.Mark William", "+91 9658245236"),
    Contact("4.Adam Jones ", "+91 9658245236"),
    Contact("5.Serina William", "+91 9658245236"),
    Contact("6.Kate William", "+91 9658245236"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding:const EdgeInsets.fromLTRB(10,50,10,10),
       child: SingleChildScrollView(child:
      ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Teams",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              " Explore Your Teams",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            const SizedBox(height: 10),
             TextField(
               cursorWidth: 10,
                onChanged: (value) {
                  setState(() {});
                },
                style: const TextStyle(fontSize: 10),
                controller: editingController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: "Search People"),
              ),
            Expanded(
                child: ListView.builder(
                  shrinkWrap: false,
                  reverse: false,
                  physics:const NeverScrollableScrollPhysics() ,
                  itemCount: words.length,
                  itemBuilder: (context, index) {
                    if (editingController.text.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(),
                            side: BorderSide(color: Colors.black),
                          ),
                          title: Text(words[index].name,
                           style: const TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.black),),
                          contentPadding: const EdgeInsets.all(10),
                          subtitle: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                const Icon(Icons.call, size: 15),
                           Text(
                            words[index].mobile,
                            style: const TextStyle(
                                color: Colors.black54),
                          ),
                        ])
                      ));
                    } else if (words[index]
                            .name
                            .toLowerCase()
                            .contains(editingController.text) ||
                        words[index]
                            .mobile
                            .toLowerCase()
                            .contains(editingController.text)) {
                      return ListTile(
                        title: Text(words[index].name),
                       subtitle:
                        const Icon(Icons.call,  size: 15),);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
          ],
        ),
      ),
       )));
  }
}

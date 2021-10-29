import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';


class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SaveState();
  }
}

class SaveState extends State<SavePage> {
  List _images =[];
  File? imageFile;
  final picker = ImagePicker();

   Future chooseImage() async {
    var  pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("file seclected");
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child:Padding(padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Icon(
              Icons.keyboard_arrow_left_outlined,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              " Campaign  Name 1",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(children: [
                WidgetSpan(
                  child: Icon(Icons.calendar_today_sharp, size: 20),
                ),
                TextSpan(
                  text: "Today (24 Sep 2021)",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(children: [
                WidgetSpan(
                  child: Icon(Icons.location_on, size: 20),
                ),
                TextSpan(
                  text: "ABC Stadium Chennai",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                child: const Text(
                  'UPLOAD',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  fixedSize: const Size(300, 20),
                  primary: Colors.orange[800],
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child:
            StaggeredGridView.countBuilder(
                shrinkWrap: true,
                reverse: false,
                physics:const NeverScrollableScrollPhysics() ,
              crossAxisCount: 4,
              itemCount: _images.length + 1,
              itemBuilder: (BuildContext context, index) {
                return index == _images.length
                    ? GestureDetector(
                        onTap: () {
                          chooseImage();
                        },
                        child: Container(
                            height:30,
                            width:30,
                            decoration: BoxDecoration(
                            border: Border.all(
                            )),child:
                    // height:MediaQuery.of(context).size.height/2,
                        //     width:MediaQuery.of(context).size.width,
                        //     child: DottedBorder(
                        //         color: Colors.grey,
                        //         strokeWidth: 2,
                        //         radius: Radius.circular(5),
                        //         dashPattern: [4, 5],
                        //         child: ClipRect(
                        //             child: Container(
                        //                 height:double.infinity,
                        //                 width:double.infinity,
                                         Icon(
                                          Icons.add,

                                        ))
                )
                    : Container(
                  height:30,
                        width:30,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                        image: DecorationImage(
                          image: FileImage(_images[index]),
                        ),
                      ));
              },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(
                  index == 5 ? 3 : 1, index == 5 ? 3 : 1),
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            ),  const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                child: const Text(
                  'SAVE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  fixedSize: const Size(300, 20),
                  primary: Colors.white,
                  backgroundColor: Colors.orange[800],
                ),
                onPressed: () {},
              ),
            ),
          ]),
    )));
  }
}
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
//
//
// class SampleScreen extends StatefulWidget {
//   @override
//   _SampleScreenState createState() => _SampleScreenState();
// }
//
// class _SampleScreenState extends State<SampleScreen> {
//   File? _image;
//   final picker = ImagePicker();
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//    print("object");
//       }
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(onPressed: ()
//             => getImage(), child: Icon(Icons.add,size:30)),
//
//             Flexible(child: _image != null ? Image.file(_image!) : Text('no Image')),
//           ],
//         ),
//       ),
//     );
//   }
// }
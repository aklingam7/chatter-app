import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class PictureSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: MyImagePicker());
  }
}

class MyImagePicker extends StatefulWidget {
  @override
  MyImagePickerState createState() => MyImagePickerState();
}

class MyImagePickerState extends State {
  File imageURI;
  static File postImage;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(
      () {
        imageURI = image;
        postImage = imageURI;
      },
    );
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        imageURI = image;
        postImage = imageURI;
      },
    );
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          imageURI == null
              ? Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(90, 227, 226, 219),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('No image selected.'),
                )
              : Image.file(imageURI,
                  width: 300, height: 200, fit: BoxFit.cover),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: FloatingActionButton(
                  onPressed: () => getImageFromCamera(),
                  child: Icon(camera_icon),
                  heroTag: "btn6",
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: FloatingActionButton(
                  onPressed: () => getImageFromGallery(),
                  child: Icon(gallery_icon),
                  heroTag: "btn7",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

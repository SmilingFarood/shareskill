import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shareskill/screens/auth/category_input_screen.dart';

class ProfilePhotoScreen extends StatelessWidget {
  static const routeName = '/profile-photo-screen';

  @override
  Widget build(BuildContext context) {
    final _secondStageIncomingData =
        ModalRoute.of(context).settings.arguments as Map;
    // print('This is printed in the profile photo screen');
    // print(_secondStageIncomingData['contactDetails']);
    // print(_secondStageIncomingData['authDetails']);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.amberAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
          ),
          Container(
            child: Center(
              child: SavePicture(receiveData: _secondStageIncomingData),
            ),
          ),
        ],
      ),
    );
  }
}

class SavePicture extends StatefulWidget {
  @override
  _SavePictureState createState() => _SavePictureState();
  final receiveData;
  SavePicture({this.receiveData});
}

class _SavePictureState extends State<SavePicture> {
  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      // maxHeight: 400,
    );
    setState(() {
      _storedImage = imageFile;
    });
    Navigator.of(context).pop();
  }

  Future<void> _pickPicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      // maxHeight: 400,
    );
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getTemporaryDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    Navigator.of(context).pop();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10,
            title: Text('Use image from '),
            // content: Text('data'),
            actions: <Widget>[
              FlatButton.icon(
                onPressed: _takePicture,
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: _pickPicture,
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.receiveData);
    final mdData = MediaQuery.of(context).size;
    return Container(
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 415,
          width: mdData.width * 0.8,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: _storedImage != null
                      ? Image.file(_storedImage, fit: BoxFit.cover)
                      : Icon(Icons.camera),
                ),
                FlatButton.icon(
                  onPressed: _showDialog,
                  icon: Icon(Icons.camera),
                  label: Text('Take Picture'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Back'),
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          CategoryInputScreen.routeName,
                          arguments: {
                            'receivedAuthDetails':
                                widget.receiveData['authDetails'],
                            'receivedContactDetails':
                                widget.receiveData['contactDetails'],
                            'imageFile': _storedImage,
                          },
                        );
                      },
                      child: Text(_storedImage == null ? 'Skip' : 'Continue'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



/*Code Referred from Youtube
  Author - Pradip Debnath
  Date - 07/02/2022
  Website - https://www.youtube.com/watch?v=IePaAGXzmtU
 */


void main() {
  runApp(const MaterialApp(
    home: camera(),
  ));
}

class camera extends StatefulWidget {
  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _HomeState();
}

class _HomeState extends State<camera> {

  File? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(photo != null)
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: FileImage(photo!),
                      fit: BoxFit.cover
                  ),
                  border: Border.all(width: 8, color: Colors.black),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            else
              Container(
                width: 480,
                height: 380,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(width: 8, color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text('Image Preview Screen', style: TextStyle(fontSize: 26),),
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()=> getImage(source: ImageSource.gallery), //Choose from Phone Storage
                      child: const Text('Gallery', style: TextStyle(fontSize: 18))
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                      onPressed: ()=> getImage(source: ImageSource.camera), //Take Photo from Camera
                      child: const Icon(Icons.camera)
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
//reference Code from Youtube
    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 70
    );
//
    if(file?.path != null){
      setState(() {
        photo = File(file!.path);
      });
    }
  }
}
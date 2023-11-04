import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';



class Ocr extends StatefulWidget {
  const Ocr({Key? key}) : super(key: key);

  @override
  State<Ocr> createState() => _OcrState();
}

class _OcrState extends State<Ocr> {
  bool txtScanning = false;

  XFile? photo;

  String scannedTxt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text("Text Recognition Reader"),
      ),
      backgroundColor: Colors.grey,
      body: Center(
          child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (txtScanning) const CircularProgressIndicator(),
                    if (!txtScanning && photo == null)
                      //Image Preview Space
                      Container(
                        width: 640,
                        height: 480,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(width: 8, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Text('Image Preview', style: TextStyle(fontSize: 26),),
                      ),
                    if (photo != null) Image.file(File(photo!.path)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            child: FloatingActionButton(
                              backgroundColor: Colors.blue,
                              onPressed: () {
                                getImage(ImageSource.gallery);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.image,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            child: FloatingActionButton(
                              backgroundColor: Colors.blue,
                              onPressed: () {
                                getImage(ImageSource.camera);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.camera,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      scannedTxt,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )),
          )),
    );
  }

//Select Image from Phone Storage
  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        txtScanning = true;
        photo = pickedImage;
        setState(() {});
        recognizedTxt(pickedImage);
      }

//Display Error Message if Access Denied
    } catch (e) {
      txtScanning = false;
      photo = null;
      scannedTxt = "Permission denied";
      setState(() {});
    }
  }


//Function For Turning Image to Textual Format
  void recognizedTxt(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedTxt = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedTxt = scannedTxt + line.text + "\n";
      }
    }
    txtScanning = false;
    setState(() {});
  }

}



import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_image_picker_bug/finish_page.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? pickedImageFile;

  @override
  Widget build(BuildContext context) {
    void pickImage() async {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxWidth: 150,
      );

      if (pickedImage == null) {
        return;
      }

      setState(() {
        pickedImageFile = File(pickedImage.path);
      });
    }

    CircleAvatar buildCircleAvatar() {
      if (pickedImageFile == null) {
        // EMPTY
        return const CircleAvatar(
          radius: 80.0,
          backgroundColor: Color.fromARGB(55, 0, 0, 0),
        );
      } else {
        if (kIsWeb) {
          // DISPLAY IMAGE ON WEB
          return CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage(pickedImageFile!.path),
            backgroundColor: const Color.fromARGB(55, 0, 0, 0),
          );
        } else {
          // DISPLAY IMAGE ON MOBILE
          return CircleAvatar(
            radius: 80.0,
            backgroundImage: FileImage(pickedImageFile!),
            backgroundColor: const Color.fromARGB(55, 0, 0, 0),
          );
        }
      }
    }

    void navigateToNextPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FinishPage(),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: pickImage,
                child: buildCircleAvatar(),
              ),
              const SizedBox(height: 40),
              const Text(
                '1) Click in the circle to pick an image',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 80),
              const Text(
                '2) Now redirect to the next page',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  navigateToNextPage();
                },
                child: const Text(
                  'Click Here',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

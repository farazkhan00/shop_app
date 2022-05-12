import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart' as pHandler;

class MyImagePicker {
  static Future getImagePicker(BuildContext context) async {
    var status = await pHandler.Permission.photos.request();

    if (status.isGranted || status.isLimited) {
      return pickImageFromGallery();
    } else if (status.isDenied) {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Gallery Permission'),
                content: const Text(
                    'This app needs storage access to upload picture for your product'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('Allow'),
                    onPressed: () async =>
                        await pHandler.Permission.photos.request(),
                  ),
                  CupertinoDialogAction(
                    child: const Text('Settings'),
                    onPressed: () => pHandler.openAppSettings(),
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Gallery Permission'),
                content: const Text(
                    'This app needs storage access to upload picture for your product'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: const Text('Settings'),
                    onPressed: () => pHandler.openAppSettings(),
                  ),
                ],
              ));
    }
  }

  static Future pickImageFromGallery() async {
    XFile? gi = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (gi != null) {
      return File(gi.path);

      // setState(() {
      //   image = selected;
      // });
    }
  }
}

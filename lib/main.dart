import 'package:camera/camera.dart';
import 'package:demo/comments.dart';
import 'package:flutter/material.dart';
import 'demo.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BubbleTabBarDemo(camera),
    ),
    );    
  }
}

class MyAppState extends ChangeNotifier { 
  var favorites = <Comment>[];

  void toggleFavorite(Comment current) {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

}

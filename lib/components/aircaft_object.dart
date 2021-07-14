import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class AircaftObject extends StatefulWidget {
  AircaftObject({Key? key}) : super(key: key);

  @override
  _AircaftObjectState createState() => _AircaftObjectState();
}

class _AircaftObjectState extends State<AircaftObject> {
  late Object aircaft;

  @override
  void initState() {
    // TODO: implement initState
    aircaft = Object(fileName: 'assets/jet/Jet.obj');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Cube(
        onSceneCreated: (scene) {
          scene.world.add(Object(fileName: 'assets/jet/Jet.obj'));

          scene.camera.zoom = 10;
        },
      ),
    );
  }
}

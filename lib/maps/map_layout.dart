import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class MapComponent extends StatefulWidget {
  MapComponent({Key? key}) : super(key: key);

  @override
  _MapComponentState createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  bool _darkMode = false;
  // final controller = MapController(
  //   location: LatLng(13, 100),
  // );
  final markers = [
    LatLng(13, 100),
  ];

  void _onDoubleTap() {
    // controller.zoom += 0.5;
    setState(() {});
  }

  // void _onScaleUpdate(ScaleUpdateDetails details) {
  //   final scaleDiff = details.scale - _scaleStart;
  //   _scaleStart = details.scale;

  //   if (scaleDiff > 0) {
  //     controller.zoom += 0.02;
  //     setState(() {});
  //   } else if (scaleDiff < 0) {
  //     controller.zoom -= 0.02;
  //     setState(() {});
  //   } else {
  //     final now = details.focalPoint;
  //     final diff = now - _dragStart!;
  //     _dragStart = now;
  //     controller.drag(diff.dx, diff.dy);
  //     setState(() {});
  //   }
  // }

  void _onVerticalDrag(DragUpdateDetails details) {
    print('dragUpdate');
  }

  Widget _buildMarkerWidget(Offset pos, Color color) {
    return Positioned(
      left: pos.dx - 16,
      top: pos.dy - 16,
      width: 24,
      height: 24,
      child: Transform.rotate(
          angle: 360 * pi / 180,
          child: Icon(Icons.airplanemode_active_rounded, color: color)),
    );
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // MapLayoutBuilder(
        //   controller: controller,
        //   builder: (context, transformer) {
        //     final markerPositions =
        //         markers.map(transformer.fromLatLngToXYCoords).toList();

        //     final markerWidgets = markerPositions.map(
        //       (pos) => _buildMarkerWidget(pos, Colors.yellow),
        //     );

        //     final homeLocation =
        //         transformer.fromLatLngToXYCoords(LatLng(35.68, 51.412));

        //     final homeMarkerWidget =
        //         _buildMarkerWidget(homeLocation, Colors.black);

        //     final centerLocation = Offset(
        //         transformer.constraints.biggest.width / 2,
        //         transformer.constraints.biggest.height / 2);

        //     final centerMarkerWidget =
        //         _buildMarkerWidget(centerLocation, Colors.purple);
        //     return GestureDetector(
        //       behavior: HitTestBehavior.opaque,
        //       onDoubleTap: _onDoubleTap,
        //       onScaleUpdate: _onScaleUpdate,
        //       onScaleStart: _onScaleStart,
        //       onVerticalDragUpdate: _onVerticalDrag,
        //       child: Listener(
        //         behavior: HitTestBehavior.opaque,
        //         onPointerSignal: (event) {
        //           if (event is PointerScrollEvent) {
        //             final delta = event.scrollDelta;

        //             controller.zoom -= delta.dy / 100.0;

        //             setState(() {});
        //           }
        //         },
        //         child: Stack(
        //           children: [
        //             Map(
        //               controller: controller,
        //               builder: (context, x, y, z) {
        //                 print('$x $y $z');
        //                 // print('x: $x , y: $y , z: $z');
        //                 //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.

        //                 //Google Maps
        //                 final url =
        //                     'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

        //                 final darkUrl =
        //                     'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i$z!2i$x!3i$y!4i256!2m3!1e0!2sm!3i556279080!3m17!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC52Om9uLHMuZTpsfHAudjpvZmZ8cC5zOi0xMDAscy5lOmwudC5mfHAuczozNnxwLmM6I2ZmMDAwMDAwfHAubDo0MHxwLnY6b2ZmLHMuZTpsLnQuc3xwLnY6b2ZmfHAuYzojZmYwMDAwMDB8cC5sOjE2LHMuZTpsLml8cC52Om9mZixzLnQ6MXxzLmU6Zy5mfHAuYzojZmYwMDAwMDB8cC5sOjIwLHMudDoxfHMuZTpnLnN8cC5jOiNmZjAwMDAwMHxwLmw6MTd8cC53OjEuMixzLnQ6NXxzLmU6Z3xwLmM6I2ZmMDAwMDAwfHAubDoyMCxzLnQ6NXxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjV8cy5lOmcuc3xwLmM6I2ZmNGQ2MDU5LHMudDo4MnxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjJ8cy5lOmd8cC5sOjIxLHMudDoyfHMuZTpnLmZ8cC5jOiNmZjRkNjA1OSxzLnQ6MnxzLmU6Zy5zfHAuYzojZmY0ZDYwNTkscy50OjN8cy5lOmd8cC52Om9ufHAuYzojZmY3ZjhkODkscy50OjN8cy5lOmcuZnxwLmM6I2ZmN2Y4ZDg5LHMudDo0OXxzLmU6Zy5mfHAuYzojZmY3ZjhkODl8cC5sOjE3LHMudDo0OXxzLmU6Zy5zfHAuYzojZmY3ZjhkODl8cC5sOjI5fHAudzowLjIscy50OjUwfHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE4LHMudDo1MHxzLmU6Zy5mfHAuYzojZmY3ZjhkODkscy50OjUwfHMuZTpnLnN8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmd8cC5jOiNmZjAwMDAwMHxwLmw6MTYscy50OjUxfHMuZTpnLmZ8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmcuc3xwLmM6I2ZmN2Y4ZDg5LHMudDo0fHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE5LHMudDo2fHAuYzojZmYyYjM2Mzh8cC52Om9uLHMudDo2fHMuZTpnfHAuYzojZmYyYjM2Mzh8cC5sOjE3LHMudDo2fHMuZTpnLmZ8cC5jOiNmZjI0MjgyYixzLnQ6NnxzLmU6Zy5zfHAuYzojZmYyNDI4MmIscy50OjZ8cy5lOmx8cC52Om9mZixzLnQ6NnxzLmU6bC50fHAudjpvZmYscy50OjZ8cy5lOmwudC5mfHAudjpvZmYscy50OjZ8cy5lOmwudC5zfHAudjpvZmYscy50OjZ8cy5lOmwuaXxwLnY6b2Zm!4e0&key=AIzaSyAOqYYyBbtXQEtcHG7hwAwyCPQSYidG8yU&token=31440';
        //                 //Mapbox Streets
        //                 final urlMapbox =
        //                     'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/$z/$x/$y?access_token=pk.eyJ1IjoidGFsb2VuZ3JhdHAiLCJhIjoiY2txeTB6MTZwMG44NDJybng2a29hOXl5aCJ9.c_bA5JElN_u3aINy_hxxJA';

        //                 print(urlMapbox);
        //                 return CachedNetworkImage(
        //                   imageUrl: _darkMode ? darkUrl : urlMapbox,
        //                   fit: BoxFit.cover,
        //                 );
        //               },
        //             ),
        //             homeMarkerWidget,
        //             ...markerWidgets,
        //             centerMarkerWidget,
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),

        Positioned(
          child: InkWell(
            child: Icon(
              _darkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            ),
            onTap: () => setState(() => _darkMode = !_darkMode),
          ),
        )
      ],
    );
  }
}

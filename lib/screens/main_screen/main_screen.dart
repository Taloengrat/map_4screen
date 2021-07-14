import 'package:desktop_app/components/aircaft_object.dart';
import 'package:desktop_app/constance.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:desktop_app/providers/screens.dart';
import 'package:desktop_app/widgets/bottom_timeline_panl.dart';
import 'package:desktop_app/widgets/screen_widget.dart';
import 'package:desktop_app/widgets/text_title_widget.dart';
// import 'package:fullscreen/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_map/flutter_map.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Future<void> enterFullScreen(FullScreenMode fullScreenMode) async {
  //   await FullScreen.enterFullScreen(fullScreenMode);
  // }

  @override
  Widget build(BuildContext context) {
    // enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    final size = MediaQuery.of(context).size;
    final rowDisplay = Provider.of<Screens>(context).item;
    final allValue = Provider.of<Screens>(context).item;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Visibility(
                visible: rowDisplay[1]!.isFullScreen! ||
                    rowDisplay[2]!.isFullScreen! ||
                    !allValue.values.any((element) => element.IsFullScreen),
                child: Expanded(
                  child: Row(
                    children: [
                      ScreenWidget(
                        idScreen: 1,
                        size: size,
                        title: TextTitleWidget(title: listAircaft.elementAt(0)),
                        align: Alignment.topLeft,
                        child: AircaftObject(),
                        colors: Colors.blue,
                        // mapController: MapController(),
                      ),
                      ScreenWidget(
                        idScreen: 2,
                        size: size,
                        title: TextTitleWidget(title: listAircaft.elementAt(1)),
                        align: Alignment.topRight,
                        child: AircaftObject(),
                        colors: Colors.deepOrangeAccent,
                        // mapController: MapController(),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: rowDisplay[3]!.isFullScreen! ||
                    rowDisplay[4]!.isFullScreen! ||
                    !allValue.values.any((element) => element.IsFullScreen),
                child: Expanded(
                  child: Row(
                    children: [
                      ScreenWidget(
                        idScreen: 3,
                        size: size,
                        title: TextTitleWidget(title: listAircaft.elementAt(2)),
                        align: Alignment.bottomLeft,
                        child: AircaftObject(),
                        colors: Colors.lightGreenAccent,
                        // mapController: MapController(),
                      ),

                      ScreenWidget(
                        idScreen: 4,
                        size: size,
                        title: TextTitleWidget(title: listAircaft.elementAt(3)),
                        align: Alignment.bottomRight,
                        child: AircaftObject(),
                        colors: Colors.teal,
                        // mapController: MapController(),
                      ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10),
        color: Colors.transparent,
        width: double.infinity,
        height: 30,
        child: BottomTimelinePanel(),
      ),
    );
  }
}

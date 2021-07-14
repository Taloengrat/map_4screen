import 'package:desktop_app/components/aircaft_menu_popup_component.dart';
// import 'package:latlong2/latlong.dart';
import 'package:desktop_app/providers/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:latlng/latlng.dart';

class ScreenWidget extends StatefulWidget {
  final int idScreen;
  final Color colors;
  final Widget child;
  final Alignment align;
  final Size size;
  final Widget title;
  // final MapController mapController;
  // final LatLng latlng;
  ScreenWidget({
    Key? key,
    required this.idScreen,
    required this.colors,
    required this.child,
    required this.align,
    required this.size,
    required this.title,
    // required this.mapController,
  }) : super(key: key);

  @override
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  bool isHover = false;
  double azimuth = 0.5;
  double elevation = 0.5;
  bool _isDark = false;
  // MapController mapController = MapController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // mapController.rotate(degree);
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Screens>(context).findById(widget.idScreen);
    final allValue = Provider.of<Screens>(context).item;

    return Visibility(
      visible:
          allValue.values.every((element) => element.isFullScreen == false) ||
              value!.IsFullScreen,
      child: Expanded(
        flex: 1,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: widget.colors,
          ),
          duration: const Duration(milliseconds: 100),
          width: value!.isFullScreen! ? widget.size.width : null,
          height: value.isFullScreen! ? widget.size.height : null,
          child: Stack(
            children: [
              // Align(
              //   alignment: Alignment.center,
              //   child: Container(
              //     child: FlutterMap(
              //       mapController: mapController,
              //       options: MapOptions(
              //         center: LatLng(13, 100),
              //         zoom: 16.0,
              //         minZoom: 10,
              //       ),
              //       layers: [
              //         TileLayerOptions(
              //           urlTemplate:
              //               'https://api.mapbox.com/styles/v1/taloengratp/ckr20dpzeff5g18o9kuwvm4e9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGFsb2VuZ3JhdHAiLCJhIjoiY2twd2VteDd1MDA5NjJ1bzl4NXo0aWVoMyJ9.XfaPqHFRmpSpZqqwWYRVjg',
              //           additionalOptions: {
              //             'accessToken':
              //                 'pk.eyJ1IjoidGFsb2VuZ3JhdHAiLCJhIjoiY2twd2VteDd1MDA5NjJ1bzl4NXo0aWVoMyJ9.XfaPqHFRmpSpZqqwWYRVjg',
              //             'id': 'mapbox.mapbox-streets-v7'
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Align(
                alignment: Alignment.center,
                child: MapboxMap(
                  // onMapCreated: ,
                  initialCameraPosition: CameraPosition(
                    bearing: 0,
                    zoom: 15,
                    tilt: 60,
                    target: LatLng(13, 100),

                    // target: ,
                  ),
                  accessToken:
                      'pk.eyJ1IjoidGFsb2VuZ3JhdHAiLCJhIjoiY2twd2VteDd1MDA5NjJ1bzl4NXo0aWVoMyJ9.XfaPqHFRmpSpZqqwWYRVjg',
                ),
              ),
              Visibility(
                visible: true,
                child: Center(
                  child: widget.child,
                ),
              ),

              Positioned(
                top: 0,
                right: 5,
                left: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: AircaftMenuPopupComponent(
                            child: widget.title,
                            idScreen: widget.idScreen,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: SliderTheme(
                            data: SliderThemeData(
                              thumbColor: Colors.black,
                              inactiveTrackColor: Colors.black45,
                              activeTrackColor: Colors.black45,
                              // thumbSelector: ,
                              overlayShape: SliderComponentShape.noOverlay,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 10),
                            ),
                            child: Slider(
                              onChanged: (val) {},
                              value: azimuth,
                            ),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              Provider.of<Screens>(context, listen: false)
                                  .updateFullScreen(widget.idScreen);
                            },
                            child: MouseRegion(
                              onHover: (_) => setState(() => isHover = true),
                              onExit: (_) => setState(() => isHover = false),
                              child: Icon(
                                value.isFullScreen!
                                    ? Icons.close_fullscreen_rounded
                                    : Icons.open_in_full_rounded,
                                color: isHover ? Colors.grey : Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 400,
                      child: SfSlider.vertical(
                        inactiveColor: Colors.black45,
                        activeColor: Colors.black45,
                        onChanged: (value) {},
                        value: elevation,
                      ),
                    ),
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Container(
              //     width: 170,
              //     height: 120,
              //     margin: EdgeInsets.only(
              //       bottom: defaultPadding,
              //       left: defaultPadding,
              //     ),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8),
              //         color: Colors.black45),
              //     child: MapComponent(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

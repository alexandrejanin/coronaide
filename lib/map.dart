import 'dart:html';
import 'dart:ui' as ui;

import 'package:coronaide/activities.dart';
import 'package:coronaide/home.dart';
import 'package:coronaide/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gmaps;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatelessWidget {
  final bool showControls;
  final void Function() onTap;

  const GoogleMaps({Key key, this.onTap, this.showControls = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      String htmlId = "7";

      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
        final elem = DivElement()
          ..id = htmlId
          ..style.width = "100%"
          ..style.height = "100%"
          ..style.border = 'none';

        gmaps.GMap(
          elem,
          gmaps.MapOptions()
            ..zoom = 15
            ..center = gmaps.LatLng(48.8566, 2.3522)
            ..zoomControl = false
            ..fullscreenControl = false
            ..mapTypeControl = false
            ..clickableIcons = false,
        );

        return elem;
      });

      return HtmlElementView(viewType: htmlId);
    }

    return GoogleMap(
      onTap: (latlng) {
        if (onTap != null) onTap();
      },
      mapToolbarEnabled: false,
      zoomControlsEnabled: showControls,
      initialCameraPosition: CameraPosition(
        target: LatLng(48.8566, 2.3522),
        zoom: 15,
      ),
      myLocationEnabled: true,
    );
  }
}

class HelpMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMaps(),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: IconTheme(
                            data: IconThemeData(
                              color: Colors.black,
                              size: 30,
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.shuffle),
                                Divider(
                                  height: 6,
                                  thickness: 1,
                                  color: Colors.black,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Icon(Icons.location_on),
                                Divider(
                                  height: 6,
                                  thickness: 1,
                                  color: Colors.black,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Icon(Icons.access_time),
                                Divider(
                                  height: 6,
                                  thickness: 1,
                                  color: Colors.black,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Icon(Icons.star_border),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Color(0xFFECEAEB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(height: 8),
                        SearchBar(text: 'Rechercher lieu ou adresse'),
                        SizedBox(height: 12),
                        ColorButton(
                          text: 'Voir les activités',
                          color: Color(0xFFE32C64),
                          height: 40,
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) {
                                  return Activities();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GpsMapApp extends StatefulWidget {
  const GpsMapApp({super.key});

  @override
  State<GpsMapApp> createState() => GpsMapAppState();
}

class GpsMapAppState extends State<GpsMapApp> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition? _initialCameraPosition;

  int _polylineIdCounter = 0;
  Set<Polyline> _polylines = {};
  LatLng? _previousPosition;

  @override
  void initState() {
    super.initState();

    // initState() 에서는 async 를 사용할 수 없기 때문에 따로 메서드를 만들어 사용
    init();
  }

  Future init() async {
    // 현재 위치
    final position = await _determinePosition();

    _initialCameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 17,
    );

    setState(() {});

    // locationSettings: 위치 정보를 얼마나 정밀하게 할 것인지 설정할 수 있다. 현재는 기본 값
    const locationSettings = LocationSettings();
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      _polylineIdCounter++;
      final polylineId = PolylineId('$_polylineIdCounter');
      Polyline polyline = Polyline(
          polylineId: polylineId,
          color: Colors.red,
          width: 3,
          // 이전 위치, 현재 위치를 리스트에 넣는다. 이 포인트들을 연결해서 polyline 을 만든다.
          points: [
            _previousPosition ?? _initialCameraPosition!.target,
            LatLng(position.latitude, position.longitude),
          ]);
      setState(() {
        _polylines.add(polyline);
        _previousPosition = LatLng(position.latitude, position.longitude);
      });

      _moveCamera(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialCameraPosition == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _initialCameraPosition!,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              // _polylines: 위치 정보를 쌓아서 보여주어야 한다.
              polylines: _polylines,
            ),
    );
  }

  Future<void> _moveCamera(Position position) async {
    final GoogleMapController controller = await _controller.future;
    final cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 17,
    );
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}

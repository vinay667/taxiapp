import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/colors/colors.dart';

Future<BitmapDescriptor> getClusterMarker(
  int width,
) async {
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = MyColor.themeColor;
  final TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );
  final double radius = width / 2;
/*  var sunImage = new ExactAssetImage("res/images/grid_icon.png");
  sunImage.obtainKey(new ImageConfiguration()).then((AssetBundleImageKey key){
    loadImage(key).then((ui.Codec codec){
      print("frameCount: ${codec.frameCount.toString()}");
      codec.getNextFrame().then((info){
        print("image: ${info.image.toString()}");
        print("duration: ${info.duration.toString()}");
        canvas.drawImage(info.image, size.center(Offset.zero), paint);
      });
    });
  });*/
/*  canvas.drawRect(
   Rect(),
    paint,
  );*/
  canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0 ,20,80,50,),Radius.circular(15.0)),paint);
  textPainter.text = TextSpan(
    text: "Home",
    style: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  );
  textPainter.layout();
  textPainter.paint(
    canvas,
    Offset(
      radius - textPainter.width / 2,
      radius - textPainter.height / 2,
    ),
  );
  final image = await pictureRecorder.endRecording().toImage(
        radius.toInt() * 2,
        radius.toInt() * 2,
      );
  final data = await image.toByteData(format: ImageByteFormat.png);
  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}

Future<FrameInfo> loadImage(AssetBundleImageKey key) async {
  final ByteData data = await key.bundle.load(key.name);
  if (data == null)
    throw 'Unable to read data';
  var codec = await instantiateImageCodec(data.buffer.asUint8List());
// add additional checking for number of frames etc here
  return await codec.getNextFrame();
 // return frame.image;
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uint8list_image/res/imageConstant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? _imageBytes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final ByteData data = await rootBundle.load(ImageConstant.sampleImagePath);

    setState(() {
      _imageBytes = data.buffer.asUint8List();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _imageBytes == null
          ? const CircularProgressIndicator()
          : SizedBox(
              width: 200,
              height: 200,
              child: Image.memory(_imageBytes!),
            ),
    );
  }
}

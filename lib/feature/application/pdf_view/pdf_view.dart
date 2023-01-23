import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class PdfView extends StatefulWidget {

  List<int> fileAsByte;

  PdfView({Key? key,required this.fileAsByte}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }


  @override
  void initState() {
    super.initState();
  }

  File createFileFromBytes(Uint8List bytes) => File.fromRawPath(bytes);

}

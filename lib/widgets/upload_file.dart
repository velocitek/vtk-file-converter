import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';

Future uploadFile(BuildContext context) async {
  final downloadProvider = Provider.of<DownloadList>(context, listen: false);
  final result = await FilePicker.platform.pickFiles(
    //Restricts upload file type to only VTK.
    type: FileType.custom,
    allowedExtensions: ['vtk'],
  );
  if (result == null) return;
  final PlatformFile upload = result.files.first;
  final Uint8List? uploadBytes = result.files.single.bytes;

  downloadProvider.addDownload(
      upload.name.substring(0, upload.name.length - 4), uploadBytes!);
}

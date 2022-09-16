import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';

Future uploadFile(BuildContext context) async {
  var downloadProvider = Provider.of<DownloadList>(context, listen: false);
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['vtk'],
  );
  if (result == null) return;
  final PlatformFile upload = result.files.first;
  downloadProvider.addDownload(upload.name.substring(0, upload.name.length - 4),
      result.files.single.bytes);
}

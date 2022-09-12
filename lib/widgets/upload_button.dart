import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../tools/constants.dart';
import '../pages/download_page.dart';
import 'package:provider/provider.dart';
import '../models/download_list.dart';

// class UploadButton extends StatelessWidget {
//   const UploadButton({
//     Key? key,
//     required this.buttonText,
//   }) : super(key: key);
//   final buttonText;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: kButtonStyle,
//       onPressed: () async {
//         final result = await FilePicker.platform.pickFiles(
//           type: FileType.custom,
//           allowedExtensions: ['vtk'],
//         );
//         if (result == null) return;
//         var file = result.files.first;
//         var fileData = file.bytes;
//         Provider.of<ConverterData>(
//           context,
//           listen: false,
//         ).addDownload('default', fileData);
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DownloadPage(),
//           ),
//         );
//       },
//       child: Text(
//         buttonText,
//         style: kButtonText,
//       ),
//     );
//   }
// }

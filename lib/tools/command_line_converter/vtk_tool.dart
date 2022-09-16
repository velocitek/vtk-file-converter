//import 'dart:io';
//import 'dart:html';
import 'dart:typed_data';
import 'protobuf/vtk.pb.dart';

// Reads the entire address book from a file and prints all
// the information inside.
// main(List arguments) {
//   if (arguments.length != 2) {
//     print('Usage: vtk_tool input_file.vtk output_file.csv');
//     exit(-1);
//   }
//
//   File file = new File(arguments.first);
//   List<Record> records = readVtk(file);
//   List<DartTrackpoint> dartTrackpoints = vtkRecordsToDartTrackpoints(records);
//   for (int i = 0; i < dartTrackpoints.length; i++) {
//     // print(dartTrackpoints[i]);
//   }
//   File csvOut = File(arguments[1]);
//   writeCsv(csvOut, dartTrackpoints);
// }

// void writeCsv(File csvFile, List<DartTrackpoint> dartTrackpoints) {
//   var sink = csvFile.openWrite();
//   sink.write('time, sog\n');
//   for (int i = 0; i < dartTrackpoints.length; i++) {
//     sink.write('${dartTrackpoints[i].time}, ${dartTrackpoints[i].sog}\n');
//   }
//
//   // Close the IOSink to free system resources.
//   sink.close();
// }
//
// // File changed to Uint8List
// List<Record> readVtk(Uint8List inputFile) {
//   //final Uint8List fileBytes = inputFile.readAsBytesSync();
//   final Uint8List fileBytes = inputFile;
//   //print(fileBytes);
//   int i = 0;
//   int length = 0;
//   List<Record> records = [];
//   while (i < fileBytes.length) {
//     // Combine two length bytes to get length as an unsigned 16 bit integer.
//     length = fileBytes[i] + (fileBytes[i + 1] << 8);
//     i += 2;
//     var data = fileBytes.sublist(i, i + length);
//     Record r = Record.fromBuffer(data);
//     records.add(r);
//     // print('length = $length');
//     i += length;
//   }
//   return records;
// }
//
// class DartTrackpoint {
//   DateTime time = DateTime.utc(1982, 2, 13);
//   double sog = 0;
//   DartTrackpoint(Trackpoint trackpoint) {
//     time = DateTime.fromMillisecondsSinceEpoch(
//         1000 * trackpoint.seconds + 10 * trackpoint.centiseconds,
//         isUtc: true);
//     sog = trackpoint.sogKnotsE1 / 1e1;
//   }
//
//   @override
//   String toString() {
//     return '{time: ${time}, sog: ${sog}}';
//   }
// }
//
// List<DartTrackpoint> vtkRecordsToDartTrackpoints(List<Record> records) {
//   List<DartTrackpoint> dartTrackpoints = [];
//   for (int i = 0; i < records.length; i++) {
//     if (records[i].hasTrackpoint()) {
//       dartTrackpoints.add(DartTrackpoint(records[i].trackpoint));
//     }
//   }
//   return dartTrackpoints;
// }

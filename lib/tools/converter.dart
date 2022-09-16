import 'dart:typed_data';
import 'command_line_converter/protobuf/vtk.pb.dart';

List<Record> readVtk(Uint8List inputFile) {
  //final Uint8List fileBytes = inputFile.readAsBytesSync();
  final Uint8List fileBytes = inputFile;
  //print(fileBytes);
  int i = 0;
  int length = 0;
  List<Record> records = [];
  while (i < fileBytes.length) {
    // Combine two length bytes to get length as an unsigned 16 bit integer.
    length = fileBytes[i] + (fileBytes[i + 1] << 8);
    i += 2;
    var data = fileBytes.sublist(i, i + length);
    Record r = Record.fromBuffer(data);
    records.add(r);
    // print('length = $length');
    i += length;
  }
  return records;
}

class DartTrackpoint {
  DateTime time = DateTime.utc(1982, 2, 13);
  double sog = 0;
  DartTrackpoint(Trackpoint trackpoint) {
    time = DateTime.fromMillisecondsSinceEpoch(
        1000 * trackpoint.seconds + 10 * trackpoint.centiseconds,
        isUtc: true);
    sog = trackpoint.sogKnotsE1 / 1e1;
  }

  @override
  String toString() {
    return '{time: ${time}, sog: ${sog}}';
  }
}

List<DartTrackpoint> vtkRecordsToDartTrackpoints(List<Record> records) {
  List<DartTrackpoint> dartTrackpoints = [];
  for (int i = 0; i < records.length; i++) {
    if (records[i].hasTrackpoint()) {
      dartTrackpoints.add(DartTrackpoint(records[i].trackpoint));
    }
  }
  return dartTrackpoints;
}

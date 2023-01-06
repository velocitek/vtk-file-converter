///
//  Generated code. Do not modify.
//  source: vtk.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'vtk.pbenum.dart';

export 'vtk.pbenum.dart';

enum Record_Record {
  trackpoint, 
  timerEvent, 
  buttonEvent, 
  hardwareDescription, 
  magneticDeclination, 
  notSet
}

class Record extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Record_Record> _Record_RecordByTag = {
    1 : Record_Record.trackpoint,
    2 : Record_Record.timerEvent,
    16 : Record_Record.buttonEvent,
    17 : Record_Record.hardwareDescription,
    18 : Record_Record.magneticDeclination,
    0 : Record_Record.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Record', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'vtk'), createEmptyInstance: create)
    ..oo(0, [1, 2, 16, 17, 18])
    ..aOM<Trackpoint>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trackpoint', subBuilder: Trackpoint.create)
    ..aOM<TimerEvent>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timerEvent', subBuilder: TimerEvent.create)
    ..aOM<ButtonEvent>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonEvent', subBuilder: ButtonEvent.create)
    ..aOM<HardwareDescription>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareDescription', subBuilder: HardwareDescription.create)
    ..aOM<MagneticDeclination>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'magneticDeclination', subBuilder: MagneticDeclination.create)
    ..hasRequiredFields = false
  ;

  Record._() : super();
  factory Record({
    Trackpoint? trackpoint,
    TimerEvent? timerEvent,
    ButtonEvent? buttonEvent,
    HardwareDescription? hardwareDescription,
    MagneticDeclination? magneticDeclination,
  }) {
    final _result = create();
    if (trackpoint != null) {
      _result.trackpoint = trackpoint;
    }
    if (timerEvent != null) {
      _result.timerEvent = timerEvent;
    }
    if (buttonEvent != null) {
      _result.buttonEvent = buttonEvent;
    }
    if (hardwareDescription != null) {
      _result.hardwareDescription = hardwareDescription;
    }
    if (magneticDeclination != null) {
      _result.magneticDeclination = magneticDeclination;
    }
    return _result;
  }
  factory Record.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Record.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Record clone() => Record()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Record copyWith(void Function(Record) updates) => super.copyWith((message) => updates(message as Record)) as Record; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Record create() => Record._();
  Record createEmptyInstance() => create();
  static $pb.PbList<Record> createRepeated() => $pb.PbList<Record>();
  @$core.pragma('dart2js:noInline')
  static Record getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Record>(create);
  static Record? _defaultInstance;

  Record_Record whichRecord() => _Record_RecordByTag[$_whichOneof(0)]!;
  void clearRecord() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Trackpoint get trackpoint => $_getN(0);
  @$pb.TagNumber(1)
  set trackpoint(Trackpoint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrackpoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrackpoint() => clearField(1);
  @$pb.TagNumber(1)
  Trackpoint ensureTrackpoint() => $_ensure(0);

  @$pb.TagNumber(2)
  TimerEvent get timerEvent => $_getN(1);
  @$pb.TagNumber(2)
  set timerEvent(TimerEvent v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimerEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimerEvent() => clearField(2);
  @$pb.TagNumber(2)
  TimerEvent ensureTimerEvent() => $_ensure(1);

  @$pb.TagNumber(16)
  ButtonEvent get buttonEvent => $_getN(2);
  @$pb.TagNumber(16)
  set buttonEvent(ButtonEvent v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasButtonEvent() => $_has(2);
  @$pb.TagNumber(16)
  void clearButtonEvent() => clearField(16);
  @$pb.TagNumber(16)
  ButtonEvent ensureButtonEvent() => $_ensure(2);

  @$pb.TagNumber(17)
  HardwareDescription get hardwareDescription => $_getN(3);
  @$pb.TagNumber(17)
  set hardwareDescription(HardwareDescription v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasHardwareDescription() => $_has(3);
  @$pb.TagNumber(17)
  void clearHardwareDescription() => clearField(17);
  @$pb.TagNumber(17)
  HardwareDescription ensureHardwareDescription() => $_ensure(3);

  @$pb.TagNumber(18)
  MagneticDeclination get magneticDeclination => $_getN(4);
  @$pb.TagNumber(18)
  set magneticDeclination(MagneticDeclination v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasMagneticDeclination() => $_has(4);
  @$pb.TagNumber(18)
  void clearMagneticDeclination() => clearField(18);
  @$pb.TagNumber(18)
  MagneticDeclination ensureMagneticDeclination() => $_ensure(4);
}

class Trackpoint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Trackpoint', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'vtk'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seconds', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'centiseconds', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitudeE7', $pb.PbFieldType.OS3, protoName: 'latitudeE7')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitudeE7', $pb.PbFieldType.OS3, protoName: 'longitudeE7')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sogKnotsE1', $pb.PbFieldType.OU3, protoName: 'sog_knotsE1')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cog', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'q1E3', $pb.PbFieldType.OS3, protoName: 'q1E3')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'q2E3', $pb.PbFieldType.OS3, protoName: 'q2E3')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'q3E3', $pb.PbFieldType.OS3, protoName: 'q3E3')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'q4E3', $pb.PbFieldType.OS3, protoName: 'q4E3')
    ..hasRequiredFields = false
  ;

  Trackpoint._() : super();
  factory Trackpoint({
    $core.int? seconds,
    $core.int? centiseconds,
    $core.int? latitudeE7,
    $core.int? longitudeE7,
    $core.int? sogKnotsE1,
    $core.int? cog,
    $core.int? q1E3,
    $core.int? q2E3,
    $core.int? q3E3,
    $core.int? q4E3,
  }) {
    final _result = create();
    if (seconds != null) {
      _result.seconds = seconds;
    }
    if (centiseconds != null) {
      _result.centiseconds = centiseconds;
    }
    if (latitudeE7 != null) {
      _result.latitudeE7 = latitudeE7;
    }
    if (longitudeE7 != null) {
      _result.longitudeE7 = longitudeE7;
    }
    if (sogKnotsE1 != null) {
      _result.sogKnotsE1 = sogKnotsE1;
    }
    if (cog != null) {
      _result.cog = cog;
    }
    if (q1E3 != null) {
      _result.q1E3 = q1E3;
    }
    if (q2E3 != null) {
      _result.q2E3 = q2E3;
    }
    if (q3E3 != null) {
      _result.q3E3 = q3E3;
    }
    if (q4E3 != null) {
      _result.q4E3 = q4E3;
    }
    return _result;
  }
  factory Trackpoint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Trackpoint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Trackpoint clone() => Trackpoint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Trackpoint copyWith(void Function(Trackpoint) updates) => super.copyWith((message) => updates(message as Trackpoint)) as Trackpoint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Trackpoint create() => Trackpoint._();
  Trackpoint createEmptyInstance() => create();
  static $pb.PbList<Trackpoint> createRepeated() => $pb.PbList<Trackpoint>();
  @$core.pragma('dart2js:noInline')
  static Trackpoint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Trackpoint>(create);
  static Trackpoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get seconds => $_getIZ(0);
  @$pb.TagNumber(1)
  set seconds($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeconds() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get centiseconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set centiseconds($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCentiseconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearCentiseconds() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get latitudeE7 => $_getIZ(2);
  @$pb.TagNumber(3)
  set latitudeE7($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatitudeE7() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatitudeE7() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get longitudeE7 => $_getIZ(3);
  @$pb.TagNumber(4)
  set longitudeE7($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLongitudeE7() => $_has(3);
  @$pb.TagNumber(4)
  void clearLongitudeE7() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sogKnotsE1 => $_getIZ(4);
  @$pb.TagNumber(5)
  set sogKnotsE1($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSogKnotsE1() => $_has(4);
  @$pb.TagNumber(5)
  void clearSogKnotsE1() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cog => $_getIZ(5);
  @$pb.TagNumber(6)
  set cog($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCog() => $_has(5);
  @$pb.TagNumber(6)
  void clearCog() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get q1E3 => $_getIZ(6);
  @$pb.TagNumber(7)
  set q1E3($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasQ1E3() => $_has(6);
  @$pb.TagNumber(7)
  void clearQ1E3() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get q2E3 => $_getIZ(7);
  @$pb.TagNumber(8)
  set q2E3($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasQ2E3() => $_has(7);
  @$pb.TagNumber(8)
  void clearQ2E3() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get q3E3 => $_getIZ(8);
  @$pb.TagNumber(9)
  set q3E3($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasQ3E3() => $_has(8);
  @$pb.TagNumber(9)
  void clearQ3E3() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get q4E3 => $_getIZ(9);
  @$pb.TagNumber(10)
  set q4E3($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasQ4E3() => $_has(9);
  @$pb.TagNumber(10)
  void clearQ4E3() => clearField(10);
}

class TimerEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimerEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'vtk'), createEmptyInstance: create)
    ..e<TimerEvent_TimerEventType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TimerEvent_TimerEventType.TIMER_NONE, valueOf: TimerEvent_TimerEventType.valueOf, enumValues: TimerEvent_TimerEventType.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seconds', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TimerEvent._() : super();
  factory TimerEvent({
    TimerEvent_TimerEventType? type,
    $core.int? seconds,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (seconds != null) {
      _result.seconds = seconds;
    }
    return _result;
  }
  factory TimerEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimerEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimerEvent clone() => TimerEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimerEvent copyWith(void Function(TimerEvent) updates) => super.copyWith((message) => updates(message as TimerEvent)) as TimerEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimerEvent create() => TimerEvent._();
  TimerEvent createEmptyInstance() => create();
  static $pb.PbList<TimerEvent> createRepeated() => $pb.PbList<TimerEvent>();
  @$core.pragma('dart2js:noInline')
  static TimerEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimerEvent>(create);
  static TimerEvent? _defaultInstance;

  @$pb.TagNumber(1)
  TimerEvent_TimerEventType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TimerEvent_TimerEventType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get seconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set seconds($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeconds() => clearField(2);
}

class ButtonEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ButtonEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'vtk'), createEmptyInstance: create)
    ..e<ButtonEvent_ButtonEventType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ButtonEvent_ButtonEventType.BUTTON_NONE, valueOf: ButtonEvent_ButtonEventType.valueOf, enumValues: ButtonEvent_ButtonEventType.values)
    ..hasRequiredFields = false
  ;

  ButtonEvent._() : super();
  factory ButtonEvent({
    ButtonEvent_ButtonEventType? type,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory ButtonEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ButtonEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ButtonEvent clone() => ButtonEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ButtonEvent copyWith(void Function(ButtonEvent) updates) => super.copyWith((message) => updates(message as ButtonEvent)) as ButtonEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ButtonEvent create() => ButtonEvent._();
  ButtonEvent createEmptyInstance() => create();
  static $pb.PbList<ButtonEvent> createRepeated() => $pb.PbList<ButtonEvent>();
  @$core.pragma('dart2js:noInline')
  static ButtonEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ButtonEvent>(create);
  static ButtonEvent? _defaultInstance;

  @$pb.TagNumber(1)
  ButtonEvent_ButtonEventType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ButtonEvent_ButtonEventType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);
}

class HardwareDescription extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HardwareDescription', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'vtk'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modelId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firmwareId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serialNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  HardwareDescription._() : super();
  factory HardwareDescription({
    $core.int? modelId,
    $core.int? hardwareId,
    $core.int? firmwareId,
    $core.int? serialNumber,
  }) {
    final _result = create();
    if (modelId != null) {
      _result.modelId = modelId;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (firmwareId != null) {
      _result.firmwareId = firmwareId;
    }
    if (serialNumber != null) {
      _result.serialNumber = serialNumber;
    }
    return _result;
  }
  factory HardwareDescription.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HardwareDescription.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HardwareDescription clone() => HardwareDescription()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HardwareDescription copyWith(void Function(HardwareDescription) updates) => super.copyWith((message) => updates(message as HardwareDescription)) as HardwareDescription; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HardwareDescription create() => HardwareDescription._();
  HardwareDescription createEmptyInstance() => create();
  static $pb.PbList<HardwareDescription> createRepeated() => $pb.PbList<HardwareDescription>();
  @$core.pragma('dart2js:noInline')
  static HardwareDescription getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HardwareDescription>(create);
  static HardwareDescription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get modelId => $_getIZ(0);
  @$pb.TagNumber(1)
  set modelId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasModelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearModelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get hardwareId => $_getIZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get firmwareId => $_getIZ(2);
  @$pb.TagNumber(3)
  set firmwareId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirmwareId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirmwareId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get serialNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set serialNumber($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSerialNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearSerialNumber() => clearField(4);
}

class MagneticDeclination extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MagneticDeclination', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'vtk'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'declination', $pb.PbFieldType.OS3)
    ..hasRequiredFields = false
  ;

  MagneticDeclination._() : super();
  factory MagneticDeclination({
    $core.int? declination,
  }) {
    final _result = create();
    if (declination != null) {
      _result.declination = declination;
    }
    return _result;
  }
  factory MagneticDeclination.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MagneticDeclination.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MagneticDeclination clone() => MagneticDeclination()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MagneticDeclination copyWith(void Function(MagneticDeclination) updates) => super.copyWith((message) => updates(message as MagneticDeclination)) as MagneticDeclination; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MagneticDeclination create() => MagneticDeclination._();
  MagneticDeclination createEmptyInstance() => create();
  static $pb.PbList<MagneticDeclination> createRepeated() => $pb.PbList<MagneticDeclination>();
  @$core.pragma('dart2js:noInline')
  static MagneticDeclination getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MagneticDeclination>(create);
  static MagneticDeclination? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get declination => $_getIZ(0);
  @$pb.TagNumber(1)
  set declination($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeclination() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeclination() => clearField(1);
}


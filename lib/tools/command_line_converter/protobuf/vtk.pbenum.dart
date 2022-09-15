///
//  Generated code. Do not modify.
//  source: vtk.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TimerEvent_TimerEventType extends $pb.ProtobufEnum {
  static const TimerEvent_TimerEventType TIMER_NONE = TimerEvent_TimerEventType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMER_NONE');
  static const TimerEvent_TimerEventType TIMER_STARTED = TimerEvent_TimerEventType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMER_STARTED');
  static const TimerEvent_TimerEventType TIMER_STOPPED = TimerEvent_TimerEventType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMER_STOPPED');
  static const TimerEvent_TimerEventType TIMER_EXPIRED = TimerEvent_TimerEventType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMER_EXPIRED');
  static const TimerEvent_TimerEventType TIMER_TICK = TimerEvent_TimerEventType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMER_TICK');

  static const $core.List<TimerEvent_TimerEventType> values = <TimerEvent_TimerEventType> [
    TIMER_NONE,
    TIMER_STARTED,
    TIMER_STOPPED,
    TIMER_EXPIRED,
    TIMER_TICK,
  ];

  static final $core.Map<$core.int, TimerEvent_TimerEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TimerEvent_TimerEventType? valueOf($core.int value) => _byValue[value];

  const TimerEvent_TimerEventType._($core.int v, $core.String n) : super(v, n);
}

class ButtonEvent_ButtonEventType extends $pb.ProtobufEnum {
  static const ButtonEvent_ButtonEventType BUTTON_NONE = ButtonEvent_ButtonEventType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUTTON_NONE');
  static const ButtonEvent_ButtonEventType BUTTON_RC = ButtonEvent_ButtonEventType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUTTON_RC');
  static const ButtonEvent_ButtonEventType BUTTON_PIN = ButtonEvent_ButtonEventType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUTTON_PIN');
  static const ButtonEvent_ButtonEventType BUTTON_LINE_CLEARED = ButtonEvent_ButtonEventType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUTTON_LINE_CLEARED');
  static const ButtonEvent_ButtonEventType BUTTON_MAX = ButtonEvent_ButtonEventType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUTTON_MAX');

  static const $core.List<ButtonEvent_ButtonEventType> values = <ButtonEvent_ButtonEventType> [
    BUTTON_NONE,
    BUTTON_RC,
    BUTTON_PIN,
    BUTTON_LINE_CLEARED,
    BUTTON_MAX,
  ];

  static final $core.Map<$core.int, ButtonEvent_ButtonEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ButtonEvent_ButtonEventType? valueOf($core.int value) => _byValue[value];

  const ButtonEvent_ButtonEventType._($core.int v, $core.String n) : super(v, n);
}


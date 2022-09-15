///
//  Generated code. Do not modify.
//  source: vtk.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use recordDescriptor instead')
const Record$json = const {
  '1': 'Record',
  '2': const [
    const {'1': 'trackpoint', '3': 1, '4': 1, '5': 11, '6': '.vtk.Trackpoint', '9': 0, '10': 'trackpoint'},
    const {'1': 'timer_event', '3': 2, '4': 1, '5': 11, '6': '.vtk.TimerEvent', '9': 0, '10': 'timerEvent'},
    const {'1': 'button_event', '3': 16, '4': 1, '5': 11, '6': '.vtk.ButtonEvent', '9': 0, '10': 'buttonEvent'},
    const {'1': 'hardware_description', '3': 17, '4': 1, '5': 11, '6': '.vtk.HardwareDescription', '9': 0, '10': 'hardwareDescription'},
    const {'1': 'magnetic_declination', '3': 18, '4': 1, '5': 11, '6': '.vtk.MagneticDeclination', '9': 0, '10': 'magneticDeclination'},
  ],
  '8': const [
    const {'1': 'record'},
  ],
};

/// Descriptor for `Record`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordDescriptor = $convert.base64Decode('CgZSZWNvcmQSMQoKdHJhY2twb2ludBgBIAEoCzIPLnZ0ay5UcmFja3BvaW50SABSCnRyYWNrcG9pbnQSMgoLdGltZXJfZXZlbnQYAiABKAsyDy52dGsuVGltZXJFdmVudEgAUgp0aW1lckV2ZW50EjUKDGJ1dHRvbl9ldmVudBgQIAEoCzIQLnZ0ay5CdXR0b25FdmVudEgAUgtidXR0b25FdmVudBJNChRoYXJkd2FyZV9kZXNjcmlwdGlvbhgRIAEoCzIYLnZ0ay5IYXJkd2FyZURlc2NyaXB0aW9uSABSE2hhcmR3YXJlRGVzY3JpcHRpb24STQoUbWFnbmV0aWNfZGVjbGluYXRpb24YEiABKAsyGC52dGsuTWFnbmV0aWNEZWNsaW5hdGlvbkgAUhNtYWduZXRpY0RlY2xpbmF0aW9uQggKBnJlY29yZA==');
@$core.Deprecated('Use trackpointDescriptor instead')
const Trackpoint$json = const {
  '1': 'Trackpoint',
  '2': const [
    const {'1': 'seconds', '3': 1, '4': 1, '5': 13, '10': 'seconds'},
    const {'1': 'centiseconds', '3': 2, '4': 1, '5': 13, '10': 'centiseconds'},
    const {'1': 'latitudeE7', '3': 3, '4': 1, '5': 17, '10': 'latitudeE7'},
    const {'1': 'longitudeE7', '3': 4, '4': 1, '5': 17, '10': 'longitudeE7'},
    const {'1': 'sog_knotsE1', '3': 5, '4': 1, '5': 13, '10': 'sogKnotsE1'},
    const {'1': 'cog', '3': 6, '4': 1, '5': 13, '10': 'cog'},
    const {'1': 'q1E3', '3': 7, '4': 1, '5': 17, '10': 'q1E3'},
    const {'1': 'q2E3', '3': 8, '4': 1, '5': 17, '10': 'q2E3'},
    const {'1': 'q3E3', '3': 9, '4': 1, '5': 17, '10': 'q3E3'},
    const {'1': 'q4E3', '3': 10, '4': 1, '5': 17, '10': 'q4E3'},
  ],
};

/// Descriptor for `Trackpoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackpointDescriptor = $convert.base64Decode('CgpUcmFja3BvaW50EhgKB3NlY29uZHMYASABKA1SB3NlY29uZHMSIgoMY2VudGlzZWNvbmRzGAIgASgNUgxjZW50aXNlY29uZHMSHgoKbGF0aXR1ZGVFNxgDIAEoEVIKbGF0aXR1ZGVFNxIgCgtsb25naXR1ZGVFNxgEIAEoEVILbG9uZ2l0dWRlRTcSHwoLc29nX2tub3RzRTEYBSABKA1SCnNvZ0tub3RzRTESEAoDY29nGAYgASgNUgNjb2cSEgoEcTFFMxgHIAEoEVIEcTFFMxISCgRxMkUzGAggASgRUgRxMkUzEhIKBHEzRTMYCSABKBFSBHEzRTMSEgoEcTRFMxgKIAEoEVIEcTRFMw==');
@$core.Deprecated('Use timerEventDescriptor instead')
const TimerEvent$json = const {
  '1': 'TimerEvent',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.vtk.TimerEvent.TimerEventType', '10': 'type'},
    const {'1': 'seconds', '3': 2, '4': 1, '5': 5, '10': 'seconds'},
  ],
  '4': const [TimerEvent_TimerEventType$json],
};

@$core.Deprecated('Use timerEventDescriptor instead')
const TimerEvent_TimerEventType$json = const {
  '1': 'TimerEventType',
  '2': const [
    const {'1': 'TIMER_NONE', '2': 0},
    const {'1': 'TIMER_STARTED', '2': 1},
    const {'1': 'TIMER_STOPPED', '2': 2},
    const {'1': 'TIMER_EXPIRED', '2': 3},
    const {'1': 'TIMER_TICK', '2': 4},
  ],
};

/// Descriptor for `TimerEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timerEventDescriptor = $convert.base64Decode('CgpUaW1lckV2ZW50EjIKBHR5cGUYASABKA4yHi52dGsuVGltZXJFdmVudC5UaW1lckV2ZW50VHlwZVIEdHlwZRIYCgdzZWNvbmRzGAIgASgFUgdzZWNvbmRzImkKDlRpbWVyRXZlbnRUeXBlEg4KClRJTUVSX05PTkUQABIRCg1USU1FUl9TVEFSVEVEEAESEQoNVElNRVJfU1RPUFBFRBACEhEKDVRJTUVSX0VYUElSRUQQAxIOCgpUSU1FUl9USUNLEAQ=');
@$core.Deprecated('Use buttonEventDescriptor instead')
const ButtonEvent$json = const {
  '1': 'ButtonEvent',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.vtk.ButtonEvent.ButtonEventType', '10': 'type'},
  ],
  '4': const [ButtonEvent_ButtonEventType$json],
};

@$core.Deprecated('Use buttonEventDescriptor instead')
const ButtonEvent_ButtonEventType$json = const {
  '1': 'ButtonEventType',
  '2': const [
    const {'1': 'BUTTON_NONE', '2': 0},
    const {'1': 'BUTTON_RC', '2': 1},
    const {'1': 'BUTTON_PIN', '2': 2},
    const {'1': 'BUTTON_LINE_CLEARED', '2': 3},
    const {'1': 'BUTTON_MAX', '2': 4},
  ],
};

/// Descriptor for `ButtonEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buttonEventDescriptor = $convert.base64Decode('CgtCdXR0b25FdmVudBI0CgR0eXBlGAEgASgOMiAudnRrLkJ1dHRvbkV2ZW50LkJ1dHRvbkV2ZW50VHlwZVIEdHlwZSJqCg9CdXR0b25FdmVudFR5cGUSDwoLQlVUVE9OX05PTkUQABINCglCVVRUT05fUkMQARIOCgpCVVRUT05fUElOEAISFwoTQlVUVE9OX0xJTkVfQ0xFQVJFRBADEg4KCkJVVFRPTl9NQVgQBA==');
@$core.Deprecated('Use hardwareDescriptionDescriptor instead')
const HardwareDescription$json = const {
  '1': 'HardwareDescription',
  '2': const [
    const {'1': 'model_id', '3': 1, '4': 1, '5': 5, '10': 'modelId'},
    const {'1': 'hardware_id', '3': 2, '4': 1, '5': 5, '10': 'hardwareId'},
    const {'1': 'firmware_id', '3': 3, '4': 1, '5': 5, '10': 'firmwareId'},
    const {'1': 'serial_number', '3': 4, '4': 1, '5': 5, '10': 'serialNumber'},
  ],
};

/// Descriptor for `HardwareDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hardwareDescriptionDescriptor = $convert.base64Decode('ChNIYXJkd2FyZURlc2NyaXB0aW9uEhkKCG1vZGVsX2lkGAEgASgFUgdtb2RlbElkEh8KC2hhcmR3YXJlX2lkGAIgASgFUgpoYXJkd2FyZUlkEh8KC2Zpcm13YXJlX2lkGAMgASgFUgpmaXJtd2FyZUlkEiMKDXNlcmlhbF9udW1iZXIYBCABKAVSDHNlcmlhbE51bWJlcg==');
@$core.Deprecated('Use magneticDeclinationDescriptor instead')
const MagneticDeclination$json = const {
  '1': 'MagneticDeclination',
  '2': const [
    const {'1': 'declination', '3': 1, '4': 1, '5': 17, '10': 'declination'},
  ],
};

/// Descriptor for `MagneticDeclination`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List magneticDeclinationDescriptor = $convert.base64Decode('ChNNYWduZXRpY0RlY2xpbmF0aW9uEiAKC2RlY2xpbmF0aW9uGAEgASgRUgtkZWNsaW5hdGlvbg==');

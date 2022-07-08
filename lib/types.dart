
import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

typedef JSON = Map<String, dynamic>;

@JsonSerializable()
class Area {
  final List<Contact> contacts;
  final List<Device> devices;
  final List<String> notes;

  const Area({
    required this.contacts,
    required this.devices,
    this.notes = const [],
  });

  factory Area.fromJson(JSON json) => _$AreaFromJson(json);

  JSON toJson() => _$AreaToJson(this);
}

@JsonSerializable()
class Contact {
  final String name;
  final String phone;
  final int priority;
  final String email;
  final DateTime updated;

  const Contact({
    required this.name,
    required this.phone,
    required this.priority,
    required this.email,
    required this.updated,
  });

    factory Contact.fromJson(JSON json) => _$ContactFromJson(json);

  JSON toJson() => _$ContactToJson(this);
}

@JsonSerializable()
class Device {
  final int id;
  final String name;
  final String address;
  final bool online;
  final bool secure;
  final bool configured;
  final List<DeviceAction> actions;
  final List<String> notes;
  final String icon;

  const Device({
    required this.id,
    required this.name,
    required this.address,
    required this.online,
    required this.secure,
    required this.configured,
    required this.actions,
    required this.icon,
    this.notes = const [],
  });

  factory Device.fromJson(JSON json) => _$DeviceFromJson(json);

  JSON toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class DeviceAction {
  final String type;
  final String name;
  final bool outlined;

  const DeviceAction({
    required this.name,
    required this.type,
    this.outlined = false,
  });

  factory DeviceAction.fromJson(JSON json) => _$DeviceActionFromJson(json);

  JSON toJson() => _$DeviceActionToJson(this);
}


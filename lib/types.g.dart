// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      devices: (json['devices'] as List<dynamic>)
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'contacts': instance.contacts,
      'devices': instance.devices,
      'notes': instance.notes,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      name: json['name'] as String,
      phone: json['phone'] as String,
      priority: json['priority'] as int,
      email: json['email'] as String,
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'priority': instance.priority,
      'email': instance.email,
      'updated': instance.updated.toIso8601String(),
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      online: json['online'] as bool,
      secure: json['secure'] as bool,
      configured: json['configured'] as bool,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => DeviceAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      icon: json['icon'] as String,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'online': instance.online,
      'secure': instance.secure,
      'configured': instance.configured,
      'actions': instance.actions,
      'notes': instance.notes,
      'icon': instance.icon,
    };

DeviceAction _$DeviceActionFromJson(Map<String, dynamic> json) => DeviceAction(
      name: json['name'] as String,
      type: json['type'] as String,
      outlined: json['outlined'] as bool? ?? false,
    );

Map<String, dynamic> _$DeviceActionToJson(DeviceAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'outlined': instance.outlined,
    };

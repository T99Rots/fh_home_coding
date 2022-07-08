import 'package:fh_home_coding/api.dart';
import 'package:fh_home_coding/models/area_model.dart';
import 'package:fh_home_coding/types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'area_model_test.mocks.dart';

// fake api response data
const JSON mockDeviceJson = {
  "id": 1,
  "name": "Device",
  "icon": "smoke_detector",
  "address": "2_0",
  "online": true,
  "secure": true,
  "configured": true,
  "notes": [
    'note 1',
    'note 2',
  ],
  "actions": [
    {
      "id": 1,
      "name": 'action 1',
    },
    {
      "id": 2,
      "name": 'action 2',
      "outlined": true
    },
  ]
};

const JSON mockContactJson = {
  "id": 1,
  "name": "mock contact",
  "phone": "+31 123 45 678",
  "priority": 1,
  "email": "mock@email.com",
  "updated": "1970-01-01T01:00:00.000",
};


@GenerateMocks([Api])
void main() {
  final api = MockApi();

  when(api.getAreas()).thenAnswer((_) => Future.value([{
    "id": 1,
    "contacts": [
      mockContactJson
    ],
    "devices": [
      mockDeviceJson
    ],
    "notes": [
      "area note 1",
      "area note 2",
    ]
  }]));

  test('getAreas', () async {
    final model = AreaModel(api);

    await model.loadAreas();

    expect(model.areas.length, 1);
    expect(model.areas.first.contacts.length, 1);

    final contact = model.areas.first.contacts.first;
    expect(contact.id, equals(1));
    expect(contact.name, equals("mock contact"));
    expect(contact.phone, equals("+31 123 45 678"));
    expect(contact.priority, equals(1));
    expect(contact.email, equals("mock@email.com"));
    expect(contact.updated, equals(DateTime.fromMicrosecondsSinceEpoch(0)));

    expect(model.areas.first.devices.length, 1);

    final device = model.areas.first.devices.first;
    expect(device.id, equals(1));
    expect(device.name, equals("Device"));
    expect(device.icon, equals("smoke_detector"));
    expect(device.address, equals("2_0"));
    expect(device.online, isTrue);
    expect(device.secure, isTrue);
    expect(device.configured, isTrue);

    expect(device.notes.length, equals(2));
    expect(device.notes[0], equals('note 1'));
    expect(device.notes[1], equals('note 2'));

    expect(device.actions.length, equals(2));
    expect(device.actions[0].id, equals(1));
    expect(device.actions[0].name, equals('action 1'));
    expect(device.actions[0].outlined, isFalse);

    expect(device.actions[1].id, equals(2));
    expect(device.actions[1].name, equals('action 2'));
    expect(device.actions[1].outlined, isTrue);
  });

  test('addContact', () async {
    when(api.addContact(
      areaId: 1,
      name: 'mock contact 2',
      phone: '+31 876 54 321',
      email: 'mock2@email.com',
      priority: 2
    )).thenAnswer((_) => Future.value({
      'updated': DateTime.fromMillisecondsSinceEpoch(1640979000000).toIso8601String(),
      'id': 123
    }));

    final model = AreaModel(api);
    await model.loadAreas();

    await model.addContact(
      area: model.areas.first,
      name: 'mock contact 2',
      phone: '+31 876 54 321',
      email: 'mock2@email.com',
      priority: 2
    );

    expect(model.areas.first.contacts.length, equals(2));
    
    final contact = model.areas.first.contacts[1];
    expect(contact.updated, equals(DateTime.fromMillisecondsSinceEpoch(1640979000000)));
    expect(contact.id, equals(123));
    expect(contact.name, equals('mock contact 2'));
    expect(contact.phone, equals('+31 876 54 321'));
    expect(contact.email, equals('mock2@email.com'));
    expect(contact.priority, equals(2));
  });

  test('removeContact', () async {
    final model = AreaModel(api);
    await model.loadAreas();

    await model.removeContact(
      area: model.areas.first,
      contact: model.areas.first.contacts.first
    );

    expect(model.areas.first.contacts.length, equals(0));
  });

  test('addDevice', () async {
    when(api.addDevice(
      areaId: 1,
      address: '3_0'
    )).thenAnswer((_) => Future.value({
      ...mockDeviceJson,
      "address": '3_0'
    }));

    final model = AreaModel(api);
    await model.loadAreas();

    await model.addDevice(
      area: model.areas.first,
      address: '3_0'
    );

    expect(model.areas.first.devices.length, equals(2));

    final device = model.areas.first.devices[1];
    expect(device.id, equals(1));
    expect(device.name, equals("Device"));
    expect(device.icon, equals("smoke_detector"));
    expect(device.address, equals("3_0"));
    expect(device.online, isTrue);
    expect(device.secure, isTrue);
    expect(device.configured, isTrue);

    expect(device.notes.length, equals(2));
    expect(device.notes[0], equals('note 1'));
    expect(device.notes[1], equals('note 2'));

    expect(device.actions.length, equals(2));
    expect(device.actions[0].id, equals(1));
    expect(device.actions[0].name, equals('action 1'));
    expect(device.actions[0].outlined, isFalse);

    expect(device.actions[1].id, equals(2));
    expect(device.actions[1].name, equals('action 2'));
    expect(device.actions[1].outlined, isTrue);
  });

  test('removeDevice', () async {
    final model = AreaModel(api);
    await model.loadAreas();

    await model.removeDevice(
      area: model.areas.first,
      device: model.areas.first.devices.first
    );

    expect(model.areas.first.devices.length, equals(0));
  });

}
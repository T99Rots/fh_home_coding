import 'package:fh_home_coding/types.dart';

// fake api response data
const JSON _smokeDetectorJson = {
  "id": 1,
  "name": "Smoke detector",
  "icon": "smoke_detector",
  "address": "2_0",
  "online": false,
  "secure": false,
  "configured": true,
  "notes": [
    "Praesent placerat risus quis eros.",
    "Fusce pellentesque suscipit nibh.",
    "Integer vitae libero ac risus egestas placerat.",
    "Vestibulum commodo felis quis tortor.",
    "Ut aliquam sollicitudin leo.",
    "Cras iaculis ultricies nulla.",
    "Donec quis dui at dolor tempor interdum.",
  ],
  "actions": [
    {
      "id": 1,
      "name": 'Delete',
    },
    {
      "id": 2,
      "name": 'identify',
    },
    {
      "id": 3,
      "name": 'Ping',
    },
    {
      "id": 4,
      "name": 'Sensitivity',
    },
    {
      "id": 5,
      "name": 'Test siren',
      "outlined": true
    },
  ]
};

const JSON _waterLeakDetectorJson = {
  "id": 1,
  "name": 'Water leak detector',
  "icon": 'water_leak_detector',
  "address": '2_0',
  "online": true,
  "secure": true,
  "configured": true,
  "notes": [
    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
    "Aliquam tincidunt mauris eu risus.",
    "Vestibulum auctor dapibus neque.",
    "Nunc dignissim risus id metus.",
    "Cras ornare tristique elit.",
    "Vivamus vestibulum ntulla nec ante.",
  ],
  "actions": [
    {
      "id": 1,
      "name": 'Identify',
    },
    {
      "id": 2,
      "name": 'Ping',
    },
  ],
};

const JSON _contactJson = {
  "id": 1,
  "name": "Board member",
  "phone": "+47 444 44 444",
  "priority": 1,
  "email": "mario@castle.com",
  "updated": "1970-01-01T01:00:00.000",
};

int _idCounter = 10;

// a fake async api
class Api {
  Future<List<JSON>> getAreas() async {
    await Future.delayed(const Duration(milliseconds: 125));
    return [{
      "id": 1,
      "contacts": [
        _contactJson
      ],
      "devices": [
        _smokeDetectorJson,
        _waterLeakDetectorJson
      ],
      "notes": [
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
        "Aliquam tincidunt mauris eu risus.",
      ]
    }];
  }

  Future<JSON> addContact({
    required int areaId,
    required String name,
    required String phone,
    required String email,
    required int priority
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
    return {
      'updated': DateTime.now().toIso8601String(),
      'id': _idCounter++
    };
  }

  Future<void> removeContact({
    required int areaId,
    required Contact contact,
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
  }

  Future<JSON> addDevice({
    required int areaId,
    required String address
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
    return _smokeDetectorJson;
  }

  Future<void> removeDevice({
    required int areaId,
    required int deviceId
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
  }

  Future<void> executeDeviceAction({
    required int areaId,
    required int deviceId,
    required int deviceActionId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
  }
}
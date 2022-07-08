import 'package:fh_home_coding/types.dart';

// fake api response data
const Map<String, dynamic> smokeDetectorJson = {
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
      "type": "delete",
      "name": 'Delete',
    },
    {
      "type": "identify",
      "name": 'identify',
    },
    {
      "type": "ping",
      "name": 'Ping',
    },
    {
      "type": "sensitivity",
      "name": 'Sensitivity',
    },
    {
      "type": "test_siren",
      "name": 'Test siren',
      "outlined": true
    },
  ]
};

const Map<String, dynamic> waterLeakDetectorJson = {
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
      "type": 'identify',
      "name": 'Identify',
    },
    {
      "type": 'ping',
      "name": 'Ping',
    },
  ],
};

const Map<String, dynamic> contactJson = {
  "name": "Board member",
  "phone": "+47 444 44 444",
  "priority": 1,
  "email": "mario@castle.com",
  "updated": "1970-01-01T01:00:00.000",
};

// a async mockup api
class MockApi {
  Future<List<Area>> getAreas() async {
    await Future.delayed(const Duration(milliseconds: 125));
    final List<Map<String, dynamic>> apiResponse = [{
      "contacts": [
        contactJson
        ],
      "devices": [
        smokeDetectorJson,
        waterLeakDetectorJson
      ]
    }];

    final List<Area> areas = [];
    for(final areaJson in apiResponse) {
      areas.add(Area.fromJson(areaJson));
    }
    return areas;
  }

  Future<Contact> addContact({
    required Area area,
    required String name,
    required String phone,
    required String email,
    required int priority
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
    final String apiResponse = DateTime.now().toIso8601String();

    return Contact(
      name: name,
      phone: phone,
      priority: priority,
      email: email,
      updated: DateTime.parse(apiResponse)
    );
  }

  Future<void> removeContact({
    required Area area,
    required Contact contact,
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
  }

  Future<Device> addDevice({
    required Area area,
    required String address
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
    const apiResponse = smokeDetectorJson;

    return Device.fromJson(apiResponse);
  }

  Future<void> removeDevice({
    required Area area,
    required Device device
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
  }

  Future<void> executeDeviceAction({
    required Area area,
    required Device device,
    required DeviceAction deviceAction,
  }) async {
    await Future.delayed(const Duration(milliseconds: 125));
  }
}
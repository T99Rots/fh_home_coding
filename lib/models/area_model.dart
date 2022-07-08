import 'package:fh_home_coding/api.dart';
import 'package:fh_home_coding/types.dart';
import 'package:flutter/material.dart';

class AreaModel extends ChangeNotifier {
  final Api _api;
  bool _loaded = false;
  List<Area> _areas = [];

  AreaModel(this._api);

  bool get loaded => _loaded;
  List<Area> get areas => _areas;

  Future<void> loadAreas() async {
    final json = await _api.getAreas();
    _areas = [];
    for(final areaJson in json) {
      _areas.add(Area.fromJson(areaJson));
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> addContact({
    required Area area,
    required String name,
    required String phone,
    required String email,
    required int priority
  }) async {
    final json = await _api.addContact(
      areaId: area.id,
      name: name,
      phone: phone,
      email: email,
      priority: priority
    );
    area.contacts.add(Contact(
      id: json['id'],
      name: name,
      phone: phone,
      priority: priority,
      email: email,
      updated: DateTime.parse(json['updated'])
    ));
    notifyListeners();
  }

  Future<void> removeContact({
    required Area area,
    required Contact contact
  }) async {
    await _api.removeContact(
      areaId: area.id,
      contact: contact
    );
    area.contacts.remove(contact);
    notifyListeners();
  }

  Future<void> addDevice({
    required Area area,
    required String address,
  }) async {
    final device = await _api.addDevice(
      areaId: area.id,
      address: address
    );
    area.devices.add(Device.fromJson(device));
    notifyListeners();
  }
  
  Future<void> removeDevice({
    required Area area,
    required Device device
  }) async {
    await _api.removeDevice(
      areaId: area.id,
      deviceId: device.id
    );
    area.devices.remove(device);
    notifyListeners();
  }

  Future<void> executeDeviceAction({
    required Area area,
    required Device device,
    required DeviceAction deviceAction
  }) async {
    await _api.executeDeviceAction(
      areaId: area.id,
      deviceId: device.id,
      deviceActionId: deviceAction.id,
    );
    notifyListeners();
  }
}
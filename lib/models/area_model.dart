import 'package:fh_home_coding/mock_api.dart';
import 'package:fh_home_coding/types.dart';
import 'package:flutter/material.dart';

class AreaModel extends ChangeNotifier {
  final MockApi _api;
  bool _loaded = false;
  List<Area> _areas = [];

  AreaModel(this._api);

  bool get loaded => _loaded;
  List<Area> get areas => _areas;

  Future<void> loadAreas() async {
    _areas = await _api.getAreas();
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
    final contact = await _api.addContact(
      area: area,
      name: name,
      phone: phone,
      email: email,
      priority: priority
    );
    area.contacts.add(contact);
    notifyListeners();
  }

  Future<void> removeContact({
    required Area area,
    required Contact contact
  }) async {
    await _api.removeContact(
      area: area,
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
      area: area,
      address: address
    );
    area.devices.add(device);
    notifyListeners();
  }
  
  Future<void> removeDevice({
    required Area area,
    required Device device
  }) async {
    await _api.removeDevice(
      area: area,
      device: device
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
      area: area,
      device: device,
      deviceAction: deviceAction,
    );
    notifyListeners();
  }
}
import 'package:fh_home_coding/components/room_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8e8e8),
      appBar: AppBar(
        backgroundColor: const Color(0xff212121),
        title: const Text('Future Home coding assignment'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1160
          ),
          child: RoomCard(
            notes: 8,
            onAddContact: () {},
            onAddDevice: () {},
            onAddRoom: () {},
            contacts: [
              Contact(
                name: 'Board member',
                phone: '+47 444 44 444',
                priority: 1,
                email: 'mario@castle.com',
                onDelete: () {},
                onEdit: () {},
                updated: DateTime.fromMillisecondsSinceEpoch(0)
              )
            ],
            devices: [
              Device(
                id: 1,
                name: 'Smoke detector',
                address: '2_0',
                online: false,
                secure: false,
                configured: true,
                notes: 8,
                icon: SvgPicture.asset('assets/SDCO.svg'),
                actions: [
                  DeviceAction(
                    name: 'Edit',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'Unpair',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'Delete',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'identify',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'Ping',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'Sensitivity',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'Test siren',
                    outlined: true,
                    onPressed: () {}
                  ),
                ],
              ),
              Device(
                id: 1,
                name: 'Water leak detector',
                address: '2_0',
                online: true,
                secure: true,
                configured: true,
                notes: 8,
                icon: SvgPicture.asset('assets/WLS.svg'),
                actions: [
                  DeviceAction(
                    name: 'Edit',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'Unpair',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'identify',
                    onPressed: () {}
                  ),
                  DeviceAction(
                    name: 'Ping',
                    onPressed: () {}
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
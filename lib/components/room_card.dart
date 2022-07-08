import 'package:fh_home_coding/components/button.dart';
import 'package:fh_home_coding/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoomCard extends StatelessWidget {
  final List<Contact> contacts;
  final List<Device> devices;
  final int notes;
  final VoidCallback onAddContact;
  final VoidCallback onAddDevice;
  final VoidCallback onAddRoom;

  const RoomCard({
    Key? key,
    required this.contacts,
    required this.devices,
    required this.onAddContact,
    required this.onAddDevice,
    required this.onAddRoom,
    required this.notes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const warningTextStyle = TextStyle(
      color: Color(0xffF18303),
      fontWeight: FontWeight.w600
    );

    return CustomCard(
      leading: SizedBox(
        width: 25,
        height: 25,
        child: SvgPicture.asset('assets/stairs.svg')
      ),
      title: 'Common area',
      actions: [
        CustomButton(
          text: const Text('CONTACT'),
          leading: const Icon(Icons.add),
          onPressed: onAddContact
        ),
        CustomButton(
          text: const Text('ROOM'),
          leading: const Icon(Icons.add),
          onPressed: onAddRoom
        ),
        CustomButton(
          text: const Text('DEVICE'),
          leading: const Icon(Icons.add),
          onPressed: onAddDevice
        ),
        CustomButton(
          text: Text('${notes} NOTES'),
          trailing: const Icon(Icons.navigate_next),
          onPressed: () {}
        )
      ],
      children: [
        ...contacts.map((contact) => CardRow(
          headerRowItems: [
            CardRowItem(
              text: Text(contact.name),
              leading: SvgPicture.asset('assets/mario.svg'),
              onCopy: () {},
            ),
            CardRowItem(
              text: Text(contact.phone),
              leading: SvgPicture.asset('assets/Phone.svg'),
              onCopy: () {},
            ),
            CardRowItem(
              text: Text('Priority ${contact.priority}'),
            ),
            CardRowItem(
              text: Text(contact.email),
              leading: SvgPicture.asset('assets/Email.svg'),
              onCopy: () {},
            )
          ],
          info: [
            CardInfoRow(
              title: const Text('UPDATED AT'),
              data: Text(contact.updated.toString()),
            )
          ],
          leadingActions: [
            CustomButton(
              text: const Text('EDIT'),
              onPressed: contact.onEdit
            ),
            CustomButton(
              text: const Text('DELETE'),
              onPressed: contact.onDelete
            ),
          ],
        )),
        ...devices.map((device) => CardRow(
          headerRowItems: [
            CardRowItem(
              text: Text(device.name),
              leading: device.icon,
            ),
            CardRowItem(
              text: device.online? const Text('Online'): const Text(
                'Offline',
                style: warningTextStyle
              ),
              leading: device.online? SvgPicture.asset('assets/Check.svg'): SvgPicture.asset('assets/Exclamation.svg'),
            ),
            CardRowItem(
              text: device.secure? const Text('Secured'): const Text(
                'Tampered',
                style: warningTextStyle
              ),
              leading: device.secure? SvgPicture.asset('assets/Check.svg'): SvgPicture.asset('assets/Exclamation.svg'),
            ),
            CardRowItem(
              text: device.configured? const Text('Configured'): const Text(
                'Tampered',
                style: warningTextStyle
              ),
              leading: device.configured? SvgPicture.asset('assets/Check.svg'): SvgPicture.asset('assets/Exclamation.svg'),
            ),
          ],
          info: [
            CardInfoRow(
              title: const Text('ADDRESS'),
              data: Text(device.address),
              onCopy: () {},
            ),
            CardInfoRow(
              title: const Text('DEVICE ID'),
              data: Text(device.id.toString())
            )
          ],
          leadingActions: [
            ...device.actions.map((action) => CustomButton(
              text: Text(action.name.toUpperCase()),
              onPressed: action.onPressed,
              outlined: action.outlined,
            ))
          ],
          trailingActions: [
            CustomButton(
              text: const Text('TIMELINE'),
              trailing: const Icon(Icons.navigate_next),
              onPressed: () {}
            ),
            CustomButton(
              text: Text('${device.notes} NOTES'),
              trailing: const Icon(Icons.navigate_next),
              onPressed: () {}
            ),
          ],
        )),
      ],
    );
  }
}

class Contact {
  final String name;
  final String phone;
  final int priority;
  final String email;
  final DateTime updated;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const Contact({
    required this.name,
    required this.phone,
    required this.priority,
    required this.email,
    required this.onDelete,
    required this.onEdit,
    required this.updated,
  });
}

class Device {
  final int id;
  final String name;
  final String address;
  final bool online;
  final bool secure;
  final bool configured;
  final List<DeviceAction> actions;
  final int notes;
  final Widget icon;

  const Device({
    required this.id,
    required this.name,
    required this.address,
    required this.online,
    required this.secure,
    required this.configured,
    required this.actions,
    required this.notes,
    required this.icon,
  });
}

class DeviceAction {
  final String name;
  final VoidCallback onPressed;
  final bool outlined;

  const DeviceAction({
    required this.name,
    required this.onPressed,
    this.outlined = false,
  });
}
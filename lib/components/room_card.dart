import 'package:fh_home_coding/components/button.dart';
import 'package:fh_home_coding/components/card.dart';
import 'package:fh_home_coding/device_icons.dart';
import 'package:fh_home_coding/models/area_model.dart';
import 'package:fh_home_coding/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RoomCard extends StatelessWidget {
  final Area area;

  const RoomCard({
    Key? key,
    required this.area
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const warningTextStyle = TextStyle(
      color: Color(0xffF18303),
      fontWeight: FontWeight.w600
    );

    getModel() => context.read<AreaModel>();

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
          onPressed: () {
            getModel().addContact(
              area: area,
              name: 'New contact',
              phone: '+31 1234 56 789',
              email: 'email@example.com',
              priority: 1
            );
          }
        ),
        CustomButton(
          text: const Text('ROOM'),
          leading: const Icon(Icons.add),
          onPressed: () {}
        ),
        CustomButton(
          text: const Text('DEVICE'),
          leading: const Icon(Icons.add),
          onPressed: () {
            getModel().addDevice(
              area: area,
              address: '3_0'
            );
          }
        ),
        CustomButton(
          text: Text('${area.notes.length} NOTES'),
          trailing: const Icon(Icons.navigate_next),
          onPressed: () {}
        )
      ],
      children: [
        ...area.contacts.map((contact) => CardRow(
          key: ValueKey(contact),
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
              onPressed: () {}
            ),
            CustomButton(
              text: const Text('DELETE'),
              onPressed: () {
                getModel().removeContact(
                  area: area,
                  contact: contact
                );
              }
            ),
          ],
        )),
        ...area.devices.map((device) => CardRow(
          key: ValueKey(device),
          headerRowItems: [
            CardRowItem(
              text: Text(device.name),
              leading: getDeviceIcon(device.icon),
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
            CustomButton(
              text: const Text('EDIT'),
              onPressed: () {

              },
            ),
            CustomButton(
              text: const Text('UNPAIR'),
              onPressed: () {
                getModel().removeDevice(
                  area: area,
                  device: device
                );
              },
            ),
            ...device.actions.map((action) => CustomButton(
              key: ValueKey(action),
              text: Text(action.name.toUpperCase()),
              onPressed: () {
                getModel().executeDeviceAction(
                  area: area,
                  device: device,
                  deviceAction: action
                );
              },
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
              text: Text('${device.notes.length} NOTES'),
              trailing: const Icon(Icons.navigate_next),
              onPressed: () {}
            ),
          ],
        )),
      ],
    );
  }
}
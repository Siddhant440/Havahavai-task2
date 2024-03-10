import 'package:flutter/material.dart';
import 'package:task/utilities/custom_colors.dart';
import 'package:flutter_svg/svg.dart';

class DropdownIcon extends StatelessWidget {
  final Function(String)? onItemSelected;

  const DropdownIcon({super.key, this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(-145, 40),
      color: Colors.white,
      shadowColor: CustomColors.color1,
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'My Flights',
            child: Container(
              width: 200,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: CustomColors.border2))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('assets/images/me.svg',
                          height: 18, width: 25),
                    ),
                    const SizedBox(width: 20),
                    const Text('My Flights'),
                  ],
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: "Friend's flights",
            child: SizedBox(
              width: 190,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('assets/images/friend.svg'),
                    ),
                    const SizedBox(width: 12),
                    const Text("Friend's flights"),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (onItemSelected != null) {
          onItemSelected!(value.toString());
        }
      },
      child: const Icon(
        Icons.keyboard_arrow_down,
        color: CustomColors.color1,
      ),
    );
  }
}

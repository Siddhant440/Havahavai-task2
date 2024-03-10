import 'package:flutter/material.dart';
import 'package:task/utilities/custom_colors.dart';
import 'package:task/utilities/custom_texts.dart';

class FlightInfoRow extends StatelessWidget {
  final String photo;
  final String flightCount;
  final String countriesCount;
  final String distanceKm;

  const FlightInfoRow({
    Key? key,
    required this.photo,
    required this.flightCount,
    required this.countriesCount,
    required this.distanceKm,
  }) : super(key: key);

  String _formatNumberWithCommas(String number) {
    return number.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(photo),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flights',
                style: CustomTextStyles.s12w500
                    .copyWith(color: CustomColors.color4),
              ),
              const SizedBox(height: 5),
              Text(_formatNumberWithCommas(flightCount),
                  style: CustomTextStyles.s16w500),
            ],
          ),
          const SizedBox(width: 7),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Countries',
                style: CustomTextStyles.s12w500
                    .copyWith(color: CustomColors.color4),
              ),
              const SizedBox(height: 5),
              Text(_formatNumberWithCommas(countriesCount),
                  style: CustomTextStyles.s16w500),
            ],
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Distance',
                style: CustomTextStyles.s12w500
                    .copyWith(color: CustomColors.color4),
              ),
              const SizedBox(height: 5),
              Text('${_formatNumberWithCommas(distanceKm)}km',
                  style: CustomTextStyles.s16w500),
            ],
          ),
        ],
      ),
    );
  }
}

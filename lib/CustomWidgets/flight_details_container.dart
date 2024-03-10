import 'package:flutter/material.dart';
import 'flight_details.dart';
import 'boarding_countdown_widget.dart';
import 'custom_chips.dart';

class FlightDetailsContainer extends StatelessWidget {
  final String dayDate;
  final String flightInfo;
  final String departureCity;
  final String departureFullCity;
  final String departureTime;
  final String arrivalCity;
  final String arrivalFullCity;
  final String arrivalTime;
  final String flightDuration;

  const FlightDetailsContainer({
    super.key,
    required this.dayDate,
    required this.flightInfo,
    required this.departureCity,
    required this.departureFullCity,
    required this.departureTime,
    required this.arrivalCity,
    required this.arrivalFullCity,
    required this.arrivalTime,
    required this.flightDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlightDetails(
          dayDate: dayDate,
          flightInfo: flightInfo,
          departureCity: departureCity,
          departureFullCity: departureFullCity,
          departureTime: departureTime,
          arrivalCity: arrivalCity,
          arrivalFullCity: arrivalFullCity,
          arrivalTime: arrivalTime,
          flightDuration: flightDuration,
        ),
        const CountdownWidget(),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomChip(
              text: 'Boarding Pass',
              iconData: Icons.airplane_ticket_rounded,
            ),
            CustomChip(
              text: 'Share Trip',
              imagePath: 'assets/images/whatsapp.svg',
            ),
            CustomChip(text: "..."),
          ],
        )
      ],
    );
  }
}

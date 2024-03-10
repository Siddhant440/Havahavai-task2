import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'CustomWidgets/drop_down_box.dart';
import 'utilities/custom_texts.dart';
import 'utilities/custom_colors.dart';
import 'CustomWidgets/stats_container.dart';
import 'CustomWidgets/flight_details_container.dart';

class MyFlightScreen extends StatefulWidget {
  const MyFlightScreen({super.key});

  @override
  State<MyFlightScreen> createState() => _MyFlightScreenState();
}

class _MyFlightScreenState extends State<MyFlightScreen> {
  String _selectedOptionText = 'My Flights';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 235,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FlightInfoRow(
                          photo: 'assets/images/profile.jpg',
                          flightCount: '04',
                          countriesCount: '06',
                          distanceKm: '4287'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(_selectedOptionText,
                            style: CustomTextStyles.s26Bold),
                        const SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: CustomColors.border),
                          child: DropdownIcon(
                            onItemSelected: (value) {
                              setState(() {
                                _selectedOptionText = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        CustomColors.color1,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('assets/images/search.svg'),
                    ),
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        CustomColors.color1,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('assets/images/add.svg'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 80),
              const FlightDetailsContainer(
                dayDate: 'Mon, 20 Dec 24',
                flightInfo: '6E 725',
                departureCity: 'DEL',
                departureFullCity: '🇮🇳 New Delhi',
                departureTime: '08:15',
                arrivalCity: 'BOM',
                arrivalFullCity: ' Mumbai 🇵🇭',
                arrivalTime: '10:15',
                flightDuration: '2h 5m',
              ),
              const SizedBox(height: 80),
              const FlightDetailsContainer(
                dayDate: 'Mon, 24 Dec 24',
                flightInfo: '6E 725',
                departureCity: 'IND',
                departureFullCity: '🇮🇳 India',
                departureTime: '01:15',
                arrivalCity: 'PHL',
                arrivalFullCity: ' Philippines 🇵🇭',
                arrivalTime: '12:20',
                flightDuration: '11h 5m',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

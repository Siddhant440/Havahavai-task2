import 'package:flutter/material.dart';
import 'package:task/utilities/dash_separator.dart';
import 'package:task/utilities/custom_colors.dart';
import 'package:task/utilities/custom_texts.dart';
import 'package:flutter_svg/svg.dart';

class FlightDetails extends StatelessWidget {
  final String dayDate;
  final String flightInfo;
  final String departureCity;
  final String departureFullCity;
  final String departureTime;
  final String arrivalCity;
  final String arrivalFullCity;
  final String arrivalTime;
  final String flightDuration;

  const FlightDetails({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(dayDate, style: CustomTextStyles.s14w500),
                        ],
                      ),
                    ),
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.indigo,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset('assets/images/flight.svg',
                          height: 20, width: 20),
                    ),
                    const SizedBox(width: 8),
                    Text(flightInfo, style: CustomTextStyles.s12w500),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const DashSeparator(color: Colors.grey),
              const SizedBox(height: 17),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(departureCity, style: CustomTextStyles.s20w500),
                          const SizedBox(width: 5),
                          Text(departureTime,
                              style: CustomTextStyles.s20w500.copyWith(
                                  color: CustomColors.arrivalTimeGreen)),
                        ],
                      ),
                      Text(
                        flightDuration,
                        style: CustomTextStyles.s12w500
                            .copyWith(color: CustomColors.color4),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(arrivalTime,
                                  style: CustomTextStyles.s20w500),
                              const SizedBox(width: 5),
                              Text(arrivalCity,
                                  style: CustomTextStyles.s20w500),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(departureFullCity,
                          style: CustomTextStyles.s12w500
                              .copyWith(color: CustomColors.color3)),
                      Text(arrivalFullCity,
                          style: CustomTextStyles.s12w500
                              .copyWith(color: CustomColors.color3))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

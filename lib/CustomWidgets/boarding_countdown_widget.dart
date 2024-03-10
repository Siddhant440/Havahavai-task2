import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task/utilities/custom_colors.dart';
import 'package:task/utilities/custom_texts.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  int _seconds = 30;
  bool _boardingClosed = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_seconds == 0) {
        _timer.cancel();
        setState(() {
          _boardingClosed = true;
        });
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: 69,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.color1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Boarding closes in $minutesStr:$secondsStr',
                      style: CustomTextStyles.s14wBold,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _boardingClosed ? 'Boarding Closed' : 'On Time',
                      style: CustomTextStyles.s12w500.copyWith(
                        color:
                            _boardingClosed ? Colors.red : CustomColors.color4,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.boarding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.door_back_door,
                        color: CustomColors.color1),
                    Text('T20',
                        style: CustomTextStyles.s14wBold
                            .copyWith(color: CustomColors.color1)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

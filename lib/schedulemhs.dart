import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleMHS extends StatelessWidget {
  const ScheduleMHS({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double height1 = (height / 2) - 40;
    final double height2 = height1;
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 231, 231, 231),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  width: width / 5,
                  height: height1,
                  child: SfCalendar(
                    backgroundColor: Colors.white,
                    view: CalendarView.month,
                    showNavigationArrow: true,
                  ),
                ),
                Container(
                  width: width / 5,
                  height: height2,
                  color: const Color.fromARGB(255, 231, 231, 231),
                ),
              ],
            ),
            SizedBox(
              width: width * 4 / 5,
              height: height,
              child: SfCalendar(
                backgroundColor: Colors.white,
                view: CalendarView.week,
                showNavigationArrow: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

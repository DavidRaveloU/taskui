import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskui/utils/app_colors.dart';

class HeaderInfo extends StatefulWidget {
  final double screenWidth;
  const HeaderInfo({super.key, required this.screenWidth});
  @override
  State<HeaderInfo> createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  Stream<Map<String, String>> getDateTimeStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      final now = DateTime.now();
      yield {
        'day': _getAbbreviatedDay(now),
        'number': now.day.toString().padLeft(2, '0'),
        'month': _getMonth(now),
        'year': now.year.toString(),
      };
    }
  }

  String _getAbbreviatedDay(DateTime now) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[now.weekday - 1];
  }

  String _getMonth(DateTime now) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[now.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: StreamBuilder<Map<String, String>>(
        stream: getDateTimeStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '${data['day']}',
                      maxFontSize: 100,
                      style: TextStyle(
                          color: AppColors.title,
                          fontSize: widget.screenWidth * 0.13,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: widget.screenWidth * 0.226,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Color(0xFF0062D1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AutoSizeText(
                      textAlign: TextAlign.right,
                      '${data['month']} ${data['number']}',
                      maxFontSize: 80,
                      style: TextStyle(
                          fontSize: widget.screenWidth * 0.065,
                          color: AppColors.subtitle,
                          fontWeight: FontWeight.w600),
                    ),
                    AutoSizeText(
                      '${data['year']}',
                      textAlign: TextAlign.right,
                      maxFontSize: 80,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.subtitle2,
                        fontSize: widget.screenWidth * 0.065,
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return ShimmerEffect(widget: widget);
          }
        },
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.widget,
  });

  final HeaderInfo widget;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: widget.screenWidth * 0.2,
                height: widget.screenWidth * 0.13,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Container(
                width: widget.screenWidth * 0.226,
                height: 7,
                color: Colors.white,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: widget.screenWidth * 0.4,
                height: widget.screenWidth * 0.065,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Container(
                width: widget.screenWidth * 0.3,
                height: widget.screenWidth * 0.065,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

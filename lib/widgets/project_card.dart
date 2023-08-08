import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.category,
    required this.title,
    required this.deadline,
    required this.priority,
    required this.taskDone,
    required this.totalTask,
    required this.onPressed,
  });

  final String category;
  final String title;
  final DateTime deadline;
  final String priority;
  final int taskDone;
  final int totalTask;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Card(
        shadowColor: grayUhuy,
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              // Left Section
              leftSection(context),

              // Right Section
              rightSection(context)
            ],
          ),
        ),
      ),
    );
  }

  Flexible leftSection(BuildContext context) {
    String formattedDate = DateFormat.yMMMd().format(deadline);
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Category
          projectCategory(context),

          miniGap,

          // Project Name
          projectName(),

          miniGap,

          // Deadline Image
          SvgPicture.asset(
            'assets/svg/deadline.svg',
            height: MediaQuery.of(context).size.height * 0.027,
          ),

          miniGap,

          // Deadline
          deadlineAndPriority(context, formattedDate),
        ],
      ),
    );
  }

  RichText deadlineAndPriority(BuildContext context, String formattedDate) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: '$formattedDate   ',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: SvgPicture.asset(
              'assets/svg/${priority.toLowerCase()}.svg',
              height: MediaQuery.of(context).size.height * 0.015,
            ),
          ),
        ],
      ),
    );
  }

  Text projectName() {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
      ),
    );
  }

  RichText projectCategory(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          WidgetSpan(
            child: SvgPicture.asset(
              'assets/svg/${category.toLowerCase()}.svg',
              height: MediaQuery.of(context).size.height * 0.027,
            ),
          ),
          TextSpan(
            text: ' $category',
            style: const TextStyle(
              fontSize: 16,
              color: mainBlue,
            ),
          )
        ],
      ),
    );
  }

  Flexible rightSection(BuildContext context) {
    double percetage = (taskDone / totalTask);
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          // Circular Progress Bar
          circularProgress(percetage, context),

          smallGap,

          // Task Done and Total
          taskDoneTotal(),
        ],
      ),
    );
  }

  Text taskDoneTotal() {
    return Text(
      '$taskDone/$totalTask Tugas',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Stack circularProgress(double percetage, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          '${(percetage * 100).round()} %',
          style: const TextStyle(
            fontSize: 18,
            color: mainBlue,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            value: percetage,
            backgroundColor: mainBlue.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}

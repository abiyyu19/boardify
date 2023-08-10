import 'package:boardify/pages/project/show_color.dart';
import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.deadline,
    required this.status,
    this.projectName,
    required this.onPressed,
  });

  final String title;
  final String? projectName;
  final String deadline;
  final String status;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    bool project = false;

    if (projectName != null) {
      project = true;
    }
    return InkWell(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      onTap: onPressed,
      child: Card(
        shadowColor: grayUhuy,
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: showColorStatus(status),
                width: 5,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task Title and Status
                titleAndStatus(),

                // Project Name if any
                Visibility(
                  visible: project,
                  child: Column(
                    children: [
                      miniGap,
                      Text('Proyek: $projectName'),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                // Deadline
                taskDeadline(context, deadline),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row titleAndStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: showColorStatus(status),
            border: Border.all(
              color: showColorStatus(status),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              fontSize: 12,
              color: (status == 'Sedang') ? Colors.black : Colors.white,
            ),
          ),
        )
      ],
    );
  }

  RichText taskDeadline(BuildContext context, String deadline) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          WidgetSpan(
            child: Icon(
              Icons.calendar_month,
              color: grayUhuy,
              size: MediaQuery.of(context).size.height * 0.025,
            ),
          ),
          TextSpan(
            text: ' Due: $deadline',
            style: const TextStyle(
              color: grayUhuy,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

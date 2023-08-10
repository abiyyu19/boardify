import 'package:boardify/pages/project/show_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../utils/constant.dart';

class ProjectDetailHeader extends StatelessWidget {
  const ProjectDetailHeader({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Name
        Text(
          snapshot.data[0]['project_name'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        smallGap,

        // Description Title
        const Text(
          'Deskripsi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),

        miniGap,

        // Project Description
        Text(snapshot.data[0]['description']),

        // Divider
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Divider(
            thickness: 2,
            color: Colors.black,
          ),
        ),

        // Row Content
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            detailContent(
              context,
              'Kategori',
              'category',
              snapshot.data[0]['category'],
            ),
            detailContent(
              context,
              'Tenggat Waktu',
              'deadline',
              DateFormat.yMMMMd()
                  .format(DateTime.parse(snapshot.data[0]['deadline'])),
            ),
            detailContent(
              context,
              'Prioritas',
              'priority',
              snapshot.data[0]['priority'],
            ),
          ],
        )
      ],
    );
  }

  Column detailContent(
    BuildContext context,
    String title,
    String section,
    dynamic content,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        miniGap,
        (section == 'priority')
            ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: showColorPriority(content),
                  border: Border.all(
                    color: showColorPriority(content),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 12,
                    color: (content == 'Sedang') ? Colors.black : Colors.white,
                  ),
                ),
              )
            : RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    WidgetSpan(
                      child: (section == 'category')
                          ? SvgPicture.asset(
                              'assets/svg/${content.toLowerCase()}.svg',
                              height:
                                  MediaQuery.of(context).size.height * 0.027,
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                            )
                          : Icon(
                              Icons.calendar_month,
                              size: MediaQuery.of(context).size.height * 0.025,
                            ),
                    ),
                    TextSpan(
                      text: ' $content',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

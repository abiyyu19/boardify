import 'dart:developer';

import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../utils/constant.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    super.key,
    this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    log('$user');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        smallGap,
        // Greetings
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'Selamat Pagi, ${user?.userMetadata?['name']}',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Tetap Semangat!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        miniGap,
        // Task Card
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
              future: getAllTaskWaiting(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  log('belum dikerjakan ${snapshot.data.length}');
                  return taskCard(
                    context,
                    snapshot.data.length,
                    'Belum dikerjakan',
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.grey.withOpacity(1.0),
                    child: Row(
                      children: [
                        Skeleton(
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 0.45,
                        )
                      ],
                    ),
                  );
                }
              },
            ),
            FutureBuilder(
              future: getAllTaskDoing(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  log('dikerjakan ${snapshot.data.length}');
                  return taskCard(
                    context,
                    snapshot.data.length,
                    'Dikerjakan',
                  );
                } else {
                  return Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.grey.withOpacity(1.0),
                        child: Skeleton(
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 0.45,
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
        miniGap
      ],
    );
  }

  Flexible taskCard(
    BuildContext context,
    int task,
    String title,
  ) {
    return Flexible(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.16,
        child: Card(
          shadowColor: grayUhuy,
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SvgPicture.asset(
                        'assets/svg/task.svg',
                        colorFilter: const ColorFilter.mode(
                          mainBlue,
                          BlendMode.srcIn,
                        ),
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: mainBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                miniGap,
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: '$task',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: '  Tugas',
                        style: TextStyle(
                          color: grayUhuy,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

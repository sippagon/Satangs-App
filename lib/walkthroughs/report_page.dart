import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final containerNiwv14v9 = GlobalKey();
final container3b841wqa = GlobalKey();
final tabD9nmtut7 = GlobalKey();

/// ReportPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerNiwv14v9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ส่วนของ Pie chart แสดงหมวดหมู่รายรับหรือรายจ่าย',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: container3b841wqa,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ส่วนนี้จะแสดงรายละเอียดและยอดรวมของแต่ละหมวดหมู่',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: tabD9nmtut7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'เลือก Tab เพื่อดูข้อมูลรายรับ หรือ รายจ่าย',
            ),
          ),
        ],
      ),
    ];

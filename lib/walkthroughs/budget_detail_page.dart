import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final textR3ykg455 = GlobalKey();
final progressBar1q7x007i = GlobalKey();
final container5zzdiu59 = GlobalKey();
final iconButton7ua2kgil = GlobalKey();

/// BudgetDetailPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textR3ykg455,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ชื่อแผนการใช้จ่าย',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: progressBar1q7x007i,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'งบประมาณทั้งหมด ยอดที่ใช้ไปและยอดคงเหลือ',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: container5zzdiu59,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message:
                  'รายการหมวดหมู่ พร้อมกับยอดที่ใช้ไปและงบประมาณสำหรับหมวดหมู่นี้',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: iconButton7ua2kgil,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กดปุ่มนี้เพื่อแก้ไขหรือลบแผนกราใช้จ่าย',
            ),
          ),
        ],
      ),
    ];

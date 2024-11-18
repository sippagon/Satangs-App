import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final choiceChips6bv51esv = GlobalKey();
final listViewW4d3p1sg = GlobalKey();
final containerS6ygo5gs = GlobalKey();

/// TransactionHistoryPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: choiceChips6bv51esv,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'เลือกช่วงเวลา เพื่อดูรายการใช้จ่าย ตามที่ต้องการ',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: listViewW4d3p1sg,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'รายการใช้จ่ายจะแสดงตามช่วงเวลาที่เลือก',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerS6ygo5gs,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กดที่รายการเพื่อเข้าสู่หน้าแก้ไข',
            ),
          ),
        ],
      ),
    ];

import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final tabSevb4ckd = GlobalKey();
final listViewEpffeft9 = GlobalKey();

/// GoalAndBudgetPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: tabSevb4ckd,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message:
                  'เลือก Tab เพื่อดูรายการเป้าหมายการเงินหรือแผนการใช้จ่าย',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: listViewEpffeft9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'รายการเป้าหมายการเงินหรือแผนการใช้จ่าย',
            ),
          ),
        ],
      ),
    ];

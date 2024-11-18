import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final containerW1ssxbvk = GlobalKey();
final container9doc5lf2 = GlobalKey();
final containerPmns6e3f = GlobalKey();
final container5b0jerof = GlobalKey();

/// TaxDetailPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerW1ssxbvk,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ชื่อแผนภาษีและปีภาษี',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: container9doc5lf2,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ภาษีที่คุณต้องจ่าย',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerPmns6e3f,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'รายได้สุทธิของคุณ',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: container5b0jerof,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'มูลค่าลดหย่อนสุทธิ กดเพื่อดูรายละเอียดเพิ่มเติม',
            ),
          ),
        ],
      ),
    ];

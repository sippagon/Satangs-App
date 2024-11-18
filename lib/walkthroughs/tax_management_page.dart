import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final listView6jn246j1 = GlobalKey();

/// TaxManagementPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: listView6jn246j1,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'รายการแผนภาษี',
            ),
          ),
        ],
      ),
    ];

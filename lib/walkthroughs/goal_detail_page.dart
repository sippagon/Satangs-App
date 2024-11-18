import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final text4dj6nqbw = GlobalKey();
final richText31b5ngnp = GlobalKey();
final rowYlbezk7e = GlobalKey();
final richTextQg6bvdsw = GlobalKey();
final containerMjl0jeoh = GlobalKey();
final buttonOycebq09 = GlobalKey();
final iconButtonTfvxx0fx = GlobalKey();

/// GoalDetailPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: text4dj6nqbw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ชื่อเป้าหมาย',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: richText31b5ngnp,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ระยะเวลาที่เหลือก่อนถึงกำหนด',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: rowYlbezk7e,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'Percent ความสำเร็จของเป้าหมาย',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: richTextQg6bvdsw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message:
                  'ยอดเงินเก็บสะสมและยอดเป้าหมาย และยอดที่ต้องเก็บต่อเดือน',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: containerMjl0jeoh,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message:
                  'โอกาศสำเร็จ ประเมินโดยระบบ สามารถกดเพื่อดูรายละเอียดเพิ่มเติม',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: buttonOycebq09,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กดที่ปุ่มนี้เพื่อเพิ่มเงินสะสม',
            ),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: iconButtonTfvxx0fx,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กดที่ปุ่มนี้หากต้องการแก้ไขหรือลบเป้าหมาย',
            ),
          ),
        ],
      ),
    ];

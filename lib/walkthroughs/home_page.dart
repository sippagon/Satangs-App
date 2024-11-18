import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final containerA3v8zusq = GlobalKey();
final container29dp03ty = GlobalKey();
final containerY9wnxm10 = GlobalKey();
final iconButtonPst1w8en = GlobalKey();
final container8luhxp9y = GlobalKey();

/// HomePage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerA3v8zusq,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'รายรับ รายจ่ายและยอดคงเหลือของเดือนนี้',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: container29dp03ty,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message:
                  'ความมั่งคั่งสุทธิของคุณ กดเพื่อดูรายละเอียดหรือกรอกข้อมูลเพิ่มเติม',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerY9wnxm10,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'รายการใช้จ่ายที่เกิดขึ้นภายในวันนี้',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: iconButtonPst1w8en,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กดที่ลูกศรนี้ เพื่อดูรายการใช้จ่ายทั้งหมดที่บันทึกไว้',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: container8luhxp9y,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กดที่รายการใช้จ่าย เพื่อแก้ไข',
            ),
          ),
        ],
      ),
    ];

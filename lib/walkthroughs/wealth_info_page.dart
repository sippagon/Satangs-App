import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/componants/walkthrough_tip/walkthrough_tip_widget.dart';

// Focus widget keys for this walkthrough
final containerO66h6ipc = GlobalKey();
final containerEq5cczhn = GlobalKey();
final containerLhwferem = GlobalKey();
final containerT47gvdes = GlobalKey();
final iconButton062bmyj0 = GlobalKey();

/// WealthInfoPage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerO66h6ipc,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ความมั่งคั่งสุทธิขของคุณ (ทรัพย์สิน - หนี้สิน)',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerEq5cczhn,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'อัตราส่วนความมั่งคั่ง บ่งบอกถึงอิสรภาพทางการเงิน',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerLhwferem,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'ความมั่งคั่งที่คุณควรมี คำนวณจากอายุและรายได้',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: containerT47gvdes,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กราฟประเมินความมั่งคั่งของคุณเทียบกับที่คุณควรมี',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: iconButton062bmyj0,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTipWidget(
              message: 'กดปุ่มนี้เพื่อแก้ไขข้อมูล',
            ),
          ),
        ],
      ),
    ];

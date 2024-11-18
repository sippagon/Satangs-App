import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'walkthrough_tip_model.dart';
export 'walkthrough_tip_model.dart';

class WalkthroughTipWidget extends StatefulWidget {
  const WalkthroughTipWidget({
    super.key,
    required this.message,
  });

  final String? message;

  @override
  State<WalkthroughTipWidget> createState() => _WalkthroughTipWidgetState();
}

class _WalkthroughTipWidgetState extends State<WalkthroughTipWidget> {
  late WalkthroughTipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughTipModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      valueOrDefault<String>(
                        widget.message,
                        'Tip',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Prompt',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ),
          ].divide(const SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}

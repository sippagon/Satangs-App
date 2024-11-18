import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_items_model.dart';
export 'empty_list_items_model.dart';

class EmptyListItemsWidget extends StatefulWidget {
  const EmptyListItemsWidget({
    super.key,
    String? title,
    String? description,
  })  : title = title ?? 'title',
        description = description ?? 'description';

  final String title;
  final String description;

  @override
  State<EmptyListItemsWidget> createState() => _EmptyListItemsWidgetState();
}

class _EmptyListItemsWidgetState extends State<EmptyListItemsWidget> {
  late EmptyListItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListItemsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_off_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 44.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
            child: Text(
              widget.title,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Kanit',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Prompt',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

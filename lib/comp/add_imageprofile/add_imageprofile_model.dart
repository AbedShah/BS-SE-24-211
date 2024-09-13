import '/flutter_flow/flutter_flow_util.dart';
import 'add_imageprofile_widget.dart' show AddImageprofileWidget;
import 'package:flutter/material.dart';

class AddImageprofileModel extends FlutterFlowModel<AddImageprofileWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

import '/flutter_flow/flutter_flow_util.dart';
import 'add_licence_widget.dart' show AddLicenceWidget;
import 'package:flutter/material.dart';

class AddLicenceModel extends FlutterFlowModel<AddLicenceWidget> {
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

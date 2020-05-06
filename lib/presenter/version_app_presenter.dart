import 'dart:io';

import 'package:default_app_flutter/model/version_app.dart';
import 'package:default_app_flutter/services/firebase/firebase_versions_app_service.dart';

class VersionAppPresenter {
  var service = FirebaseVersionsAppService();

  Future<VersionApp> checkCurrentVersion(String packageName) {
    packageName = packageName + "-" + Platform.operatingSystem;
    return service.checkCurrentVersion(packageName);
  }
}
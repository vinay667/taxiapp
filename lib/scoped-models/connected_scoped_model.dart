import 'package:scoped_model/scoped_model.dart';
mixin ConnectedScopedModel on Model {
  String _baseURL = 'http://projects.thesparxitsolutions.com/SIS835/api/';
  bool _isLoading = false;
  String get baseURL {
    return _baseURL;
  }

  bool get isLoading {
    return _isLoading;
  }

  set setLoadingState(bool loading) {
    _isLoading = loading;
  }

}

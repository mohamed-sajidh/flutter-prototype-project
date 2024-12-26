import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  bool _trigSuccess = false;
  bool _trigFail = false;
  bool _isChecking = false;
  bool _closeEyes = false;
  double _numLook = 0;

  bool get trigSuccess => _trigSuccess;
  bool get trigFail => _trigFail;
  bool get isChecking => _isChecking;
  bool get closeEyes => _closeEyes;
  double get numLook => _numLook;

  void setTrigSuccess(bool value) {
    _trigSuccess = value;
    _trigFail = !value;
    notifyListeners();
  }

  void setTrigFail(bool value) {
    _trigFail = value;
    _trigSuccess = !value;
    notifyListeners();
  }

  void setIsChecking(bool value) {
    _isChecking = value;
    notifyListeners();
  }

  void setCloseEyes(bool value) {
    _closeEyes = value;
    notifyListeners();
  }

  void setNumLook(double value) {
    _numLook = value;
    notifyListeners();
  }

  void submit(String email, String password) {
    if (email.trim().toLowerCase() == 'akkruzz' && password == 'Flutter@') {
      setTrigSuccess(true);
    } else {
      setTrigFail(true);
    }
  }
}

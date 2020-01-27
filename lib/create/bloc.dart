import 'dart:async';
import 'package:experiments/create/model.dart';

class PreferencesBloc {
  IPreferences _preferences =
      IPreferences(nightMode: false, horizontalCardView: false);

  StreamController<IPreferences> _preferencesController = StreamController<IPreferences>();

  Sink<IPreferences> get _preferencesSink => _preferencesController.sink;
  Stream<IPreferences> get preferencesStream => _preferencesController.stream;

  PreferencesBloc() {
    _preferencesSink.add(_preferences);
  }

  dispose() {
    _preferencesController.close();
  }

  void updatePreferences(IPreferences preferences) {
    _preferences = preferences;
    _preferencesSink.add(preferences);
  }
}
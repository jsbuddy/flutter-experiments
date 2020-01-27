import 'package:experiments/create/bloc.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends InheritedWidget {
  final PreferencesBloc bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PreferencesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(PreferencesProvider)
              as PreferencesProvider)
          .bloc;

  PreferencesProvider({Key key, PreferencesBloc bloc, Widget child})
      : this.bloc = bloc ?? PreferencesBloc(),
        super(child: child, key: key);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$hiddenShowPassAtom =
      Atom(name: '_LoginController.hiddenShowPass', context: context);

  @override
  bool get hiddenShowPass {
    _$hiddenShowPassAtom.reportRead();
    return super.hiddenShowPass;
  }

  @override
  set hiddenShowPass(bool value) {
    _$hiddenShowPassAtom.reportWrite(value, super.hiddenShowPass, () {
      super.hiddenShowPass = value;
    });
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  void changeObscureText() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changeObscureText');
    try {
      return super.changeObscureText();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hiddenShowPass: ${hiddenShowPass}
    ''';
  }
}

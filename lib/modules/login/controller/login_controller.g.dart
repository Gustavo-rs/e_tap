// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$email_controllerAtom =
      Atom(name: '_LoginController.email_controller', context: context);

  @override
  TextEditingController get email_controller {
    _$email_controllerAtom.reportRead();
    return super.email_controller;
  }

  @override
  set email_controller(TextEditingController value) {
    _$email_controllerAtom.reportWrite(value, super.email_controller, () {
      super.email_controller = value;
    });
  }

  late final _$senha_controllerAtom =
      Atom(name: '_LoginController.senha_controller', context: context);

  @override
  TextEditingController get senha_controller {
    _$senha_controllerAtom.reportRead();
    return super.senha_controller;
  }

  @override
  set senha_controller(TextEditingController value) {
    _$senha_controllerAtom.reportWrite(value, super.senha_controller, () {
      super.senha_controller = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LoginController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

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

  late final _$loginAsyncAction =
      AsyncAction('_LoginController.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
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
email_controller: ${email_controller},
senha_controller: ${senha_controller},
isLoading: ${isLoading},
hiddenShowPass: ${hiddenShowPass}
    ''';
  }
}

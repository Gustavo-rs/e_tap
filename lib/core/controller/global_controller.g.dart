// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalController on _GlobalController, Store {
  late final _$themesAtom =
      Atom(name: '_GlobalController.themes', context: context);

  @override
  bool get themes {
    _$themesAtom.reportRead();
    return super.themes;
  }

  @override
  set themes(bool value) {
    _$themesAtom.reportWrite(value, super.themes, () {
      super.themes = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_GlobalController.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: '_GlobalController.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: '_GlobalController.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$isTrocaSenhaLoadAtom =
      Atom(name: '_GlobalController.isTrocaSenhaLoad', context: context);

  @override
  bool get isTrocaSenhaLoad {
    _$isTrocaSenhaLoadAtom.reportRead();
    return super.isTrocaSenhaLoad;
  }

  @override
  set isTrocaSenhaLoad(bool value) {
    _$isTrocaSenhaLoadAtom.reportWrite(value, super.isTrocaSenhaLoad, () {
      super.isTrocaSenhaLoad = value;
    });
  }

  late final _$hiddenShowPassAtom =
      Atom(name: '_GlobalController.hiddenShowPass', context: context);

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

  late final _$emailInsertAsyncAction =
      AsyncAction('_GlobalController.emailInsert', context: context);

  @override
  Future<void> emailInsert() {
    return _$emailInsertAsyncAction.run(() => super.emailInsert());
  }

  late final _$sharedEmailSenhaAsyncAction =
      AsyncAction('_GlobalController.sharedEmailSenha', context: context);

  @override
  Future<void> sharedEmailSenha() {
    return _$sharedEmailSenhaAsyncAction.run(() => super.sharedEmailSenha());
  }

  late final _$trocarSenhaUserAsyncAction =
      AsyncAction('_GlobalController.trocarSenhaUser', context: context);

  @override
  Future<void> trocarSenhaUser(BuildContext context) {
    return _$trocarSenhaUserAsyncAction
        .run(() => super.trocarSenhaUser(context));
  }

  late final _$_GlobalControllerActionController =
      ActionController(name: '_GlobalController', context: context);

  @override
  void changeObscureText() {
    final _$actionInfo = _$_GlobalControllerActionController.startAction(
        name: '_GlobalController.changeObscureText');
    try {
      return super.changeObscureText();
    } finally {
      _$_GlobalControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeThemes() {
    final _$actionInfo = _$_GlobalControllerActionController.startAction(
        name: '_GlobalController.changeThemes');
    try {
      return super.changeThemes();
    } finally {
      _$_GlobalControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themes: ${themes},
email: ${email},
nome: ${nome},
token: ${token},
isTrocaSenhaLoad: ${isTrocaSenhaLoad},
hiddenShowPass: ${hiddenShowPass}
    ''';
  }
}

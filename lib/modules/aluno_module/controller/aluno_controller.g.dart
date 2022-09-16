// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunoController on _AlunoController, Store {
  late final _$ndefWidgetsAtom =
      Atom(name: '_AlunoController.ndefWidgets', context: context);

  @override
  String get ndefWidgets {
    _$ndefWidgetsAtom.reportRead();
    return super.ndefWidgets;
  }

  @override
  set ndefWidgets(String value) {
    _$ndefWidgetsAtom.reportWrite(value, super.ndefWidgets, () {
      super.ndefWidgets = value;
    });
  }

  late final _$isVisibleAtom =
      Atom(name: '_AlunoController.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$_AlunoControllerActionController =
      ActionController(name: '_AlunoController', context: context);

  @override
  void setIsVisible(bool value) {
    final _$actionInfo = _$_AlunoControllerActionController.startAction(
        name: '_AlunoController.setIsVisible');
    try {
      return super.setIsVisible(value);
    } finally {
      _$_AlunoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNdefWidgets(String value) {
    final _$actionInfo = _$_AlunoControllerActionController.startAction(
        name: '_AlunoController.setNdefWidgets');
    try {
      return super.setNdefWidgets(value);
    } finally {
      _$_AlunoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ndefWidgets: ${ndefWidgets},
isVisible: ${isVisible}
    ''';
  }
}

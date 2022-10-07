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

  late final _$stateAtom =
      Atom(name: '_AlunoController.state', context: context);

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$isLoadAtom =
      Atom(name: '_AlunoController.isLoad', context: context);

  @override
  bool get isLoad {
    _$isLoadAtom.reportRead();
    return super.isLoad;
  }

  @override
  set isLoad(bool value) {
    _$isLoadAtom.reportWrite(value, super.isLoad, () {
      super.isLoad = value;
    });
  }

  late final _$isSelectedPageAtom =
      Atom(name: '_AlunoController.isSelectedPage', context: context);

  @override
  int get isSelectedPage {
    _$isSelectedPageAtom.reportRead();
    return super.isSelectedPage;
  }

  @override
  set isSelectedPage(int value) {
    _$isSelectedPageAtom.reportWrite(value, super.isSelectedPage, () {
      super.isSelectedPage = value;
    });
  }

  late final _$dataHorasAlunoAtom =
      Atom(name: '_AlunoController.dataHorasAluno', context: context);

  @override
  DataHorasAlunoModel get dataHorasAluno {
    _$dataHorasAlunoAtom.reportRead();
    return super.dataHorasAluno;
  }

  @override
  set dataHorasAluno(DataHorasAlunoModel value) {
    _$dataHorasAlunoAtom.reportWrite(value, super.dataHorasAluno, () {
      super.dataHorasAluno = value;
    });
  }

  late final _$dateHoursAsyncAction =
      AsyncAction('_AlunoController.dateHours', context: context);

  @override
  Future<void> dateHours() {
    return _$dateHoursAsyncAction.run(() => super.dateHours());
  }

  late final _$_AlunoControllerActionController =
      ActionController(name: '_AlunoController', context: context);

  @override
  void changeSelectedPage(int value) {
    final _$actionInfo = _$_AlunoControllerActionController.startAction(
        name: '_AlunoController.changeSelectedPage');
    try {
      return super.changeSelectedPage(value);
    } finally {
      _$_AlunoControllerActionController.endAction(_$actionInfo);
    }
  }

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
  void setStateFunc(String value) {
    final _$actionInfo = _$_AlunoControllerActionController.startAction(
        name: '_AlunoController.setStateFunc');
    try {
      return super.setStateFunc(value);
    } finally {
      _$_AlunoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ndefWidgets: ${ndefWidgets},
isVisible: ${isVisible},
state: ${state},
isLoad: ${isLoad},
isSelectedPage: ${isSelectedPage},
dataHorasAluno: ${dataHorasAluno}
    ''';
  }
}

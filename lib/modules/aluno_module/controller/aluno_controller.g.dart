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

  late final _$isMateriaLoadAtom =
      Atom(name: '_AlunoController.isMateriaLoad', context: context);

  @override
  bool get isMateriaLoad {
    _$isMateriaLoadAtom.reportRead();
    return super.isMateriaLoad;
  }

  @override
  set isMateriaLoad(bool value) {
    _$isMateriaLoadAtom.reportWrite(value, super.isMateriaLoad, () {
      super.isMateriaLoad = value;
    });
  }

  late final _$isVazioAtom =
      Atom(name: '_AlunoController.isVazio', context: context);

  @override
  bool get isVazio {
    _$isVazioAtom.reportRead();
    return super.isVazio;
  }

  @override
  set isVazio(bool value) {
    _$isVazioAtom.reportWrite(value, super.isVazio, () {
      super.isVazio = value;
    });
  }

  late final _$isHorasVazioAtom =
      Atom(name: '_AlunoController.isHorasVazio', context: context);

  @override
  bool get isHorasVazio {
    _$isHorasVazioAtom.reportRead();
    return super.isHorasVazio;
  }

  @override
  set isHorasVazio(bool value) {
    _$isHorasVazioAtom.reportWrite(value, super.isHorasVazio, () {
      super.isHorasVazio = value;
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

  late final _$materiasAlunosAtom =
      Atom(name: '_AlunoController.materiasAlunos', context: context);

  @override
  MateriaAlunoModel get materiasAlunos {
    _$materiasAlunosAtom.reportRead();
    return super.materiasAlunos;
  }

  @override
  set materiasAlunos(MateriaAlunoModel value) {
    _$materiasAlunosAtom.reportWrite(value, super.materiasAlunos, () {
      super.materiasAlunos = value;
    });
  }

  late final _$getMateriasAlunoAsyncAction =
      AsyncAction('_AlunoController.getMateriasAluno', context: context);

  @override
  Future<void> getMateriasAluno() {
    return _$getMateriasAlunoAsyncAction.run(() => super.getMateriasAluno());
  }

  late final _$dateHoursAsyncAction =
      AsyncAction('_AlunoController.dateHours', context: context);

  @override
  Future<void> dateHours(String id_disciplina) {
    return _$dateHoursAsyncAction.run(() => super.dateHours(id_disciplina));
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
isMateriaLoad: ${isMateriaLoad},
isVazio: ${isVazio},
isHorasVazio: ${isHorasVazio},
state: ${state},
isLoad: ${isLoad},
isSelectedPage: ${isSelectedPage},
dataHorasAluno: ${dataHorasAluno},
materiasAlunos: ${materiasAlunos}
    ''';
  }
}

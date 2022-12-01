// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfessorController on _ProfessorController, Store {
  late final _$isLoadAtom =
      Atom(name: '_ProfessorController.isLoad', context: context);

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

  late final _$isMateriaLoadAtom =
      Atom(name: '_ProfessorController.isMateriaLoad', context: context);

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
      Atom(name: '_ProfessorController.isVazio', context: context);

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

  late final _$isVazioDiscAtom =
      Atom(name: '_ProfessorController.isVazioDisc', context: context);

  @override
  bool get isVazioDisc {
    _$isVazioDiscAtom.reportRead();
    return super.isVazioDisc;
  }

  @override
  set isVazioDisc(bool value) {
    _$isVazioDiscAtom.reportWrite(value, super.isVazioDisc, () {
      super.isVazioDisc = value;
    });
  }

  late final _$isSelectedPageAtom =
      Atom(name: '_ProfessorController.isSelectedPage', context: context);

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

  late final _$loadChamadaProfAtom =
      Atom(name: '_ProfessorController.loadChamadaProf', context: context);

  @override
  bool get loadChamadaProf {
    _$loadChamadaProfAtom.reportRead();
    return super.loadChamadaProf;
  }

  @override
  set loadChamadaProf(bool value) {
    _$loadChamadaProfAtom.reportWrite(value, super.loadChamadaProf, () {
      super.loadChamadaProf = value;
    });
  }

  late final _$countCallAtom =
      Atom(name: '_ProfessorController.countCall', context: context);

  @override
  List<int> get countCall {
    _$countCallAtom.reportRead();
    return super.countCall;
  }

  @override
  set countCall(List<int> value) {
    _$countCallAtom.reportWrite(value, super.countCall, () {
      super.countCall = value;
    });
  }

  late final _$callAtom =
      Atom(name: '_ProfessorController.call', context: context);

  @override
  List<int> get call {
    _$callAtom.reportRead();
    return super.call;
  }

  @override
  set call(List<int> value) {
    _$callAtom.reportWrite(value, super.call, () {
      super.call = value;
    });
  }

  late final _$discProfessorAtom =
      Atom(name: '_ProfessorController.discProfessor', context: context);

  @override
  List<DisciplinasProfessorModel> get discProfessor {
    _$discProfessorAtom.reportRead();
    return super.discProfessor;
  }

  @override
  set discProfessor(List<DisciplinasProfessorModel> value) {
    _$discProfessorAtom.reportWrite(value, super.discProfessor, () {
      super.discProfessor = value;
    });
  }

  late final _$listAlunosMateriaAtom =
      Atom(name: '_ProfessorController.listAlunosMateria', context: context);

  @override
  ListaAlunosMateria get listAlunosMateria {
    _$listAlunosMateriaAtom.reportRead();
    return super.listAlunosMateria;
  }

  @override
  set listAlunosMateria(ListaAlunosMateria value) {
    _$listAlunosMateriaAtom.reportWrite(value, super.listAlunosMateria, () {
      super.listAlunosMateria = value;
    });
  }

  late final _$setDisciplinasProfessorAsyncAction = AsyncAction(
      '_ProfessorController.setDisciplinasProfessor',
      context: context);

  @override
  Future<void> setDisciplinasProfessor() {
    return _$setDisciplinasProfessorAsyncAction
        .run(() => super.setDisciplinasProfessor());
  }

  late final _$setListaAlunosMateriaAsyncAction = AsyncAction(
      '_ProfessorController.setListaAlunosMateria',
      context: context);

  @override
  Future<void> setListaAlunosMateria(int id) {
    return _$setListaAlunosMateriaAsyncAction
        .run(() => super.setListaAlunosMateria(id));
  }

  late final _$iniciarChamadaAsyncAction =
      AsyncAction('_ProfessorController.iniciarChamada', context: context);

  @override
  Future<void> iniciarChamada(BuildContext context) {
    return _$iniciarChamadaAsyncAction.run(() => super.iniciarChamada(context));
  }

  late final _$finalizarChamadaAsyncAction =
      AsyncAction('_ProfessorController.finalizarChamada', context: context);

  @override
  Future<void> finalizarChamada(BuildContext context) {
    return _$finalizarChamadaAsyncAction
        .run(() => super.finalizarChamada(context));
  }

  late final _$_ProfessorControllerActionController =
      ActionController(name: '_ProfessorController', context: context);

  @override
  void changeChamada(bool value, int index) {
    final _$actionInfo = _$_ProfessorControllerActionController.startAction(
        name: '_ProfessorController.changeChamada');
    try {
      return super.changeChamada(value, index);
    } finally {
      _$_ProfessorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void ordenarChamada() {
    final _$actionInfo = _$_ProfessorControllerActionController.startAction(
        name: '_ProfessorController.ordenarChamada');
    try {
      return super.ordenarChamada();
    } finally {
      _$_ProfessorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedPage(int value) {
    final _$actionInfo = _$_ProfessorControllerActionController.startAction(
        name: '_ProfessorController.changeSelectedPage');
    try {
      return super.changeSelectedPage(value);
    } finally {
      _$_ProfessorControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoad: ${isLoad},
isMateriaLoad: ${isMateriaLoad},
isVazio: ${isVazio},
isVazioDisc: ${isVazioDisc},
isSelectedPage: ${isSelectedPage},
loadChamadaProf: ${loadChamadaProf},
countCall: ${countCall},
call: ${call},
discProfessor: ${discProfessor},
listAlunosMateria: ${listAlunosMateria}
    ''';
  }
}

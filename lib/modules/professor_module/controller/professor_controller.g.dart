// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfessorController on _ProfessorController, Store {
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

  late final _$_ProfessorControllerActionController =
      ActionController(name: '_ProfessorController', context: context);

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
isSelectedPage: ${isSelectedPage}
    ''';
  }
}

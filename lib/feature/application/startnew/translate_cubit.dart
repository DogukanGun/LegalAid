import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legalaid/component/form/data/question.dart';

import '../../../service/translation/translate_service.dart';

class TranslateCubit extends Cubit<FormQuestion?> {
  TranslateCubit() : super(null);
  TranslateService translateService = TranslateService();


}

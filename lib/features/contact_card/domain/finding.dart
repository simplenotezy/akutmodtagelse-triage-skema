// Class SymptonCategory
import 'package:collection/collection.dart';
import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finding.freezed.dart';

@freezed
class Finding with _$Finding {
  const Finding._();

  const factory Finding({
    required SymptomCategory category,
    required List<Symptom> symptoms,
  }) = _SymptomCategory;

  Code get code {
    if (category.type == SymptomCategoryType.single) {
      return symptoms.isEmpty ? codeGreen : symptoms.first.code!;
    }

    // Sort keys in descending order
    List<int> sortedKeys = category.multiSymptomsToCode!.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    for (int key in sortedKeys) {
      if (symptoms.length >= key) {
        return category.multiSymptomsToCode![key]!;
      }
    }

    // Return a default code if none match (optional)
    return codeGreen;
  }

  @override
  int get hashCode => category.hashCode ^ symptoms.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Finding &&
        other.category == category &&
        const ListEquality().equals(other.symptoms, symptoms);
  }
}
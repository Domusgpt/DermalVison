enum SkinType { dry, oily, combination, sensitive, normal }

enum SkinGoal {
  acneReduction,
  toneEvenness,
  textureRefinement,
  wrinklePrevention,
  hydrationBoost,
}

extension SkinTypeLabel on SkinType {
  String get label {
    switch (this) {
      case SkinType.dry:
        return 'Dry';
      case SkinType.oily:
        return 'Oily';
      case SkinType.combination:
        return 'Combination';
      case SkinType.sensitive:
        return 'Sensitive';
      case SkinType.normal:
        return 'Normal';
    }
  }
}

extension SkinGoalLabel on SkinGoal {
  String get label {
    switch (this) {
      case SkinGoal.acneReduction:
        return 'Acne reduction';
      case SkinGoal.toneEvenness:
        return 'Even skin tone';
      case SkinGoal.textureRefinement:
        return 'Refine texture';
      case SkinGoal.wrinklePrevention:
        return 'Wrinkle prevention';
      case SkinGoal.hydrationBoost:
        return 'Hydration boost';
    }
  }
}

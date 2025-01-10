import 'package:recipes/enums/unit_type.dart';

class Ingridient {
  const Ingridient({
    required this.name,
    required this.quantity,
    this.unit = UnitType.piece,
  });

  final String name;
  final int quantity;
  final UnitType unit;
}

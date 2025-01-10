enum UnitType {
  gram('Gram', 'g', 'Weight'),
  kilogram('Kilogram', 'kg', 'Weight'),
  liter('Liter', 'L', 'Volume'),
  milliliter('Milliliter', 'mL', 'Volume'),
  piece('Piece', 'pcs', 'Count'),
  teaspoon('Teaspoon', 'tsp', 'Cooking'),
  tablespoon('Tablespoon', 'tbsp', 'Cooking'),
  cup('Cup', 'cup', 'Cooking'),
  pinch('Pinch', 'pn', 'Cooking'),
  dash('Dash', 'ds', 'Cooking'),
  drop('Drop', 'dp', 'Cooking'),
  smidgen('Smidgen', 'sm', 'Cooking'),
  handful('Handful', 'hf', 'Count'),
  quart('Quart', 'qt', 'Volume'),
  gallon('Gallon', 'gal', 'Volume'),
  ounce('Ounce', 'oz', 'Weight/Volume'),
  milligram('Milligram', 'mg', 'Weight');

  const UnitType(this.fullName, this.abbreviation, this.category);

  final String fullName;
  final String abbreviation;
  final String category;

  String get byString => '$fullName ($abbreviation) - $category';
}

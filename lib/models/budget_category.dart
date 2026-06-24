class BudgetCategory {
  final String name;
  final double estimated;
  double actual;

  BudgetCategory({
    required this.name,
    required this.estimated,
    required this.actual,
  });

  double get percentSpent => estimated == 0 ? 0 : (actual / estimated).clamp(0, 1.5).toDouble();
}

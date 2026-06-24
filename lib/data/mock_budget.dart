import '../models/budget_category.dart';

List<BudgetCategory> buildMockBudget() => [
      BudgetCategory(name: 'Venue', estimated: 900000, actual: 850000),
      BudgetCategory(name: 'Catering', estimated: 1200000, actual: 0),
      BudgetCategory(name: 'Photography', estimated: 200000, actual: 180000),
      BudgetCategory(name: 'Decor', estimated: 350000, actual: 0),
      BudgetCategory(name: 'Clothing', estimated: 400000, actual: 410000),
      BudgetCategory(name: 'Miscellaneous', estimated: 150000, actual: 60000),
    ];

const double totalWeddingBudget = 3600000;

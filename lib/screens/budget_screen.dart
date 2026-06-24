import 'package:flutter/material.dart';
import '../data/mock_budget.dart';
import '../state/app_state.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final budget = appState.budget;
    final spent = appState.totalSpent;
    final remaining = totalWeddingBudget - spent;

    return Scaffold(
      appBar: AppBar(title: const Text('Budget'), backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: const Color(0xFF3D4FE0),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total Budget', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 4),
                  Text(
                    'PKR ${spent.toStringAsFixed(0)} / ${totalWeddingBudget.toStringAsFixed(0)}',
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text('PKR ${remaining.toStringAsFixed(0)} remaining', style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('By Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          for (final category in budget)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(category.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                      Text(
                        'PKR ${category.actual.toStringAsFixed(0)} / ${category.estimated.toStringAsFixed(0)}',
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: category.percentSpent > 1 ? 1 : category.percentSpent,
                      minHeight: 8,
                      backgroundColor: Colors.grey[200],
                      color: category.percentSpent > 1 ? Colors.red : const Color(0xFF3D4FE0),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data dari PlanProvider
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    Plan plan = planNotifier.value;

    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Vita')),
      body: Column(
        children: [
          // Langkah 8: bungkus _buildList() dengan Expanded
          Expanded(child: _buildList(context, plan)),

          // Langkah 9: Tambahkan footer progress di bawah
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              plan.completenessMessage,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
        );
      },
    );
  }

  Widget _buildList(BuildContext context, Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(context, plan, plan.tasks[index], index),
    );
  }

  Widget _buildTaskTile(BuildContext context, Plan plan, Task task, int index) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final updatedTasks = List<Task>.from(plan.tasks);
          updatedTasks[index] = Task(
            description: task.description,
            complete: selected ?? false,
          );

          planNotifier.value = Plan(name: plan.name, tasks: updatedTasks);
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final updatedTasks = List<Task>.from(plan.tasks);
          updatedTasks[index] = Task(
            description: text,
            complete: task.complete,
          );

          planNotifier.value = Plan(name: plan.name, tasks: updatedTasks);
        },
      ),
    );
  }
}

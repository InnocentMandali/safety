
import 'package:emergen_sync/src/features/tasks/data/task_repository.dart';
import 'package:emergen_sync/src/features/tasks/domain/task.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TaskRepository _taskRepository = TaskRepository();
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = _taskRepository.getTasks();
  }

  double get _completionPercentage {
    if (_tasks.isEmpty) {
      return 0.0;
    }
    final completedTasks = _tasks.where((task) => task.isCompleted).length;
    return completedTasks / _tasks.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks & Drills'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Preparedness Progress',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _completionPercentage,
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(6),
                ),
                const SizedBox(height: 8),
                Text(
                  '${(_completionPercentage * 100).toStringAsFixed(0)}% Complete',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: CheckboxListTile(
                    title: Text(task.title),
                    subtitle: Text(task.description),
                    value: task.isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        task.isCompleted = value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

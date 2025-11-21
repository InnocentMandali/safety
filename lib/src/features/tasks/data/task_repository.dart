
import 'package:emergen_sync/src/features/tasks/domain/task.dart';

class TaskRepository {
  static final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Check Smoke Detector Batteries',
      description: 'Test all smoke detectors in your home and replace the batteries if necessary. This should be done every 6 months.',
    ),
    Task(
      id: '2',
      title: 'Create a Family Emergency Plan',
      description: 'Establish a plan for how your family will communicate and reunite in an emergency. Identify a safe meeting place outside your home.',
    ),
    Task(
      id: '3',
      title: 'Assemble a First-Aid Kit',
      description: 'Build a well-stocked first-aid kit with essentials like bandages, antiseptic wipes, pain relievers, and any necessary personal medications.',
    ),
    Task(
      id: '4',
      title: 'Practice a Fire Drill',
      description: 'Conduct a fire drill with your family to ensure everyone knows the escape routes and procedures. Practice at least twice a year.',
    ),
    Task(
      id: '5',
      title: 'Learn to Shut Off Utilities',
      description: 'Locate and learn how to safely shut off the main water, gas, and electricity supplies to your home.',
    ),
    Task(
      id: '6',
      title: 'Prepare a \'Go Bag\'',
      description: 'Pack a bag with essential items you would need if you had to evacuate quickly, including water, non-perishable food, a flashlight, and copies of important documents.',
    ),
  ];

  List<Task> getTasks() {
    return _tasks;
  }
}

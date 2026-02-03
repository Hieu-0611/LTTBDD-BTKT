import 'package:flutter/material.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, String>> tasks = [
    {
      "title": "Complete Android Project",
      "desc": "Finish the UI, integrate API, and write documentation"
    },
  ];

  final List<Color> cardColors = [
    const Color(0xFFBFE3FF),
    const Color(0xFFF7C6C6),
    const Color(0xFFE6F0B5),
    const Color(0xFFF7C6C6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.blue),
        title: const Text(
          "List",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),

                // ✅ ADD TASK + UPDATE LIST
                onPressed: () async {
                  final newTask = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddTaskScreen(),
                    ),
                  );

                  if (newTask != null) {
                    setState(() {
                      tasks.insert(0, newTask);
                    });
                  }
                },
              ),
            ),
          )
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColors[index % cardColors.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks[index]["title"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  tasks[index]["desc"]!,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 45), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }
}

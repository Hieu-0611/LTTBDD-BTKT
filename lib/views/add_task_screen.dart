import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController descCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add New",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Task",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),

            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(
                hintText: "Do homework",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Description",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),

            TextField(
              controller: descCtrl,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Don’t give up",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ✅ Button Add (TRẢ DATA VỀ)
            Center(
              child: SizedBox(
                width: 160,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    if (titleCtrl.text.isEmpty) return;

                    // ✅ gửi task về ListScreen
                    Navigator.pop(context, {
                      "title": titleCtrl.text,
                      "desc": descCtrl.text,
                    });
                  },
                  child: const Text("Add"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

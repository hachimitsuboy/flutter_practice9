import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPage extends StatelessWidget {
  final List<String> wordList;

  EditPage({required this.wordList});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("入力画面"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          TextField(
            controller: _controller,
            maxLength: 20,
            maxLines: 1,
            decoration: const InputDecoration(
              icon: Icon(Icons.add_box_rounded),
              hintText: "わからなかった単語",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () => _submitWord(context),
            child: const Text("完了"),
          ),
        ],
      ),
    );
  }

  _submitWord(BuildContext context) async {
    wordList.add(_controller.text);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("wordList", wordList);
    Navigator.pop(context);
  }
}

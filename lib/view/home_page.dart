import 'package:data_management/view/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> wordList = [];

  void _getWordList() async {
    final prefs = await SharedPreferences.getInstance();

    final wordList = prefs.getStringList("wordList");
  }

  @override
  void initState() {
    _getWordList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView.builder(
          itemCount: wordList.length,
          itemBuilder: (context, int index) {
            return Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.message),
                title: Text(wordList[index]),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EditPage(
                  wordList: wordList,
                ),
              ));
          setState((){});
        },
      ),
    );
  }
}

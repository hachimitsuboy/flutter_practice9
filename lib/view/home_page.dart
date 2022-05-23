import 'package:data_management/view/edit_page.dart';
import 'package:data_management/viewModel/view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(sortedTodosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todoリスト"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.check),
              title: Text(todos[index].todo),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => EditScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

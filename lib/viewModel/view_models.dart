import 'package:data_management/model/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum SortType {
  primary,
  deadLine,
  name,
}

class TodosStateNotifier extends StateNotifier<List<Todo>> {

  TodosStateNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }
}


//監視しかできないの？何か処理とかできんのか
final todosStateProvider = StateNotifierProvider<TodosStateNotifier,
    List<Todo>>((ref) {
  return TodosStateNotifier();
});


final sortTypeProvider = StateProvider<SortType>((ref) => SortType.deadLine);


final sortedTodosProvider = Provider<List<Todo>>((ref) {
  final sortType = ref.watch(sortTypeProvider);
  final todos = ref.watch(todosStateProvider);

  switch(sortType) {
    case SortType.deadLine:
      todos.sort((a,b) => a.deadLine.compareTo(b.deadLine));
      return todos;
    case SortType.primary:
      todos.sort((a,b) => a.primary.compareTo(b.primary));
      return todos;
    case SortType.name:
      todos.sort((a,b) => a.todo.compareTo(b.todo));
      return todos;
  }

});
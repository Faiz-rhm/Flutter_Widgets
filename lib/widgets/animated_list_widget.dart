import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  final TextEditingController _controller = TextEditingController();

  final item = [];

  Future<void> addDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text('Add ToDo List'),
          content: TextField(
            controller:  _controller,
            decoration: const InputDecoration(
              hintText: 'E.g Meetings and Events',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                addItem(_controller.text);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        );
      })
    );
  }

  void addItem(String title) {
    item.insert(0, title);
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void removeItem(int index, BuildContext context) {
    AnimatedList.of(context).removeItem(index, (context, animation) {
      return FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: Card(
            elevation: 0,
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            child: ListTile(
              title: Text(item[index], style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500)),
              subtitle: Text(DateTime.now().toString().substring(0,10), style: const TextStyle(fontSize: 12)),
              trailing: IconButton(
                onPressed: () => removeItem(index, context),
                icon: const Icon(Icons.delete),
              ),
            ),
          ),
        ),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedList(
          key: _key,
          initialItemCount: item.length,
          itemBuilder: (((context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  elevation: 0,
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListTile(
                    title: Text(item[index], style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500)),
                    subtitle: Text(DateTime.now().toString().substring(0,10), style: const TextStyle(fontSize: 12)),
                    trailing: IconButton(
                      onPressed: () => removeItem(index, context),
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
            ));
          })),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.clear();
          addDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
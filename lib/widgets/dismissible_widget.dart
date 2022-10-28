import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {

  final List<String> _values = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DismissibleWidget"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _values.length,
        itemBuilder: (BuildContext  context, int  index) {
          var item  = _values[index];

          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              if(direction == DismissDirection.startToEnd){
                print('Remove');
              }else {
                print('Favorites');
              }
              setState(() {
                _values.removeAt(index);
              });
            },
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Remove'),
                    content: const Text('Are you sure you want to remove this item?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Delete'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                }
              );
            },
            background: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(24),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16)
              ),
              child: const Icon(Icons.delete, color: Colors.white, size: 30,),
            ),
            secondaryBackground: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(24),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16)
              ),
              child: const Icon(Icons.star, color: Colors.white, size: 30,),
            ),
            child: NotificationCard(item: item),
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 30,
          child: Icon(Icons.notifications, size: 30,),
        ),
        title: Text(item),
        subtitle: const Text('There is  a nw notifications'),
      ),
    );
  }
}
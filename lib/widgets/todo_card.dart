import 'package:flutter/material.dart%20%20';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;

  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  Widget build(BuildContext context) {
    final id = item['_id'];
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(child: Text("${index + 1}")),
        title: Text(item['title'].toString()),
        subtitle: Text(item['description'].toString()),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              // Open edit page
              navigateEdit(item);
            } else if (value == 'delete') {
              // Delete and remove the item
              deleteById(id);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Text("Edit"),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}

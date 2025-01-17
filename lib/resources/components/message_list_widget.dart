import 'package:flutter/material.dart';
import 'package:while_app/data/model/message.dart';
import 'package:while_app/view/social/message_detail.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.message});
  final List<UserDetail> message;
  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) {
      return Center(
        child: Text(
          'No Message is added yet',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          ListView.builder(
            itemCount: message.length,
            itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                radius: 56,
                backgroundImage: NetworkImage(message[index].image),
              ),
              title: Text(
                message[index].title,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => MessageDetailScreen(
                    userName: message[index].title,
                    userImage: message[index].image,
                  ),
                ));
              },
              contentPadding: const EdgeInsets.only(top: 15, left: 2),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, bottom: 40),
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const Icon(
                Icons.add_comment,
                size: 30,
              ),
              elevation: 10,
              splashColor: Colors.purple,
              extendedPadding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          )
        ],
      ),
    );
  }
}

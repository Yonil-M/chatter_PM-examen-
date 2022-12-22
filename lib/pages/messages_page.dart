import 'package:chatter/helpers.dart';
import 'package:chatter/models/messages_data.dart';
import 'package:chatter/temas.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../models/story_data.dart';
import '../widget/avatar.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _Stories(),),
        SliverList(
          delegate:SliverChildBuilderDelegate(_delegate,),
            ),
      ],
    );

  }
  Widget _delegate(BuildContext context,int index) {
    final Faker faker=Faker();
    final date=Helpers.randomDate();
    return _MessagesTitle(messageData: MessageData(
      senderName: faker.person.name(),
      message: faker.lorem.sentence(),
      messageDate: date,
      dateMessage: Jiffy(date).fromNow(),
      profilePicture: Helpers.randomPictureUrl(),
    ),);
    }
}

class _MessagesTitle extends StatelessWidget {
  const _MessagesTitle({Key? key,
  required this.messageData,
  }):super(key:key) ;

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: Avatar.medium(url: messageData.profilePicture),
       ),
       Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(messageData.senderName,
          style:const TextStyle(
            letterSpacing: 0.2,
            wordSpacing: 1.5,
            fontWeight: FontWeight.w900,
          ),
          ),
          Text(messageData.message),
        ],
       ))
      ],
    );
  }
}


class _Stories extends StatelessWidget {
  const _Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0,top: 8.0,bottom: 16.0),
              child: const Text('Stories',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15.0,
                color: AppColors.textFaded,
              ),),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index) {
                  final faker=Faker();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 60.0,
                      child: _StoryCard(storyData: StoryData(
                      name: faker.person.name(),
                      url: Helpers.randomPictureUrl(),
                      ) ,),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
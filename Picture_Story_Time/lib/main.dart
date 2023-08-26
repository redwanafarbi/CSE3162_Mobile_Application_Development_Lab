import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryLibraryScreen(),
    );
  }
}


class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Library'),
        backgroundColor: Colors.deepPurple.shade300,
      ),

      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
  final Story story;

  StoryViewerScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              onPressed: () {

                // Implement interactive elements or read-aloud functionality
              },
              child: Text('Read Aloud'),

            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontSize: 16),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'Aladdin',
    coverImage: "images/aladdin.jpeg",
    content: "In a city far away there lived a poor boy Aladdin. In a city far away there lived a poor boy Aladdin. The wizard cunningly took him to a mountain asking him to bring a lamp from inside the cave. In the cave, there were gold, silver, and all kind of treasures. Among those was a magic lamp glowing in the dark. Aladdin took the Magic lamp and tried to get out of the cave. The wizard asked Aladdin for the lamp but he asked the wizard to fetch him out first. But the angry wizard closed the cave door and went. Aladdin accidentally rubbed the lamp, and a genie appeared. Aladdin asked the genie to take him home as his first wish. Suddenly a magic carpet flew in and carried him out of the cave. Back home, Aladdin rubbed the magic lamp again and asked the genie for a big palace filled with riches. Genie granted him his second wish, and now Aladdin was the richest man in the city. He got married to the princess of that city. The evil wizard who heard all of this was deeply angered. He went to the princess acting like an old merchant and exchanged the magical lamp with a regular lamp. The wizard rubbed the lamp and made a wish. He asked the genie to give him Aladdin’s palace and the princess. Aladdin hearing this news, sneaked into the evil wizard’s palace while he was asleep. He stole the lamp and rubbed it. Genie asked Aladdin for his last wish, and he commented Genie to take the evil wizard far away. The evil wizard was never to be found again. Aladdin rescued the princess and lived happily ever after in the palace."
  ),

  Story(
    title: 'Two friends and the Bear',
    coverImage: "images/two_friends.jpeg",
    content: 'Once there were two friends who were crossing the jungle. After some time they saw a bear coming towards them. Then, one of the friends quickly climbed the nearby tree and the other one did not know how to climb the tree. So he lays down on the ground holding his breath.The bear reaches near him and sniffs him in the ear. After some time bear left the place, thinking the man is dead. Now the other friend climbs down and asked his friend, what did bear said to him in his ear? He replied,” to be safe from the fake friends.”',
  ),

  Story(
    title: 'The Lion and the Rabbit',
    coverImage: "images/lion.jpeg",
    content: 'Once there was a Lion in the jungle who used to kill 2-3 animals daily for his meal. All animals went to him to tell, that daily one of them will come to him for his meal. So, the Lion agreed and this started going for many days. One day, it was Rabbit’s turn. When he was on his way he saw a well.Now he plans to kill the lion and save himself. He went to the lion and told him that, there is another lion who claims to be more powerful than him. Then the lion asks the rabbit to take him to that lion. The rabbit takes him to the well and said he lives here. When the lion looked in the well he saw his own reflection and jumped in the well and dies.',
  ),

  Story(
    title: 'The Boy Who Cried Wolf',
    coverImage: "images/wolf.jpeg",
    content: 'Once upon a time, there was a boy who had a duty to look after a flock of sheep. The used to lie for his fun.One day he started shouting, “Wolf, Wolf, Wolf”, on hearing this villager ran towards him for his help. But when the villagers reached he was laughing on them as there was no wolf.He was lying and making a fool out of the villagers. This continued for some days. And finally, one day, a wolf really came and shouted again, nobody came and as a result, the boy was killed by the wolf.There was no one to blame but him.',
  ),





  // Add more stories here
];


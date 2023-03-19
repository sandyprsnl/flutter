import './story.dart';

class StoryBank {
  int _stroyIndex = 0;
  final List<Story> _storyBank = [
    Story(
        title:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        title: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        title:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        title:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        title:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        title:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  String getStory() {
    return _storyBank[_stroyIndex].title;
  }

  String getChoice1() {
    return _storyBank[_stroyIndex].choice1;
  }

  String getChoice2() {
    return _storyBank[_stroyIndex].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _stroyIndex == 0) {
      _stroyIndex = 2;
    } else if (choiceNumber == 2 && _stroyIndex == 0) {
      _stroyIndex = 1;
    } else if (choiceNumber == 1 && _stroyIndex == 1) {
      _stroyIndex = 2;
    } else if (choiceNumber == 2 && _stroyIndex == 1) {
      _stroyIndex = 3;
    } else if (choiceNumber == 1 && _stroyIndex == 2) {
      _stroyIndex = 5;
    } else if (choiceNumber == 2 && _stroyIndex == 2) {
      _stroyIndex = 4;
    }
    // ignore: todo
    //TODO: Step 22 - In nextStory() if the storyNumber is equal to 3 or 4 or 5, that means it's the end of the game and it should call a method called restart() that resets the storyNumber to 0.
    else if (_stroyIndex == 3 || _stroyIndex == 4 || _stroyIndex == 5) {
      restart();
    }
  }

  void restart() {
    _stroyIndex = 0;
  }

  bool buttonShouldVisiable() {
    bool result;
    if (_stroyIndex == 0 || _stroyIndex == 1 || _stroyIndex == 2) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }
}

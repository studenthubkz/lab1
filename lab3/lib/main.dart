import 'package:flutter/material.dart';

void main() {
  runApp(const Lab3App());
}

class Lab3App extends StatelessWidget {
  const Lab3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab3 Story Stack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const StoryStackPage(),
    );
  }
}

class StoryStackPage extends StatefulWidget {
  const StoryStackPage({super.key});

  @override
  State<StoryStackPage> createState() => _StoryStackPageState();
}

class _TextState {
  const _TextState({required this.message, required this.style});

  final String message;
  final TextStyle style;
}

class _StoryStackPageState extends State<StoryStackPage> {
  final List<_TextState> _states = const [
    _TextState(
      message:
          'Таңғы уақытта Аружан ерте тұрып, қаладағы алғашқы автобусқа үлгерді.',
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    _TextState(
      message:
          'Жолда ол қоржынына салған кітаптан шабыт алып, жаңа жоба жоспарын құрастырды.',
      style: TextStyle(
        fontSize: 24,
        color: Colors.yellowAccent,
        fontStyle: FontStyle.italic,
      ),
    ),
    _TextState(
      message:
          'Кешке қарай ол өз идеясын достарымен бөлісіп, бірге стартап бастауға шешім қабылдады.',
      style: TextStyle(
        fontSize: 26,
        color: Colors.lightGreenAccent,
        letterSpacing: 1.2,
      ),
    ),
    _TextState(
      message:
          '«Арманға адал болсаң, қалауыңның бәрі де орындалады», — деп олар күнді қорытындылады.',
      style: TextStyle(
        fontSize: 30,
        color: Colors.amber,
        fontFamily: 'Georgia',
        shadows: [
          Shadow(
            offset: Offset(2, 2),
            color: Colors.black45,
            blurRadius: 4,
          ),
        ],
      ),
    ),
  ];

  int _stateIndex = 0;
  bool _hasCompletedCycle = false;

  void _advanceStory() {
    setState(() {
      if (_stateIndex < _states.length - 1) {
        _stateIndex++;
        if (_stateIndex == _states.length - 1) {
          _hasCompletedCycle = true;
        }
      } else {
        _stateIndex = 0;
      }
    });
  }

  void _rewindStory() {
    setState(() {
      if (_stateIndex > 0) {
        _stateIndex--;
      } else {
        _stateIndex = _states.length - 1;
        _hasCompletedCycle = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentState = _states[_stateIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Story Experience'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 32,
            left: 24,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.auto_stories,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    style: currentState.style,
                    child: Text(
                      currentState.message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _advanceStory,
                        icon: const Icon(Icons.navigate_next),
                        label: const Text('Келесі оқиға'),
                      ),
                      TextButton.icon(
                        onPressed: _rewindStory,
                        icon: const Icon(Icons.replay),
                        label: const Text('Артын қайта тыңдау'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _hasCompletedCycle ? 1.0 : 0.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.emoji_events,
                      color: Colors.amberAccent,
                      size: 72,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Жеңіс! Барлық тарих аяқталды.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

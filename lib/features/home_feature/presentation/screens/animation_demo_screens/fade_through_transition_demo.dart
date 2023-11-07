import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughTransitionDemo extends StatefulWidget {
  const FadeThroughTransitionDemo({super.key});

  @override
  State<FadeThroughTransitionDemo> createState() =>
      _FadeThroughTransitionDemoState();
}

class _FadeThroughTransitionDemoState extends State<FadeThroughTransitionDemo> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    _FirstPage(),
    _SecondPage(),
    _ThirdPage(),
  ];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade through')),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          final Widget child,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (final int newValue) {
          setState(() {
            pageIndex = newValue;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Expanded(
      child: Card(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Expanded(
                  child: ColoredBox(
                    color: Colors.black26,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: FlutterLogo(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '123 photos',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '123 photos',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              splashColor: Colors.black38,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _ExampleCard(),
              _ExampleCard(),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _ExampleCard(),
              _ExampleCard(),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _ExampleCard(),
              _ExampleCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        _ExampleCard(),
        _ExampleCard(),
      ],
    );
  }
}

class _ThirdPage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      itemBuilder: (final BuildContext context, final int index) {
        return ListTile(
          leading: const FlutterLogo(
            size: 40,
          ),
          title: Text('List item ${index + 1}'),
          subtitle: const Text('Secondary text'),
        );
      },
      itemCount: 10,
    );
  }
}

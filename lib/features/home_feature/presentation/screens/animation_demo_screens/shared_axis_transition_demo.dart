import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/widgets/app_space.dart';
import 'package:personal_portfolio/core/widgets/app_text_form_field.dart';

class SharedAxisTransitionDemo extends StatefulWidget {
  const SharedAxisTransitionDemo({super.key});

  @override
  State<SharedAxisTransitionDemo> createState() {
    return _SharedAxisTransitionDemoState();
  }
}

class _SharedAxisTransitionDemoState extends State<SharedAxisTransitionDemo> {
  SharedAxisTransitionType? _transitionType =
      SharedAxisTransitionType.horizontal;
  bool _isLoggedIn = false;

  void _updateTransitionType(final SharedAxisTransitionType? newType) {
    setState(() {
      _transitionType = newType;
    });
  }

  void _toggleLoginStatus() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Shared axis')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageTransitionSwitcher(
                reverse: !_isLoggedIn,
                transitionBuilder: (
                  final Widget child,
                  final Animation<double> animation,
                  final Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: _transitionType!,
                    child: child,
                  );
                },
                child: _isLoggedIn ? _CoursePage() : _SignInPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: _isLoggedIn ? _toggleLoginStatus : null,
                    child: const Text('BACK'),
                  ),
                  ElevatedButton(
                    onPressed: _isLoggedIn ? null : _toggleLoginStatus,
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.horizontal,
                  groupValue: _transitionType,
                  onChanged: (final SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('X'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.vertical,
                  groupValue: _transitionType,
                  onChanged: (final SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('Y'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.scaled,
                  groupValue: _transitionType,
                  onChanged: (final SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('Z'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CoursePage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView(
      children: <Widget>[
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Text(
          'Streamling your courses',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Bundled categories appear as groups in your feed. '
            'You can always change this later.',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const _CourseSwitch(course: 'Arts & Crafts'),
        const _CourseSwitch(course: 'Business'),
        const _CourseSwitch(course: 'Illustration'),
        const _CourseSwitch(course: 'Design'),
        const _CourseSwitch(course: 'Culinary'),
      ],
    );
  }
}

class _CourseSwitch extends StatefulWidget {
  const _CourseSwitch({
    required this.course,
  });

  final String course;

  @override
  _CourseSwitchState createState() => _CourseSwitchState();
}

class _CourseSwitchState extends State<_CourseSwitch> {
  bool _value = true;

  @override
  Widget build(final BuildContext context) {
    final String subtitle = _value ? 'Bundled' : 'Shown Individually';
    return SwitchListTile(
      title: Text(widget.course),
      subtitle: Text(subtitle),
      value: _value,
      onChanged: (final bool newValue) {
        setState(() {
          _value = newValue;
        });
      },
    );
  }
}

class _SignInPage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final BuildContext context, final BoxConstraints constraints) {
        final double maxHeight = constraints.maxHeight;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
              const FlutterLogo(
                size: 80,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
              Text(
                'Hi David Park',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
              const Text(
                'Sign in with your account',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              const AppVSpace(),
              const AppTextFormField(
                labelText: 'Email or phone number',
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:theta/theta.dart';

Future<void> main() async {
  /// Initialize Theta instance.
  /// You can get an anonymous key at https://app.buildwiththeta.com
  await Theta.initialize(
    cacheEnabled: false,
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWYiOiI3MjE4ZTIxOC00MmQ5LTQyZTgtYmE1My04MGM2ZTkyN2FiNmMiLCJhbm9uX2tleSI6ImY5M2UzN2U4LTA1ZGEtNDlhMy1hOWRmLThmZTkzODQ5MTQxZSIsImlhdCI6MTY4Njc0ODkzOSwiZXhwIjoxNzE4MzA2NTM5LCJpc3MiOiJodHRwczovL2J1aWxkd2l0aHRoZXRhLmNvbSJ9.Qy-VI8sOZy0KvdVEqc_hS5OE-EV489FbtVtKMAds6ys',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /// ThetaProvider is used to provide the project styles to the widgets.
    /// It's required to use Theta widgets.
    return ThetaProvider(
      theme: ThemeMode.light,
      child: MaterialApp(
        home: Scaffold(
          /// UIBox is the main widget.
          /// It's used to build the UI.
          /// It requires a page [name].
          body: UIBox(
            'Homepage',

            /// [placeholder] is the widget displayed while the page is loading.
            placeholder: () => const CircularProgressIndicator(),

            /// [errorWidget] is the widget displayed if an error occurs.
            errorWidget: (error) => Text(error),

            /// [fit] is how the component should fit the parent.
            /// It can be [ComponentFit.expand] or [ComponentFit.loose].
            fit: ComponentFit.expand,

            /// [overrides] are the properties that can be overriden by the user.
            overrides: [
              /// [Override] requires a [node] identifier and a list of [props].
              /// Use one Override per node.
              Override(
                'node id',
              )..setChild(const UIBox('ComponentName')),

              Override(
                'f03d7221-9165-4862-913f-9e828c4de8b9',
              )
                ..setText('Click me!')
                ..setColor(Colors.red, 1),

              Override(
                'node id 2',
              )..setChildren([const Text('Click me!')]),
            ],

            /// [workflows] are the workflows that can be triggered by the user, mixing no-code and code.
            workflows: [
              Workflow(
                'node id',
                Trigger.onMouseEnter,
                () => debugPrint('Hovered!'),
              ),
              Workflow(
                'node name',
                Trigger.onMouseExit,
                () => debugPrint('Not hovered!'),
              ),
              Workflow(
                'node id',
                Trigger.onTap,
                () => debugPrint('Tapped!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

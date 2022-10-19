import 'package:flutter/material.dart';
import 'package:platform_ui/platform_ui.dart';

void main() {
  platform = TargetPlatform.windows;
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
    return PlatformApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        onChange: (value) {
          setState(() {
            platform = value;
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final void Function(TargetPlatform?) onChange;
  const MyHomePage({super.key, required this.title, required this.onChange});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool checked = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlatformFilledButton(
                  child: Text('Android'),
                  onPressed: () => widget.onChange(TargetPlatform.android),
                ),
                PlatformFilledButton(
                  child: Text('iOS'),
                  onPressed: () => widget.onChange(TargetPlatform.iOS),
                ),
                PlatformFilledButton(
                  child: Text('Linux'),
                  onPressed: () => widget.onChange(TargetPlatform.linux),
                ),
                PlatformFilledButton(
                  child: Text('MacOS'),
                  onPressed: () => widget.onChange(TargetPlatform.macOS),
                ),
                PlatformFilledButton(
                  child: Text('Windows'),
                  onPressed: () => widget.onChange(TargetPlatform.windows),
                ),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            PlatformFilledButton(
              child: const Text("Filled Button"),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
            ),
            PlatformTextButton(
              child: const Text("Text Button"),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
            ),
            PlatformIconButton(
              icon: const Icon(Icons.star_border_rounded),
              onPressed: () {},
            ),
            PlatformSwitch(
              value: checked,
              onChanged: (value) {
                setState(() {
                  checked = value;
                });
              },
              activeThumbColor: Colors.red,
              activeTrackColor: Colors.red[800],
              inactiveTrackColor: Colors.white,
              inactiveThumbColor: Colors.green,
            ),
            const PlatformTextField(
              padding: EdgeInsets.all(8),
              placeholder: "Placeholder",
              label: "Label",
              backgroundColor: Colors.blue,
              focusedBackgroundColor: Colors.amber,
            ),
            PlatformDropDownMenu(
              onChanged: (value) {},
              dropdownColor: Colors.orange,
              elevation: 20,
              items: [
                PlatformDropDownMenuItem(
                  child: const Text("LOL"),
                  value: "LOL",
                ),
                PlatformDropDownMenuItem(
                  child: const Text("Cool"),
                  value: "Cool",
                ),
                PlatformDropDownMenuItem(
                  child: const Text("Foul"),
                  value: "Foul",
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

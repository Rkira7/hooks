import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountPage extends HookWidget {
  String title;
  CountPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counter = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counter.value += 1,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

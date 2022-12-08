import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final _red =  GlobalKey();
final _blue = GlobalKey();
final _yellow = GlobalKey();
final _green = GlobalKey();
final _orange = GlobalKey();

class ScrollPage extends HookWidget {
  String title;
  ScrollPage(this.title, {Key? key}) : super(key: key);

  void scrollTo(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    final _controller = useScrollController();

    // How to set a listener: https://stackoverflow.com/a/63832263/3479489
    useEffect(() {
      print('This will be called only one time');
      _controller.addListener(() => print('Scroll Position: ${_controller.position.pixels}'));
      return _controller.dispose;
    }, [_controller]);

    final containerHeight = MediaQuery.of(context).size.height * .80; // 80% of the height

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create account'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () => scrollTo(_red),
                child: const Text('Red'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_blue),
                child: const Text('Blue'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_yellow),
                child: const Text('Yellow'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_green),
                child: const Text('Green'),
              ),
              OutlinedButton(
                onPressed: () => scrollTo(_orange),
                child: const Text('Orange'),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  Container(
                    key: _red,
                    height: containerHeight,
                    color: Colors.red,
                  ),
                  Container(
                    key: _blue,
                    height: containerHeight,
                    color: Colors.blue,
                  ),
                  Container(
                    key: _yellow,
                    height: containerHeight,
                    color: Colors.yellow,
                  ),
                  Container(
                    key: _green,
                    height: containerHeight,
                    color: Colors.green,
                  ),
                  Container(
                    key: _orange,
                    height: containerHeight,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
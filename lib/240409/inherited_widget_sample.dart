import 'package:flutter/material.dart';

void main() {
  runApp(
    // ChangeNotifierProvider<MyViewModel>(
    //   value: MyViewModel(),
    //   child: const MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPage(),
    );
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends InheritedWidget {
  final T value;

  const ChangeNotifierProvider({
    super.key,
    required super.child,
    required this.value,
  });

  static ChangeNotifierProvider<T> of<T extends ChangeNotifier>(
      BuildContext context) {
    // dependOnInheritedWidgetOfExactType : 위젯 트리에서 가장 가까운 타입을 찾는 메서드
    return context
        .dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>()!;
  }

  // 수정이 되었는 지 알려주는 규칙을 정의하는 메서드 => 무분별한 재빌드를 컨트롤할 수 있다.
  @override
  bool updateShouldNotify(ChangeNotifierProvider oldWidget) {
    return value != oldWidget.value;
  }
}

class MyViewModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class MyViewModelTest extends StatefulWidget {
  const MyViewModelTest({super.key});

  @override
  State<MyViewModelTest> createState() => _MyViewModelTestState();
}

class _MyViewModelTestState extends State<MyViewModelTest> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ChangeNotifierProvider.of<MyViewModel>(context).value;

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.count.toString()),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  viewModel.increment();
                });
              },
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NextScreen()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ChangeNotifierProvider.of<MyViewModel>(context).value;

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.count.toString()),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  viewModel.increment();
                });
              },
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NextScreen()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

// 공식 문서 예제
class FrogColor extends InheritedWidget {
  const FrogColor({
    super.key,
    required this.color,
    required super.child,
  });

  final Color color;

  static FrogColor? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FrogColor>();
  }

  static FrogColor of(BuildContext context) {
    final FrogColor? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FrogColor oldWidget) => color != oldWidget.color;
}

// continuing from previous example...
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FrogColor(
        color: Colors.green,
        child: Builder(
          builder: (BuildContext innerContext) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello Frog',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: FrogColor.of(innerContext).color,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

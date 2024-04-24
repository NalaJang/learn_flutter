import 'dart:async';

void main() async {
  // stream 생성
  final streamController = StreamController<int>();

  // stream 의 이벤트를 구독하여 데이터 수신
  final StreamSubscription<int> subscription =
      streamController.stream.listen((event) {
    print('Received data: $event');
  });

  // stream 에서 데이터 전송
  streamController.sink.add(1);
  streamController.sink.add(2);
  streamController.sink.add(3);

  // stream 종료
  streamController.close();
}

import 'dart:html';

void main() {
  final ButtonElement btnHello = querySelector('button');
  btnHello.onClick
    .timeout(
    new Duration(seconds: 5),
    onTimeout: (sink) => sink.addError("Dead...")
  ).listen(
    (event) {},
    onError: (err) => print(err)
  );
}

// <button id="btnHello">Hello</button>

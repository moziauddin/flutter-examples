import 'dart:html';

void main() {
  final InputElement input = querySelector("input");
  final ButtonElement button = querySelector("button");
  LabelElement label = querySelector("label");

  button.onClick
    .take(4)
    .where((event) => input.value == 'devops')
    .listen( 
    (event) => label.text = "That is correct!",
    onDone: () => label.text = "All Done. Can guess anymore"
  );
}

// HTML

// <h1>Enter your word</h1>
// <input />
// <br>
// <button id="btnHello">Hello</button>
// <label></label>

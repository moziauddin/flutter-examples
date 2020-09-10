import 'dart:html';
import 'dart:async';

void main() {
  final String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final InputElement input = querySelector("input");
  final DivElement label = querySelector("div");
  final validator = new StreamTransformer.fromHandlers(
    handleData: (inputValue, sink)  {
      if(RegExp(emailRegex).hasMatch(inputValue)) {
        sink.add(inputValue);
      } else  {
        sink.addError("Not an Email Address!");
      }
    }
  );
  input.onInput
    //.listen((dynamic event) => print(event.target.value));
    .map((dynamic event) => event.target.value)
    .transform(validator)
    .listen(
    (value) => label.innerHtml = "",
    onError: (error) => label.innerHtml = error
  );
}

/*
html code
-------------------------
<h1>Enter an email:</h1>
<input />
<br>
<div style="color: red;"></div>
*/

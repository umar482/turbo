export default class Bridge {
  static sayHello() {
    // document.body.innerHTML = "<h1>Hello!</h1>"
    fetch('/posts.json')
  .then(response => response.json())
  .then(data =>  "Mehar");
  }
}
// document.addEventListener("click", function (e) {
//   document.body.innerHTML = "<h1>Hello!</h1>"
// });

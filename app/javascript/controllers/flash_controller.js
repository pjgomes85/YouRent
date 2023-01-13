import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  connect() {

    var alert = document.getElementById("one");

    setTimeout(function() {
      alert.style.display = 'none';
    }, 8000)

  }
}


// document.getElementById("one").style.cssText =
//             " opacity: 1; transition: opacity 0.2s;";

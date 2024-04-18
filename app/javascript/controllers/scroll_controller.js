import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets =  ["nav"]
    scroll(event) {
      const navbar = document.querySelector(".navbar")
      window.onscroll = function(e) {
        // print "false" if direction is down and "true" if up
        const direction = this.oldScroll > this.scrollY
        if (direction) {
          console.log("sobe");
          navbar.style.transform = "translatey(0)"
        } else {
          console.log("desce");
          navbar.style.transform = "translatey(-100%)"
        }
        this.oldScroll = this.scrollY;
      }
    };
  };



// .navbar[data-scroll="out"] {
//   transform: translatey(-100%);
// }

// [data-scroll-dir-y="-1"] .navbar {
//   transform: translatey(0);
// }

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["item"]
  connect() {
    const slides = document.querySelectorAll(".image-prod");
    const dots = document.querySelectorAll("#dots")

    slides.forEach((slide, indx) => {

      slide.style.transform = `translateY(${indx * 100}%)`;
    });
    let curSlide = 0;

    let maxSlide = slides.length - 1;


// select next slide button
    const nextSlide = document.querySelector(".btn-next");

    // add event listener and next slide functionality
    nextSlide.addEventListener("click", function () {
      if (curSlide === maxSlide) {
        curSlide = 0;
      } else {
        curSlide++;
      }

      slides.forEach((slide, indx) => {
        slide.style.transform = `translateY(${100 * (indx - curSlide)}%)`;
      });
    });

    const prevSlide = document.querySelector(".btn-prev");

    // add event listener and navigation functionality
    prevSlide.addEventListener("click", function () {
      // check if current slide is the first and reset current slide to last
      if (curSlide === 0) {
        curSlide = maxSlide;
      } else {
        curSlide--;
      }

        // move slide by 100%
      slides.forEach((slide, indx) => {
        slide.style.transform = `translateY(${100 * (indx - curSlide)}%)`;
      });
    });

    console.log(dots[0]);

    if (slides.length == 1) {
      prevSlide.style.display = "none"
      nextSlide.style.display = "none"
    }

  }
}

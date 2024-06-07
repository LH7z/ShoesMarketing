// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import CarouselController from "controllers/carousel_controller"
application.register("carousel", CarouselController)

import CarouselHomeController from "controllers/carousel_home_controller"
application.register("carousel-home", CarouselHomeController)

import HelloController from "controllers/hello_controller"
application.register("hello", HelloController)

import ScrollController from "controllers/scroll_controller"
application.register("scroll", ScrollController)

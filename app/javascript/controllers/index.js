import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PreviewController from "./preview_controller"
application.register("preview", PreviewController)

import TutorialModalController from "./tutorial_modal_controller"
application.register("tutorial-modal", TutorialModalController)

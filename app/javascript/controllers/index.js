import { application } from "./application"
import ImagePreviewController from "./image_preview_controller"
application.register("image-preview", ImagePreviewController)

import TutorialModalController from "./tutorial_modal_controller"
application.register("tutorial-modal", TutorialModalController)

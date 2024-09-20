// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// import CommentController from "./comment_controller";

// application.register("comment", CommentController)
eagerLoadControllersFrom("controllers", application)

// app/javascript/application.js
import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import ProjectSectionController from "./controllers/project_section_controller"

// Start Stimulus application
window.Stimulus = Application.start()

// Register the ProjectSectionController
Stimulus.register("project-section", ProjectSectionController)

console.log("application.js loaded")
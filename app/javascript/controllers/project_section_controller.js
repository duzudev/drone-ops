import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log("Project Section controller connected", this.element)
  }

  loadSection(event) {
    event.preventDefault()
    console.log("loadSection called", event.currentTarget.dataset.section)

    const section = event.currentTarget.dataset.section
    const projectId = this.element.dataset.projectId

    console.log(`Loading section: ${section} for project: ${projectId}`)

    // Show loading spinner
    this.contentTarget.innerHTML = "<div class='spinner-border' role='status'><span class='sr-only'>Loading...</span></div>"

    // Use Turbo-compatible fetch request
    fetch(`/projects/${projectId}/load_section?section=${section}`, {
      headers: {
        "Accept": "text/vnd.turbo-stream.html",
        "X-Requested-With": "XMLHttpRequest"
      }
    })
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`)
        }
        return response.text()
      })
      .then(html => {
        console.log("Received response", html)
        Turbo.renderStreamMessage(html)
        this.updateButtonStyles(section)
      })
      .catch(error => {
        console.error("Failed to load section:", error)
        this.contentTarget.innerHTML = `<div class="alert alert-danger">Failed to load section: ${error.message}</div>`
      })
  }

  updateButtonStyles(activeSection) {
    console.log("Updating button styles for section:", activeSection)
    this.element.querySelectorAll(".load-section").forEach(button => {
      button.classList.toggle("btn-secondary", button.dataset.section === activeSection)
      button.classList.toggle("btn-outline-secondary", button.dataset.section !== activeSection)
    })
  }
}
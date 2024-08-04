// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs";
import $ from "jquery";

// Start Rails UJS
Rails.start();

// Ensure jQuery is available globally
window.$ = $;
window.jQuery = $;

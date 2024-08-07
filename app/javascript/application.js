// app/javascript/application.js
import "./projects"; // Import the projects.js file
import '../navbar';
import "@hotwired/turbo-rails";
import "controllers";
import Rails from "@rails/ujs";
import "bootstrap"; // Import Bootstrap JS here


// Start Rails UJS
Rails.start();

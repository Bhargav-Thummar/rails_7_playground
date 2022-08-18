// Entry point for the build script in your package.json
import { Turbo } from "@hotwired/turbo-rails"

import "./controllers"

// // The two following lines disable Turbo on the whole application
// Turbo.session.drive = false

import "./custom/index.js"

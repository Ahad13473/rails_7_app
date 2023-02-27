// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import Rails from "@rails/ujs"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import "@hotwired/turbo-rails"
import "controllers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

Rails.start()
Turbo.start()

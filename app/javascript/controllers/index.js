// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from 'activestorage';


import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("controllers", true, /_controller\.js$/);
application.load(definitionsFromContext(context));


Rails.start();
Turbolinks.start();
ActiveStorage.start();

$(document).ready(function() {
    $('#list_table').DataTable();
} );
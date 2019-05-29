/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from 'activestorage';

import "@stimulus/polyfills"
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

import 'bootstrap';
import 'datatables.net-bs4';
import 'datatables.net-buttons-bs4';
import 'datatables.net-keytable-bs4';
import 'datatables.net-responsive-bs4';
import 'datatables.net-scroller-bs4';
import Inputmask from "inputmask";

const application = Application.start();
const context = require.context("controllers", true, /_controller\.js$/);
application.load(definitionsFromContext(context));


Rails.start();
Turbolinks.start();
ActiveStorage.start();

$(document).ready(function() {
    $('#list_table_public,#list_table').DataTable({
        dom: 'Bfrtip',
        buttons: [
          'copy', 'csv', 'excel', 'pdf'
        ],
        responsive: true,
        paging: false,
        language: {
          "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
        },
        columnDefs: [
        { responsivePriority: 1, targets: 1 },
        { responsivePriority: 2, targets: -1 }
        ]
    });
    Inputmask().mask(document.querySelectorAll("input"));
});
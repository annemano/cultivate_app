// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
require("trix")
require("@rails/actiontext")

// Internal imports, e.g:
import { toggleQuestionsDisplay } from '../components/guided_entry';

import { initCommunityCable } from '../channels/community_channel';
import { initTrix } from '../components/init_trix'
import { initDoodle } from '../components/doodle'

initTrix();

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  toggleQuestionsDisplay();
  initCommunityCable();
  initDoodle();
});


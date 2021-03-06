// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("data-confirm-modal")
//= require twitter/bootstrap/rails/confirm
//= require data-confirm-modal

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)



// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import { initToggleFavoriteIcon } from '../components/favorite';
import { initFromSelectRace } from '../components/form_selrace';
import { initPreview } from '../components/preview';
import { initToggleVisibility } from '../components/toggle';
import { initSearchSelectRace } from '../components/search_selrace';
// import { initScrollAuto } from '../components/scroll_auto';

import { initDropDownForm } from '../components/drop_down_form';

import { initShare } from '../components/share';
// import { initToolTipBT } from '../components/tool_tip_bt';
import { initToolTip } from '../components/tool_tip';



// initSearchSelectRace

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initToggleFavoriteIcon();
  initFromSelectRace();
  initPreview();
  initToggleVisibility();
  initSearchSelectRace();
  initDropDownForm();
  // initScrollAuto();

  initShare();
 // initToolTipBT();
  initToolTip();
});

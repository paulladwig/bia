//= require clipboard
import "bootstrap";
require("bootstrap-select");
import $ from 'jquery';
global.$ = jQuery;

import {addLinkInNavbarToggle} from '../pages/home.js';

import {copyToClipboard} from '../plugins/clickboard.js'

import {mapActivationButton} from '../pages/restaurant_index.js'

addLinkInNavbarToggle();
import { recommendation_modal, share_modal } from '../components/modal'
import { locate_user } from '../components/locator';
import { autoSubmit } from '../components/autosubmit';
import { turn_dropdown_icon } from '../pages/show';

turn_dropdown_icon();
recommendation_modal();
share_modal();
locate_user();
autoSubmit();


copyToClipboard();

mapActivationButton();

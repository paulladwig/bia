//= require clipboard
import "bootstrap";
import {addLinkInNavbarToggle} from '../pages/home.js';

import {copyToClipboard} from '../plugins/clickboard.js'

addLinkInNavbarToggle();
import { recommendation_modal, share_modal } from '../components/modal'
import { locate_user } from '../components/locator';
// import { turn_dropdown_icon } from '../pages/show';

// turn_dropdown_icon();
recommendation_modal();
share_modal();
locate_user();


copyToClipboard();

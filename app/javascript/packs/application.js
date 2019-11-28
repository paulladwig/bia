import "bootstrap";
import {addLinkInNavbarToggle} from '../pages/home.js';

addLinkInNavbarToggle();
import { recommendation_modal, share_modal } from '../components/modal'
import { locate_user } from '../components/locator';

recommendation_modal();
share_modal();
locate_user()

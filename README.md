# 'Landing Page' from Start Boostrap

This Ruby on Rails app (written on Ruby 2.2.3 and Rails 4.2.4) is based on the Bootstrap theme found at [http://startbootstrap.com/template-overviews/landing-page/](http://startbootstrap.com/template-overviews/landing-page/) (retrieved 10/28/2015) and reformatted into Ruby on Rails using Haml and Sass.  Right now, it's a static page (so RoR isn't very necessary), but is ready to work with Postgres on Heroku (and assumes that Postgres is used locally but is easy to switch local development (i.e., `Rails.env.development`) to Sqlite3 if desired, though that's not a recommended best-practice).

## Current Status

This application is maintained by **Richard Newman**.   However, the original theme design was created and is maintained by **David Miller** (see below).   I (Richard Newman) take the full blame for any mistakes in translating Mr. Miller's design over to Ruby on Rails and I take no credit for the layout and design itself.  This was done as a quick way to apply the theme for use in a Ruby on Rails application and so only represents a translation, not an original creation.

While the original fonts-awesome had Sass, Less, and basic implementation, this version only contains the Sass version since that's all that's needed to make the overall theme work.   Bootstrap is provided by the `bootstrap-sass` gem and so does not use
the bootstrap files provided in the original theme.

Rspec is installed and ready for use, but as of this writing, no specs have been written (it's a pretty basic static site right now).

Because this template uses the Apache 2.0 license, then this app does as well...

## Copyright and License
Copyright 2015, Newman Works, LLC    
Copyright 2013-2015 Iron Summit Media Strategies, LLC.

This code released under the [Apache 2.0](https://github.com/rdnewman/start_bootstrap_landing_page/blob/master/LICENSE) license.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.

### Original Theme Creators

The original Start Bootstrap theme was created by and is maintained by **David Miller**, Managing Parter at [Iron Summit Media Strategies](http://www.ironsummitmedia.com/).

* https://twitter.com/davidmillerskt
* https://github.com/davidtmiller

Start Bootstrap is based on the [Bootstrap](http://getbootstrap.com/) framework created by [Mark Otto](https://twitter.com/mdo) and [Jacob Thorton](https://twitter.com/fat).

The original theme code is released under the [Apache 2.0](https://github.com/IronSummitMedia/startbootstrap-landing-page/blob/gh-pages/LICENSE) license.

Dynamo
=========

Quick wiki-esque ERB sandbox

How To
------
* bundle install
* Edit/create config/database.yml 
* rake db:setup
* rails server
* Start using it!

Syntax
------
* {code} - Runs the code
* {=code} - Prints the results of the code
* {%page} - Link to view or create the page
* {%page:title} - Link to view or create the page that looks like the title
* {!stuff} - Comments
* {#page} - Includes the content of the page
* {&stuff} - This stuff only shows up if the page was included
* {-stuff} - This stuff only shows up if the page wasn't included

    Dynamo is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Dynamo is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dynamo.  If not, see <http://www.gnu.org/licenses/>.


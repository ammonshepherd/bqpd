# NEXT TO-DO
Figure out how the bqpd server/page runs capistrano to update the remote/same
location for the site.


# Configuration
Vagrant set up as remote web server: vmboxes/rails/

With two sites: 
  - /websites/eventually/ 
    - vhost set asstatic.dev 
  - /websites/todotest/ 
    - vhost set as todo.dev

laptop /etc/hosts has:
  - static.dev pointing to vagrant IP

Capistrano:
With vagrant running in vmboxes/rails/
On laptop, in learning/html5-site/, 
  - make changes
  - git add, git commit, git push
  - `cap staging deploy` 


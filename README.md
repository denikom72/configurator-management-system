# configurator-management-system

It is a oop-perl, mysql, angulal and jquery webapplication for building a configurator by a formular and drag&drop-features.
There is a cgi-directory necesarry, for the perl-prototype, for the python-version too. The php7-version is ona way,
there you will need a common "docroot-folder". You can see small tipps on the video,
how to adapt a webservers fast for a cgi-folder and small fast checks of the mysql-database.

There are just two cgi-files, index.cgi and controller.cgi, the rest are pm-modules, respectively perl-classes. I will prepare either a download as a docker-appliance or an ansible/vagrant-installer.

A database-dump-file "DB_DUMP.sql" is in the cgi-directory. The cli-command is 
`mysql -u root -p < DB_DUMP.sql`

Explanation on this [video-demo](http://www.green-homepages.de/#configur-m-system)

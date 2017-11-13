package DB_DATA;
use strict;
use warnings;


use lib "/var/www/cgi-bin/CONFIGURATORCMS/";
use db_manager;

use Exporter;
our @ISA = 'Exporter';

our @EXPORT = qw( $db $db_user $db_pw $table);

###CREDENTIALS###
our ( $db, $db_user, $db_pw ) = ("CONFIGURATORCMS", "root", "t00rt00r");

our $table = "elems";

our $inst = db_manager->new( $db, $db_user, $db_pw );	
our $dbh = $inst->con( $inst->{"db_name"}, $inst->{"user"}, $inst->{"pw"} );

###SQL-QUERIES###

#index
our $sql_sess = "SELECT rand_date, sess_act FROM login WHERE sess_act = ?;";

#controler
our $sql_sess_ofId = "SELECT rand_date, sess_act FROM login WHERE id = ?;";

#login
our $ins_credentials = "INSERT INTO login (user, pw) VALUES (?, ?);";
# this query select id from assigned categorie ( which is to an simple element ) and the column cat have to be be use to check is it zero,
# cause just then it can be used as a category for other elements
our $check_credentials = "SELECT id, sess_act FROM login WHERE user = ? AND pw = ?;";
our $set_random = "UPDATE login SET sess_act = ?, rand_date = ? ;";

#update
our $upd_logout = "UPDATE login SET sess_act = 0;";

#mysave, categs
our $ins_el = "INSERT INTO " . $table . " (el, cat, singleprice) VALUES (?, ?, ?);";
# this query select id from assigned categorie ( which is to an simple element ) and the column cat gonna be use to check is it zero, cause just then it can be used as a category for other elements
our $elem_id = "SELECT id FROM elems WHERE el = ?;";
our $categ_id = "SELECT cat FROM elems WHERE el = ?;";

#mytruncate
our $trunc_el = "TRUNCATE TABLE ". $table .";";
our $sel_categs = "SELECT el FROM " . $table . " WHERE cat=?;";
our $ins_price = "INSERT INTO " . $table . " (total_price) VALUES (?);";
# this query select id from assigned categorie ( which is to an simple element ) and the column cat gonna be use to check is it zero, cause just then it can be used as a category for other elements
our $price = "SELECT total_price FROM price;";

#mydelete
our $del_el = "DELETE FROM " . $table . " WHERE el = ?;";

#myupdate
our $update_el = "UPDATE " . $table . " SET cat = ? WHERE el = ?;";

#newprice
our $upd_price = "UPDATE price SET total_price = ? WHERE id = 1;";

our $sel_with_rownumb = "SELECT SQL_CALC_FOUND_ROWS * FROM " . $table;
our $sel_all = "SELECT * FROM " . $table . ";";
our $sel_all_categs = "SELECT cat FROM " . $table . ";";


1;

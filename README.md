CS348 Project

Translations of CREATE statements to RAILS statements:

CREATE TYPE "item_type" AS ENUM (
 'decor',
 'menu',
 'ent'
);

CREATE TABLE "clients" (
 "id" SERIAL PRIMARY KEY,
 "first_name" varchar,
 "last_name" varchar,
 "telephone" int,
 "email" varchar unique
);

bin/rails generate scaffold Client id:primary_key first_name:string last_name:string telephone:int email:string

CREATE TABLE "venues" (
 "id" SERIAL PRIMARY KEY,
 "name" varchar,
 "cost" numeric(10,2)
);

bin/rails generate scaffold Venue id:primary_key name:string cost:decimal

CREATE TABLE "addresses" (
 "id" SERIAL PRIMARY KEY,
 "street_num" int not null,
 "street_name" varchar not null,
 "postal_code" varchar,
 "city" varchar,
 "province" varchar
);

bin/rails generate scaffold Address id:primary_key street_num:integer street_name:string postal_code:string city:string province:string

CREATE TABLE "client_addresses" (
 "id" SERIAL PRIMARY KEY,
 "client_id" int not null,
 "address_id" int not null,
 constraint "unique_client_and_address"
	unique("client_id", "address_id")
);

bin/rails generate scaffold ClientAddress id:primary_key client:references address:references

CREATE TABLE "venue_addresses" (
 "id" SERIAL PRIMARY KEY,
 "venue_id" int not null,
 "address_id" int not null,
 constraint "unique_venue_and_address"
	unique("venue_id", "address_id")
);

bin/rails generate scaffold VenueAddress id:primary_key venue:references address:references

CREATE TABLE "items" (
 "id" SERIAL PRIMARY KEY,
 "type" "item_type" not null,
 "name" varchar not null,
 "url" varchar,
 "desc" text
);

bin/rails generate scaffold Item id:primary_key type:integer name:string url:string desc:text

CREATE TABLE "suppliers" (
 "id" SERIAL PRIMARY KEY,
 "first_name" varchar,
 "last_name" varchar,
 "telephone" int,
 "events_supplied" int,
);

bin/rails generate scaffold Supplier id:primary_key first_name:string last_name:string telephone:integer events_supplied:integer

CREATE TABLE "ratings" (
 "id" SERIAL PRIMARY KEY,
 "supplier_id" int not null,
 "comment" varchar,
 "score" int
);

bin/rails generate scaffold Rating id:primary_key supplier:references score:integer

CREATE TABLE "supplier_items" (
 "id" SERIAL PRIMARY KEY,
 "item_id" int not null,
 "supplier_id" int not null,
 "quantity" int,
 "cost" numeric(10,2)
);

bin/rails generate scaffold SupplierItem id:primary_key supplier:references item:references quantity:integer cost:decimal

CREATE TABLE "menus" (
 "id" SERIAL PRIMARY KEY,
 "name" varchar,
 "desc" text
);

bin/rails generate scaffold Menu id:primary_key name:string desc:text

CREATE TABLE "menu_items" (
 "id" SERIAL PRIMARY KEY,
 "menu_id" int not null,
 "item_id" int not null,
 "quantity" int
);

bin/rails generate scaffold MenuItem id:primary_key menu:references item:references quantity:integer

CREATE TABLE "ents" (
 "id" SERIAL PRIMARY KEY,
);

bin/rails generate scaffold Ent id:primary_key

CREATE TABLE "ent_items" (
 "id" SERIAL PRIMARY KEY,
 "ent_id" int not null,
 "item_id" int not null,
 "quantity" int,
 "ord" int
);

bin/rails generate scaffold EntItem id:primary_key ent:references item:references quantity:integer ord:integer

CREATE TABLE "decors" (
 "id" SERIAL PRIMARY KEY,
);

bin/rails generate scaffold Decor id:primary_key

CREATE TABLE "decor_items" (
 "id" SERIAL PRIMARY KEY,
 "decor_id" int not null,
 "item_id" int not null,
 "quantity" int
);

bin/rails generate scaffold DecorItem id:primary_key decor:references item:references quantity:integer

CREATE TABLE "events" (
 "id" SERIAL PRIMARY KEY,
 "client_id" int,
 "venue_id" int,
 "menu_id" int,
 "decor_id" int,
 "ent_id" int,
 "attendees" int,
 "date" date,
 constraint "single_event_per_date_and_venue"
 	unique("venue_id", "date")
);


bin/rails generate scaffold Event id:primary_key client:references venue:references menu:references decor:references ent:references attendees:integer date:date

CREATE TABLE "event_items" (
 "id" SERIAL PRIMARY KEY,
 "item_id" int not null,
 "event_id" int not null,
 "supplier_id" int,
 "quantity" int
);

bin/rails generate scaffold EventItem id:primary_key item:references event:references supplier:references quantity:integer

ALTER TABLE "client_addresses" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("id");

ALTER TABLE "client_addresses" ADD FOREIGN KEY ("address_id") REFERENCES "addresses" ("id");

ALTER TABLE "venue_addresses" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");

ALTER TABLE "venue_addresses" ADD FOREIGN KEY ("address_id") REFERENCES "addresses" ("id");

ALTER TABLE "ratings" ADD FOREIGN KEY ("supplier_id") REFERENCES "suppliers" ("id");

ALTER TABLE "supplier_items" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");

ALTER TABLE "supplier_items" ADD FOREIGN KEY ("supplier_id") REFERENCES "suppliers" ("id");

ALTER TABLE "menu_items" ADD FOREIGN KEY ("menu_id") REFERENCES "menus" ("id");

ALTER TABLE "menu_items" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");

ALTER TABLE "ent_items" ADD FOREIGN KEY ("ent_id") REFERENCES "ents" ("id");

ALTER TABLE "ent_items" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");

ALTER TABLE "decor_items" ADD FOREIGN KEY ("decor_id") REFERENCES "decors" ("id");

ALTER TABLE "decor_items" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");

ALTER TABLE "events" ADD FOREIGN KEY ("client_id") REFERENCES "clients" ("id");

ALTER TABLE "events" ADD FOREIGN KEY ("venue_id") REFERENCES "venues" ("id");

ALTER TABLE "events" ADD FOREIGN KEY ("menu_id") REFERENCES "menus" ("id");

ALTER TABLE "events" ADD FOREIGN KEY ("decor_id") REFERENCES "decors" ("id");

ALTER TABLE "events" ADD FOREIGN KEY ("ent_id") REFERENCES "ents" ("id");

ALTER TABLE "event_items" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");

ALTER TABLE "event_items" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id");

ALTER TABLE "event_items" ADD FOREIGN KEY ("supplier_id") REFERENCES "suppliers" ("id");

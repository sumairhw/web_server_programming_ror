### Creating a Brewery

```ruby
irb(main):001> b = Brewery.create(name: "BrewDog", year: 2007)
  TRANSACTION (0.2ms)  BEGIN
  Brewery Create (1.3ms)  INSERT INTO "breweries" ("name", "year", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["name", "BrewDog"], ["year", 2007], ["created_at", "2023-09-03 10:09:42.894946"], ["updated_at", "2023-09-03 10:09:42.894946"]]
  TRANSACTION (0.4ms)  COMMIT
=>
#<Brewery:0x000000010c077850
...
```


### Adding Beers to Brewery

```ruby
irb(main):002> b.beers.create(name: "Punk IPA", style: "IPA")
  TRANSACTION (0.1ms)  BEGIN
  Beer Create (0.4ms)  INSERT INTO "beers" ("name", "style", "brewery_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Punk IPA"], ["style", "IPA"], ["brewery_id", 5], ["created_at", "2023-09-03 10:12:55.665283"], ["updated_at", "2023-09-03 10:12:55.665283"]]
  TRANSACTION (0.4ms)  COMMIT
=>
#<Beer:0x000000010c3be040
 id: 11,
 name: "Punk IPA",
 style: "IPA",
 brewery_id: 5,
 created_at: Sun, 03 Sep 2023 10:12:55.665283000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:12:55.665283000 UTC +00:00>
irb(main):003> b.beers.create(name: "Nanny State", style: "Low alcohol")
  TRANSACTION (0.2ms)  BEGIN
  Beer Create (0.3ms)  INSERT INTO "beers" ("name", "style", "brewery_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Nanny State"], ["style", "Low alcohol"], ["brewery_id", 5], ["created_at", "2023-09-03 10:13:19.564827"], ["updated_at", "2023-09-03 10:13:19.564827"]]
  TRANSACTION (0.9ms)  COMMIT
=>
#<Beer:0x000000010c813848
 id: 12,
 name: "Nanny State",
 style: "Low alcohol",
 brewery_id: 5,
 created_at: Sun, 03 Sep 2023 10:13:19.564827000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:13:19.564827000 UTC +00:00>irb(main):001> b = Brewery.create(name: "BrewDog", year: 2007)
  TRANSACTION (0.2ms)  BEGIN
  Brewery Create (1.3ms)  INSERT INTO "breweries" ("name", "year", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["name", "BrewDog"], ["year", 2007], ["created_at", "2023-09-03 10:09:42.894946"], ["updated_at", "2023-09-03 10:09:42.894946"]]
  TRANSACTION (0.4ms)  COMMIT
=>
#<Brewery:0x000000010c077850
...
irb(main):002> b.beers.create(name: "Punk IPA", style: "IPA")
  TRANSACTION (0.1ms)  BEGIN
  Beer Create (0.4ms)  INSERT INTO "beers" ("name", "style", "brewery_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Punk IPA"], ["style", "IPA"], ["brewery_id", 5], ["created_at", "2023-09-03 10:12:55.665283"], ["updated_at", "2023-09-03 10:12:55.665283"]]
  TRANSACTION (0.4ms)  COMMIT
=>
#<Beer:0x000000010c3be040
 id: 11,
 name: "Punk IPA",
 style: "IPA",
 brewery_id: 5,
 created_at: Sun, 03 Sep 2023 10:12:55.665283000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:12:55.665283000 UTC +00:00>
irb(main):003> b.beers.create(name: "Nanny State", style: "Low alcohol")
  TRANSACTION (0.2ms)  BEGIN
  Beer Create (0.3ms)  INSERT INTO "beers" ("name", "style", "brewery_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Nanny State"], ["style", "Low alcohol"], ["brewery_id", 5], ["created_at", "2023-09-03 10:13:19.564827"], ["updated_at", "2023-09-03 10:13:19.564827"]]
  TRANSACTION (0.9ms)  COMMIT
=>
#<Beer:0x000000010c813848
 id: 12,
 name: "Nanny State",
 style: "Low alcohol",
 brewery_id: 5,
 created_at: Sun, 03 Sep 2023 10:13:19.564827000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:13:19.564827000 UTC +00:00>
```

### Adding Ratings to beers

```ruby
irb(main):004> beer = Beer.find_by(name: "Punk IPA")
  Beer Load (0.4ms)  SELECT "beers".* FROM "beers" WHERE "beers"."name" = $1 LIMIT $2  [["name", "Punk IPA"], ["LIMIT", 1]]
=>
#<Beer:0x000000010c675f18
...
irb(main):005> beer.ratings.create score: 10
  TRANSACTION (0.1ms)  BEGIN
  Rating Create (0.4ms)  INSERT INTO "ratings" ("score", "beer_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["score", 10], ["beer_id", 11], ["created_at", "2023-09-03 10:17:36.371185"], ["updated_at", "2023-09-03 10:17:36.371185"]]
  TRANSACTION (0.6ms)  COMMIT
=>
#<Rating:0x000000010c1d6408
 id: 5,
 score: 10,
 beer_id: 11,
 created_at: Sun, 03 Sep 2023 10:17:36.371185000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:17:36.371185000 UTC +00:00>
irb(main):006> beer.ratings.create score: 20
  TRANSACTION (0.2ms)  BEGIN
  Rating Create (0.3ms)  INSERT INTO "ratings" ("score", "beer_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["score", 20], ["beer_id", 11], ["created_at", "2023-09-03 10:17:53.507300"], ["updated_at", "2023-09-03 10:17:53.507300"]]
  TRANSACTION (0.7ms)  COMMIT
=>
#<Rating:0x000000010c893980
 id: 6,
 score: 20,
 beer_id: 11,
 created_at: Sun, 03 Sep 2023 10:17:53.507300000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:17:53.507300000 UTC +00:00>

 irb(main):007> beer = Beer.find_by(name: "Nanny State")
  Beer Load (1.7ms)  SELECT "beers".* FROM "beers" WHERE "beers"."name" = $1 LIMIT $2  [["name", "Nanny State"], ["LIMIT", 1]]
=>
#<Beer:0x000000010c69c320
...
irb(main):008> beer.ratings.create score: 10
  TRANSACTION (0.2ms)  BEGIN
  Rating Create (0.3ms)  INSERT INTO "ratings" ("score", "beer_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["score", 10], ["beer_id", 12], ["created_at", "2023-09-03 10:20:10.891392"], ["updated_at", "2023-09-03 10:20:10.891392"]]
  TRANSACTION (0.8ms)  COMMIT
=>
#<Rating:0x000000010c89eb00
 id: 7,
 score: 10,
 beer_id: 12,
 created_at: Sun, 03 Sep 2023 10:20:10.891392000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:20:10.891392000 UTC +00:00>
irb(main):009> beer.ratings.create score: 20
  TRANSACTION (0.7ms)  BEGIN
  Rating Create (0.5ms)  INSERT INTO "ratings" ("score", "beer_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["score", 20], ["beer_id", 12], ["created_at", "2023-09-03 10:20:14.384069"], ["updated_at", "2023-09-03 10:20:14.384069"]]
  TRANSACTION (0.8ms)  COMMIT
=>
#<Rating:0x000000010c819ec8
 id: 8,
 score: 20,
 beer_id: 12,
 created_at: Sun, 03 Sep 2023 10:20:14.384069000 UTC +00:00,
 updated_at: Sun, 03 Sep 2023 10:20:14.384069000 UTC +00:00>
```

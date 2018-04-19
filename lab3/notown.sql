

CREATE TABLE musician  (
	ssn numeric(9,0) NOT NULL,
	name text NOT NULL,
	PRIMARY KEY(ssn));

CREATE TABLE instrument (
	instrID int NOT NULL,
	name text NOT NULL,
	key text NOT NULL,
	PRIMARY KEY(instrID));

CREATE TABLE plays (
	musician numeric(9,0) NOT NULL,
	instrument int NOT NULL,
	PRIMARY KEY(musician, instrument),
	FOREIGN KEY(musician) REFERENCES musician(ssn),
	FOREIGN KEY(instrument) REFERENCES instrument(instrID));

CREATE TABLE place (
	address text NOT NULL,
	PRIMARY KEY(address));

CREATE TABLE telephone (
	phone_no text NOT NULL,
	place text NOT NULL,
	PRIMARY KEY(phone_no),
	FOREIGN KEY(place) REFERENCES place(address) ON DELETE NO ACTION);

CREATE TABLE home (
	place text NOT NULL,
	telephone text NOT NULL,
	PRIMARY KEY(place, telephone),
	FOREIGN KEY(place) REFERENCES place(address),
	FOREIGN KEY(telephone) REFERENCES telephone(phone_no));

CREATE TABLE lives (
	musician numeric(9,0) NOT NULL,
	home text NOT NULL,
	PRIMARY KEY(musician, home),
	FOREIGN KEY(musician) REFERENCES musician(ssn),
	FOREIGN KEY(home) REFERENCES home(place));

CREATE TABLE album (
	albumIdentifier text NOT NULL,
	copyrightDate text NOT NULL,
	speed float NOT NULL,
	title text NOT NULL,
	producer numeric(9,0) NOT NULL,
	PRIMARY KEY(albumIdentifier),
	FOREIGN KEY(producer) REFERENCES musician(ssn) ON DELETE NO ACTION);

CREATE TABLE songs (
	songID int NOT NULL,
	title text NOT NULL,
	author text NOT NULL,
	appears text NOT NULL,
	PRIMARY KEY(songID),
	FOREIGN KEY(appears) REFERENCES album(albumIdentifier) ON DELETE NO ACTION);

CREATE TABLE perform (
	musician numeric(9,0),
	song text NOT NULL,
	PRIMARY KEY(musician, song),
	FOREIGN KEY(musician) REFERENCES musician(ssn),
	FOREIGN KEY(song) REFERENCE songs(songID));

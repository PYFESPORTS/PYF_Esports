-- Active: 1715053854725@@cocktailwizardbd.mysql.database.azure.com@3306@pyf_esports

DROP TABLE IF EXISTS Account CASCADE;
DROP TABLE IF EXISTS EventPlayer CASCADE;
DROP TABLE IF EXISTS Event CASCADE;
DROP TABLE IF EXISTS Round CASCADE;
DROP TABLE IF EXISTS Tournament CASCADE;
DROP TABLE IF EXISTS Player CASCADE;
DROP TABLE IF EXISTS Team CASCADE;



CREATE TABLE Account(
    id_account INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Team(
    id_team INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    logo BLOB
);

CREATE TABLE Player(
    id_player INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    tag VARCHAR(100) NOT NULL,
    main_roster BOOLEAN NOT NULL DEFAULT 1,
    id_team INT,
    FOREIGN KEY (id_team) REFERENCES Team(id_team)
);

CREATE TABLE Tournament(
    id_tournament INT PRIMARY KEY AUTO_INCREMENT,
    date_start DATE,
    id_winner INT,
    FOREIGN KEY (id_winner) REFERENCES Team(id_team)
);

CREATE TABLE Round(
    id_round INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(100) NOT NULL,
    best_of INT NOT NULL,
    id_tournament INT,
    FOREIGN KEY (id_tournament) REFERENCES Tournament(id_tournament)
);

CREATE TABLE Event(
    id_match INT PRIMARY KEY AUTO_INCREMENT,
    date_match DATETIME NOT NULL,
    id_team1 INT,
    id_team2 INT,
    score_team1 INT,
    score_team2 INT,
    id_winner INT,
    id_round INT,
    valoMatchId VARCHAR(100),
    FOREIGN KEY (id_team1) REFERENCES Team(id_team),
    FOREIGN KEY (id_team2) REFERENCES Team(id_team),
    FOREIGN KEY (id_winner) REFERENCES Team(id_team),
    FOREIGN KEY (id_round) REFERENCES Round(id_round)
);

CREATE TABLE EventPlayer(
    id_match INT,
    id_player INT,
    averageCombatScore INT,
    kills INT,
    deaths INT,
    assists INT,
    averageDamagePerRound INT,
    headshotRT INT,
    firstKillInRound INT,
    firstDeathInRound INT,
    PRIMARY KEY (id_match, id_player),
    FOREIGN KEY (id_match) REFERENCES Event(id_match),
    FOREIGN KEY (id_player) REFERENCES Player(id_player)
);

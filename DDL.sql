drop schema if exists misic;
create schema misic;

drop table if exists misic.artist;
create external table if not exists misic.artist (
    ArtistId INTEGER NOT NULL,
    Name VARCHAR(120) NOT NULL
) as copy from '/tmp/data/Artist.csv' delimiter ',';

drop table if exists misic.album;
create external table if not exists misic.album (
    AlbumId INTEGER  NOT NULL,
    Title VARCHAR(160)  NOT NULL,
    ArtistId INTEGER  NOT NULL
) as copy from '/tmp/data/Album.csv' delimiter ',';

drop table if exists misic.genre;
create external table if not exists misic.genre (
    GenreId INTEGER  NOT NULL,
    Name VARCHAR(120)
 ) as copy from '/tmp/data/Genre.csv' delimiter ',';


drop table if exists misic.genre;
create external table if not exists misic.genre (
    GenreId INTEGER  NOT NULL,
    Name VARCHAR(120)
 ) as copy from '/tmp/data/Genre.csv' delimiter ',';
 
drop table if exists misic.playlist;
create external table if not exists misic.playlist (
    PlaylistId INTEGER  NOT NULL,
    Name VARCHAR(120)
 ) as copy from '/tmp/data/Playlist.csv' delimiter ',';
 
drop table if exists misic.playlisttrack; 
create external table if not exists misic.playlisttrack (
    PlaylistId INTEGER  NOT NULL,
    TrackId INTEGER  NOT NULL
 ) as copy from '/tmp/data/PlaylistTrack.csv' delimiter ',';    
    
drop table if exists misic.track;
create external table if not exists misic.track (    
      TrackId INTEGER  NOT NULL,
    Name VARCHAR(200)  NOT NULL,
    AlbumId INTEGER,
    MediaTypeId INTEGER  NOT NULL,
    GenreId INTEGER,
    Composer VARCHAR(220),
    Milliseconds INTEGER  NOT NULL,
    Bytes INTEGER,
    UnitPrice NUMERIC(10,2)  NOT NULL
 ) as copy from '/tmp/data/Track.csv' delimiter ',';      
    
    
    
   
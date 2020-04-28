drop schema if exists music;
create schema music;

drop table if exists music.artist;
create external table if not exists music.artist (
    ArtistId INTEGER NOT NULL,
    Name VARCHAR(120) NOT NULL
) as copy from '/tmp/data/Artist.csv' delimiter ',';

drop table if exists music.album;
create external table if not exists music.album (
    AlbumId INTEGER  NOT NULL,
    Title VARCHAR(160)  NOT NULL,
    ArtistId INTEGER  NOT NULL
) as copy from '/tmp/data/Album.csv' delimiter ',';

drop table if exists music.genre;
create external table if not exists music.genre (
    GenreId INTEGER  NOT NULL,
    Name VARCHAR(120)
 ) as copy from '/tmp/data/Genre.csv' delimiter ',';


drop table if exists music.genre;
create external table if not exists music.genre (
    GenreId INTEGER  NOT NULL,
    Name VARCHAR(120)
 ) as copy from '/tmp/data/Genre.csv' delimiter ',';
 
drop table if exists music.playlist;
create external table if not exists music.playlist (
    PlaylistId INTEGER  NOT NULL,
    Name VARCHAR(120)
 ) as copy from '/tmp/data/Playlist.csv' delimiter ',';
 
drop table if exists music.playlisttrack; 
create external table if not exists music.playlisttrack (
    PlaylistId INTEGER  NOT NULL,
    TrackId INTEGER  NOT NULL
 ) as copy from '/tmp/data/PlaylistTrack.csv' delimiter ',';    
    
drop table if exists music.track;
create external table if not exists music.track (    
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
    
    
    
   
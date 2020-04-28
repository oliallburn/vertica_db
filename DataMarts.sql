-- узнаем самый слушабельный музыкальный жанр
with track as 
(select t.TrackID,
       g.Name as Genre,
       (t.Milliseconds / 60000) as Duration
       from music.track t
 left join music.genre g on g.GenreID = t.GenreID),
 
plst as 
(select pt.TrackId,
        p.Name as PlaylistId 
from music.playlisttrack pt
join music.playlist p on pt.PlaylistId = p.PlaylistId 
where p.PlaylistId  = 1
order by pt.TrackId )

select track.Genre,
       cast (sum (track.Duration) / 60 as int) as Duration
from track join plst on track.trackid=plst.TrackId
group by track.Genre
order by sum (track.Duration) desc
limit 5

-- узнаем самую слушабельную группу
with song as 
(select t.TrackID,
       t.Name as Song,
       a.Name as Artist,
       al.Title as Album
       from music.track t
left join music.album al on al.AlbumID = t.AlbumID
left join music.artist a on a.ArtistID = al.ArtistID),
 
pool as 
(select pt.TrackId,
        p.Name as PlaylistId 
from music.playlisttrack pt
join music.playlist p on pt.PlaylistId = p.PlaylistId 
where p.PlaylistId  = 1
order by pt.TrackId )

select song.Artist,
      count(*)
from song join pool on song.TrackId=pool.TrackId
where song.Artist is not null
group by song.Artist
order by count(*) desc
limit 10

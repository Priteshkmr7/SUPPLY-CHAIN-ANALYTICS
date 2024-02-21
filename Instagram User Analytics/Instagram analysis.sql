use ig_clone;
select * from users;
describe users;
select * from comments;
select * from follows;
select * from likes;
select * from photos;
select * from photo_tags;
select * from tags;
select * from users;

#1. users using the platform from longest time
#find the 5 oldest users
select * from users;
select username,created_at from users order by created_at limit 5;

#2.find the users who have never posted a single on instagram
select * from photos,users;
select * from users u left join photos p on p.user_id=u.id where p.image_url is null order by u.username;
select u.username from users u left join photos p on p.user_id=u.id where p.image_url is null order by u.username;

#3. identify the winner 
 select * from likes,photos,users;
 select likes.photo_id,users.username,count(likes.user_id) as nooflikes
 from likes inner join photos on likes.photo_id=photos.id
 inner join users on photos.user_id=users.id group by
 likes.photo_id,users.username order by nooflikes desc;
 
  #4. identify and suggest the to p 5 most commonly used hashtags on the platform
  select * from photo_tags,tags;
  select t.tag_name,count(p.photo_id) as ht from photo_tags p inner join tags t on t.id=p.tag_id group by t.tag_name order by ht desc limit 5;
  
  #5 what day of the week do most users register on? provide insights on when to schedule an ad campaign
  select * from users;
  select date_format((created_at),'%W') as dayy,count(username) from users group by 1 order by 2 desc;
  
  #6. Provide how many times does average userposts on Instagram. also providethe total number of photos on Instagram/ total number of users
  select * from photos;
  with base as(
  select u.id as userid,count(p.id)as photoid from users u left join photos p on p.user_id=u.id group by u.id)
  select sum(photoid)as totalphotos,count(userid)as total_users,sum(photoid)/count(userid) as photoperuser
  from base;
  
  #7. Give data about users(bots) who  have liked every single photo on the site( since any normal user would not be able to do this)
  select * from users,likes;
  with base as(
  select u.username,count(l.photo_id) as likess from likes l inner join users u on u.id=l.user_id group by u.username)
  select username,likess from base where likess=(select count(*) from photos) order by username;
  
USE kidding;

SELECT
   CASE
     WHEN id_user=1 THEN 'one'
     WHEN id_user > 2 AND id_user < 10 THEN '2 and 10'
     ELSE 'other'
   END
FROM users LIMIT 1;

-- middle
SELECT street FROM cities WHERE street LIKE '%2%';

-- Join
SELECT
  id_author,
  id_post,
  nm_author,
  content
FROM posts JOIN authors ON posts.creator = authors.nm_author;

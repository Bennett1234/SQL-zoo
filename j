SELECT COUNT(*), v.post_id
    FROM  post AS p RIGHT OUTER JOIN vote AS v ON (p.post_id = v.post_id)     
    WHERE p.creator_id IN (SELECT followed_id
                              FROM folllwing
                              where follower_id = Given_id) 
          AND v.memebr_id <> Given_id
          AND p.creator_id<> Given_id
          AND p.created_at BETWEEN sysdata-3 And sysdate
          AND v.post_id IN (SELECT DISTINCT post_id
                                FROM vote
                                WHERE voted_at BETWEEN sysdate-1 AND sysdate )
    GROUP BY v.post_id
    ORDER BY COUNT(*) DESC
    LIMIT 10






















SELECT COUNT(*), v.post_id
    FROM  post AS p OUTER RIGHT JOIN vote AS v ON (p.post_id = v.post_id)     
    WHERE p.creator_id IN (SELECT followed_id
                              FROM folllwing
                              where follower_id = Given id)
    GROUP BY post_id
    ORDER BY COUNT(*) DESC
    LIMIT 10

/* 
my interpretation for 2 is that find the top 10 most voted 
while the guy never voted
*/
SELECT COUNT(*), v.post_id
    FROM  post AS p OUTER RIGHT JOIN vote AS v ON (p.post_id = v.post_id)     
    WHERE p.creator_id IN (SELECT followed_id
                              FROM folllwing
                              where follower_id = Given id) 
          AND v.member_id<> Given_id
    GROUP BY post_id
    ORDER BY COUNT(*) DESC
    LIMIT 10

###SELECT COUNT(*), v.post_id
    FROM  member AS m JOIN post AS p ON (m.member_id = p.creator_id)
                      JOIN vote AS v ON (m.member_id = v.member_id)     
    WHERE m.member_id IN (SELECT followed_id
                              FROM folllwing
                              where follower_id = Given_id) AND
                          v.memebr_id <> Given_id
    GROUP BY post_id
    ORDER BY COUNT(*) DESC
   #### LIMIT 10
   
 SELECT COUNT(*), v.post_id
    FROM  post AS p OUTER RIGHT JOIN vote AS v ON (p.post_id = v.post_id)     
    WHERE p.creator_id IN (SELECT followed_id
                              FROM folllwing
                              where follower_id = Given_id) 
          AND v.vote_at BETWEEN sysdate-1 AND sysdate 
    GROUP BY post_id
    ORDER BY COUNT(*) DESC
    LIMIT 10 
   
   
   
 SELECT COUNT(*), v.post_id
    FROM  post AS p OUTER RIGHT JOIN vote AS v ON (p.post_id = v.post_id)     
    WHERE p.creator_id IN (SELECT followed_id
                              FROM folllwing
                              where follower_id = Given_id) 
          AND p.creator_id <> Given_id
    GROUP BY post_id
    ORDER BY COUNT(*) DESC
    LIMIT 10  
    
    
    SELECT COUNT(*), v.post_id
        FROM  post AS p OUTER RIGHT JOIN vote AS v ON (p.post_id = v.post_id)
        WHERE p.creator_id = Given_id AND p.created_at BETWEEN sysdata-3 And sysdate
        GROUP BY v.post_id
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

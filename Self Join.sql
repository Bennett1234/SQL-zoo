# 1......5
--#6
/*The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

--#7
/*
Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
*/
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop = 115 AND b.stop = 137

--#8
/*
Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
*/
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross'

--#9
/*
Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
*/
SELECT  stopsb.name, a.company,a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopsa ON (a.stop = stopsa.id)
JOIN stops stopsb ON (b.stop = stopsb.id)
WHERE stopsa.name = 'Craiglockhart'  AND a.company = 'LRT'

--#10
/*Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
*/
SELECT  stopsb.name, a.company,a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopsa ON (a.stop = stopsa.id)
JOIN stops stopsb ON (b.stop = stopsb.id)
WHERE stopsa.name = 'Craiglockhart'  AND a.company = 'LRT'

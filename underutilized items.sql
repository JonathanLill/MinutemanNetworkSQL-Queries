/*
Jeremy Goldstein
Minuteman Library Network

Identifies under utilized items by compairing the utlization factor of an item to that of all copies attached to a given record
*/

SELECT
a.title,
id2reckey(a.bib_record_id)||'a' AS bib_number,
id2reckey(i.id)||'a' AS item_number,
a.avg_checkout_total,
a.avg_age,
--avg age in days for utilization calculation
(a.avg_checkout_total * 14) / a.avg_age  AS avg_utilization,
i.checkout_total,
m.creation_date_gmt::DATE,
--generalizes checkouts to 2 week loan period.
--utilization is ratio of days when an item was used to days when it could have been used
CAST((i.checkout_total * 14) AS NUMERIC (12,2)) / (CURRENT_DATE - m.creation_date_gmt::DATE) AS utilization,
i.last_checkout_gmt::DATE

FROM
sierra_view.item_record i
JOIN
sierra_view.bib_record_item_record_link l
ON
i.id = l.item_record_id
JOIN
sierra_view.record_metadata m
ON
i.id = m.id

JOIN
(
SELECT
b.best_title AS title,
b.bib_record_id,
--id2reckey(b.bib_record_id)||'a' AS bib_num,
AVG(i.checkout_total) AS avg_checkout_total,
AVG(CURRENT_DATE - m.creation_date_gmt::DATE) AS avg_age

FROM
bib_record_item_record_link l
JOIN
sierra_view.bib_record_property b
ON
l.bib_record_id = b.bib_record_id
JOIN
sierra_view.item_record i
ON
l.item_record_id = i.id
JOIN
sierra_view.record_metadata m
ON
i.id = m.id
GROUP BY 1,2) a
ON l.bib_record_id = a.bib_record_id

WHERE
i.location_code ~ '^act'
AND m.creation_date_gmt::DATE < CURRENT_DATE - INTERVAL '3 months'
AND (CAST((i.checkout_total * 14) AS NUMERIC (12,2)) / (CURRENT_DATE - m.creation_date_gmt::DATE)) < (((a.avg_checkout_total * 14) / a.avg_age) /2)

ORDER BY 1,2
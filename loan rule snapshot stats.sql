﻿/*
Jeremy Goldstein
Minuteman Library Network

Gathers information about blocked patrons and attempts to relate it to fines data and loan rules
*/

DROP TABLE IF EXISTS temp_loan_rules;

CREATE TEMP TABLE temp_loan_rules AS
SELECT
CASE
WHEN f.loanrule_code_num BETWEEN 2 AND 12 OR f.loanrule_code_num BETWEEN 501 AND 509 THEN 'Acton'
WHEN f.loanrule_code_num BETWEEN 13 AND 23 OR f.loanrule_code_num BETWEEN 510 AND 518 THEN 'Arlington'
WHEN f.loanrule_code_num BETWEEN 24 AND 34 OR f.loanrule_code_num BETWEEN 519 AND 527 THEN 'Ashland'
WHEN f.loanrule_code_num BETWEEN 35 AND 45 OR f.loanrule_code_num BETWEEN 528 AND 536 THEN 'Bedford'
WHEN f.loanrule_code_num BETWEEN 46 AND 56 OR f.loanrule_code_num BETWEEN 537 AND 545 THEN 'Belmont'
WHEN f.loanrule_code_num BETWEEN 57 AND 67 OR f.loanrule_code_num BETWEEN 546 AND 554 THEN 'Brookline'
WHEN f.loanrule_code_num BETWEEN 68 AND 78 OR f.loanrule_code_num BETWEEN 555 AND 563 THEN 'Cambridge'
WHEN f.loanrule_code_num BETWEEN 79 AND 89 OR f.loanrule_code_num BETWEEN 564 AND 572 THEN 'Concord'
WHEN f.loanrule_code_num BETWEEN 90 AND 100 OR f.loanrule_code_num BETWEEN 573 AND 581 THEN 'Dedham'
WHEN f.loanrule_code_num BETWEEN 101 AND 111 OR f.loanrule_code_num BETWEEN 582 AND 590 THEN 'Dean'
WHEN f.loanrule_code_num BETWEEN 112 AND 122 OR f.loanrule_code_num BETWEEN 591 AND 599 THEN 'Dover'
WHEN f.loanrule_code_num BETWEEN 123 AND 133 OR f.loanrule_code_num BETWEEN 600 AND 608 THEN 'Framingham'
WHEN f.loanrule_code_num BETWEEN 134 AND 144 OR f.loanrule_code_num BETWEEN 609 AND 617 THEN 'Franklin'
WHEN f.loanrule_code_num BETWEEN 145 AND 155 OR f.loanrule_code_num BETWEEN 618 AND 626 THEN 'Framingham State'
WHEN f.loanrule_code_num BETWEEN 156 AND 166 OR f.loanrule_code_num BETWEEN 627 AND 635 THEN 'Holliston'
WHEN f.loanrule_code_num BETWEEN 167 AND 177 OR f.loanrule_code_num BETWEEN 636 AND 644 THEN 'Lasell'
WHEN f.loanrule_code_num BETWEEN 178 AND 188 OR f.loanrule_code_num BETWEEN 645 AND 653 THEN 'Lexington'
WHEN f.loanrule_code_num BETWEEN 189 AND 199 OR f.loanrule_code_num BETWEEN 654 AND 662 THEN 'Lincoln'
WHEN f.loanrule_code_num BETWEEN 200 AND 210 OR f.loanrule_code_num BETWEEN 663 AND 671 THEN 'Maynard'
WHEN f.loanrule_code_num BETWEEN 222 AND 232 OR f.loanrule_code_num BETWEEN 681 AND 689 THEN 'Medford'
WHEN f.loanrule_code_num BETWEEN 233 AND 243 OR f.loanrule_code_num BETWEEN 690 AND 698 THEN 'Millis'
WHEN f.loanrule_code_num BETWEEN 244 AND 254 OR f.loanrule_code_num BETWEEN 699 AND 707 THEN 'Medfield'
WHEN f.loanrule_code_num BETWEEN 255 AND 265 OR f.loanrule_code_num BETWEEN 708 AND 716 THEN 'Mount Ida'
WHEN f.loanrule_code_num BETWEEN 266 AND 276 OR f.loanrule_code_num BETWEEN 717 AND 725 THEN 'Medway'
WHEN f.loanrule_code_num BETWEEN 277 AND 287 OR f.loanrule_code_num BETWEEN 726 AND 734 THEN 'Natick'
WHEN f.loanrule_code_num BETWEEN 299 AND 309 OR f.loanrule_code_num BETWEEN 744 AND 752 THEN 'Needham'
WHEN f.loanrule_code_num BETWEEN 310 AND 320 OR f.loanrule_code_num BETWEEN 753 AND 761 THEN 'Norwood'
WHEN f.loanrule_code_num BETWEEN 321 AND 331 OR f.loanrule_code_num BETWEEN 762 AND 770 THEN 'Newton'
WHEN f.loanrule_code_num BETWEEN 332 AND 342 OR f.loanrule_code_num BETWEEN 771 AND 779 THEN 'Somerville'
WHEN f.loanrule_code_num BETWEEN 343 AND 353 OR f.loanrule_code_num BETWEEN 780 AND 788 THEN 'Stow'
WHEN f.loanrule_code_num BETWEEN 354 AND 364 OR f.loanrule_code_num BETWEEN 789 AND 797 THEN 'Sudbury'
WHEN f.loanrule_code_num BETWEEN 365 AND 375 OR f.loanrule_code_num BETWEEN 798 AND 806 THEN 'Watertown'
WHEN f.loanrule_code_num BETWEEN 376 AND 386 OR f.loanrule_code_num BETWEEN 807 AND 815 THEN 'Wellesley'
WHEN f.loanrule_code_num BETWEEN 387 AND 397 OR f.loanrule_code_num BETWEEN 816 AND 824 THEN 'Winchester'
WHEN f.loanrule_code_num BETWEEN 398 AND 408 OR f.loanrule_code_num BETWEEN 825 AND 833 THEN 'Waltham'
WHEN f.loanrule_code_num BETWEEN 409 AND 419 OR f.loanrule_code_num BETWEEN 834 AND 842 THEN 'Woburn'
WHEN f.loanrule_code_num BETWEEN 420 AND 430 OR f.loanrule_code_num BETWEEN 843 AND 851 THEN 'Weston'
WHEN f.loanrule_code_num BETWEEN 431 AND 441 OR f.loanrule_code_num BETWEEN 852 AND 860 THEN 'Westwood'
WHEN f.loanrule_code_num BETWEEN 442 AND 452 OR f.loanrule_code_num BETWEEN 861 AND 869 THEN 'Wayland'
WHEN f.loanrule_code_num BETWEEN 453 AND 463 OR f.loanrule_code_num BETWEEN 870 AND 878 THEN 'Pine Manor'
WHEN f.loanrule_code_num BETWEEN 464 AND 474 OR f.loanrule_code_num BETWEEN 879 AND 887 THEN 'Regis'
WHEN f.loanrule_code_num BETWEEN 475 AND 485 OR f.loanrule_code_num BETWEEN 888 AND 896 THEN 'Sherborn'
Else 'Other'
END AS checkout_location,
f.loanrule_code_num AS loanrule_num,
MIN(AGE(f.due_gmt::date,f.checkout_gmt::date)) AS est_loan_period,
MODE() WITHIN GROUP (ORDER BY AGE(f.returned_gmt::date,f.due_gmt::date)) FILTER (WHERE f.charge_code IN ('2','6')) AS mode_days_late,
CASE
WHEN MIN(AGE(f.assessed_gmt::date,f.due_gmt::date)) FILTER (WHERE f.charge_code IN ('2','6'))::varchar = '1 day' THEN 'None'
ELSE MIN(AGE(f.assessed_gmt::date,f.due_gmt::date)) FILTER (WHERE f.charge_code IN ('2','6'))::varchar
END AS est_grace_period,
ROUND(AVG(f.item_charge_amt) FILTER (WHERE f.charge_code IN ('2','6')),2) AS avg_overdue_fine,
MIN (ROUND(f.item_charge_amt,2)) FILTER (WHERE f.charge_code IN ('2','6')) AS est_fine_per_day,
COUNT(f.id) AS Total_fines
FROM
sierra_view.fine f
WHERE f.loanrule_code_num NOT IN ('1','288','493','494','495','496','497','498','999')
GROUP BY 1,2
HAVING COUNT(f.loanrule_code_num) > 5
ORDER BY 1,2
;

SELECT
ip.name AS itype,
l.checkout_location,
f.loanrule_code_num,
l.est_fine_per_day,
est_loan_period,
COUNT(DISTINCT p.id) AS total_patrons,
COUNT(distinct p.id) FILTER(WHERE ((p.mblock_code != '-') OR (p.owed_amt >= 10))) as total_block,
COUNT (p.id) FILTER(WHERE ((p.mblock_code != '-') OR (p.owed_amt >= 10)) AND f.charge_code IN ('3','5')) AS total_block_lost_item,
CAST(COUNT(distinct p.id) FILTER(WHERE ((p.mblock_code != '-') OR (p.owed_amt >= 10))) as numeric (12,2)) / cast(COUNT(distinct p.id) as numeric (12,2)) AS pct_block,
CAST(COUNT(p.id) FILTER(WHERE ((p.mblock_code != '-') OR (p.owed_amt >= 10))AND f.charge_code IN ('3','5')) as numeric (12,2)) / cast(COUNT(p.id) as numeric (12,2)) AS pct_block_lost_item,
DATE_TRUNC('day', AVG(AGE(now()::date,p.activity_gmt::date)) FILTER(WHERE ((p.mblock_code = '-') OR (p.owed_amt < 10)))) AS avg_last_active_not_blocked,
DATE_TRUNC('day', AVG(AGE(now()::date,p.activity_gmt::date)) FILTER(WHERE ((p.mblock_code != '-') OR (p.owed_amt >= 10)))) AS avg_last_active_blocked,
COUNT(distinct p.id) FILTER(WHERE ((p.mblock_code = '-') OR (p.owed_amt < 10)) AND p.expiration_date_gmt < (now() + interval '1 year')) AS total_not_blocked_exp_this_year,
COUNT(distinct p.id) FILTER(WHERE ((p.mblock_code != '-') OR (p.owed_amt >= 10)) AND p.expiration_date_gmt < (now() + interval '1 year')) AS total_blocked_exp_this_year,
COUNT(p.id) FILTER(WHERE (((p.mblock_code != '-') OR (p.owed_amt >= 10)) AND f.charge_code IN ('3','5')) AND p.expiration_date_gmt < (now() + interval '1 year')) AS total_blocked_lost_item_exp_this_year
FROM
sierra_view.fine f
JOIN
sierra_view.patron_record p
ON
f.patron_record_id = p.id
JOIN temp_loan_rules l
ON
f.loanrule_code_num = l.loanrule_num
JOIN
sierra_view.item_record i
ON
f.item_record_metadata_id = i.id
JOIN
sierra_view.itype_property_myuser ip
ON
i.itype_code_num = ip.code
GROUP BY 1,2,3,4,5

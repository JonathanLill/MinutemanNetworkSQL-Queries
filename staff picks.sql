SELECT *
FROM(
SELECT
--link to Encore, removed in favor of default keyword search on title
--'https://find.minlib.net/iii/encore/record/C__R'||id2reckey(b.bib_record_id)   AS field_booklist_entry_encore_url,
b.best_title as title,
REPLACE(SPLIT_PART(SPLIT_PART(b.best_author,' (',1),', ',2),'.','')||' '||SPLIT_PART(b.best_author,', ',1) as field_booklist_entry_author,
CASE
WHEN b.material_code = 'a'
THEN (SELECT
'https://syndetics.com/index.aspx?isbn='||SUBSTRING(s.content FROM '[0-9]+')||'/SC.gif&client=minuteman'
FROM
sierra_view.subfield s
WHERE
b.bib_record_id = s.record_id AND s.marc_tag = '020' AND s.tag = 'a'
ORDER BY s.occ_num
LIMIT 1)
WHEN b.material_code != 'a'
THEN (SELECT
'https://syndetics.com/index.aspx?upc='||SUBSTRING(s.content FROM '[0-9]+')||'/SC.gif&client=minuteman'
FROM
sierra_view.subfield s
WHERE
b.bib_record_id = s.record_id AND s.marc_tag = '024' AND s.tag = 'a'
ORDER BY s.occ_num
LIMIT 1)
END AS field_booklist_entry_cover

FROM
sierra_view.bib_record_property b
JOIN sierra_view.bib_record_item_record_link bi
ON
b.bib_record_id = bi.bib_record_id
JOIN
sierra_view.bib_view v
ON
b.bib_record_id = v.id AND
v.record_num IN (
--20200205 Jeremy Goldstein
--vacationland
'3652176',
--The Deep
'3825839',
--how to invent everything
'3769049',
--Snagglepuss Chronicles
'3783294',
--Spinning Silver
'3755652',
--Die
'3814206',
--Space Opera
'3725134',
--Gideon the Ninth
'3838330',
--Excellence
'3859399',
--20200205 Jonathan Reinhart
'3835519',
'3603746',
'3488131',
'3789976',
'3789978',
'2544412',
'1946196',
'2574931',
'3816140',
'2406924',
'3017509',
'3767818',
'2382690',
'2638413',
'2444431',
'2782998',
'2551355',
'1243202',
'2729795',
'1505152',
'3003218',
'1367236',
'1090823',
--20200205 Dev Singer
'3853104',
'3757176',
'3833060',
--20200205 Anna Sarneso
'3808188',
--20200205 Kevin O'Kelly
'3830926',
--20200205 Sophie Forrester
'3823360',
'1858821',
'3738982',
'3829717',
'3845969',
'1075807',
'3831641',
'2963695',
'2498145',
'2651560',
'1293974',
'2651071',
'2622125',
'1486213',
'2903719',
--20200205 Refina Lewis
'3818647',
'3788540',
'3528407',
'3634811',
--20200205 Allison Smith
'3142168',
'3792142',
'3859897',
'3830915',
'3814086',
'3818244',
'3823360',
--20200205 Karen Donaghey
'3675994',
'2928502',
'1141593',
--20200205 Mary Carter
'3777938',
'2968267',
'2761839',
'3110294',
'3163998',
'3611335',
'3272328',
'2746659',
'3107629',
'3818580',
'3801281',
'3813008',
'3113502',
'3621400',
'3566353',
'3047845',
'3718164',
'3002599',
'3223099',
'3755652',
'3095283',
'2667099',
'2133780',
'3167440',
'3209365',
'3021685',
'3066044',
'2908140',
'3186319',
'1532877',
'1525617',
'2597289',
'3010511',
'3157047',
'2856180',
'2730511',
'2522001',
'3020336',
'2467715',
'2305729',
--20200205 Mary Grahame Hunter
'3808188',
'3526096',
'3743047',
'3814192',
'3864086',
'3520596',
--20200205 Jillian Holmberg
'2947062',
'2213893',
'3226168',
'3102202',
'1503791',
'3853779',
'3718164',
'3763603',
--20200205 Lucia Dolan
'3853228',
--20200205 Meghan Bouffard
'3815724',
'2955063',
'2448597',
'3539665',
--20200205 MJ Wright
'2987467',
'3856881',
'3802434',
'3681790',
'3781070',
'3812322',
'3273254',
--20200205 Brita Zitin
'3045943',
'2502640',
'2392981',
'1994618',
'3163329',
'2643189',
'3245698',
--20200205 Robin Demas
'2752115',
--20200205 Jennifer Keen
'3010518',
'3216412',
'3853080',
'2903719',
'2105282',
--20200205 Jess S
'2392257',
'1581178',
--20200205 Alicia Fernandez
'3860008',
'3734974',
'3735121',
--20200205 Ann MacFate
'1636572',
--20200205 Mariśca Mozeleski
'3825771',
'3829725',
'3864614',
'3869137',
'3838394',
'3858482',
'3633283',
'3748410',
'3800716',
'3831661',
--20200205 Jennifer Rixon
'3098445',
'3799090',
'3062702',
'3828114',
'3712537',
'3614409',
'3627153',
'3491541',
'3520596',
'2306233',
'2514912',
'3428049',
'2122840',
'3784181',
'1852014',
'2324138',
'2860449',
'2889170',
'2671018',
'2546704',
--20200205 Eunice Hong
'3837915',
'3659250',
'3864086',
'3828169',
'3765769',
'3850904',
'3854974',
'3214214',
'3650196',
'3808334',
'3809747',
'3790582',
'3790238',
'3617145',
'3214216',
'3227882',
'2862930',
'3019949',
'3737797',
--20200205 Jessica Steytler
'3808188',
'3526096',
'3104031',
'3875142',
'3282745',
'3237608',
'3439805',
'3274792',
'3637136',
'3800631',
'3726880',
--20200205 Hannah Swan
'3653799',
'3585259',
'3242281',
'3725017',
'3221442',
'3718878',
'2662078',
'3161555',
--20200205 Rachel Silverman
'3812165',
--20200205 Andy Moore
'1630696',
'2664830',
'2633119',
'2253047',
'2172344',
'2455681',
'2533599',
'1819227',
'1915193',
'2307470',
'2377438',
'2772779',
'2170729',
'2657843',
'2541967',
'1954036',
'1820826',
'1857443',
'1172541',
'3639374',
'1448599',
'3449967',
'2486579',
'2541966',
'2773643',
'1978081',
'1869318',
'3033337',
'2416219',
'2896627',
--20200205 Jess Dyment
'3807510',
'3038316',
'2913584',
'3862787',
'3838326',
'3770375',
--20200205 Courtney Michael
'3111937',
'1808760',
'3168388',
'3429589',
'3271484',
'3685463',
'3683625',
'3726463',
'2709267',
'3461358',
'3164133',
'2853291',
'2351309',
'1570488',
--20200205 Courtney Michael
'3868364',
--20200205 Royce McGrath
'3445745',
'3804935',
--20200205 Julie Kellndorfer
'3825771',
'3808188',
'3659250',
'3775527',
'3817272',
'3790582',
'3853855',
'3538318',
'3661171',
'3135210',
'3142677',
'3825862',
--20200205 Kate Tigue
'2429954',
--20200205 Ernest Webby, jr.
'3829783',
--20200205 Quincy Knapp
'3143812',
'1909015',
'3503527',
'3755652',
'3606131',
'3780190',
'3473547',
--20200205 Peter Hansen II
'2409171',
'3212431',
'2750217',
'3079576',
'3011713',
--20200205 Rachel Simon
'3859133',
--20200205 Jenny Arch
'3857307',
'2769257',
'3716774',
'1786130',
'3853121',
'3655837',
'2701249',
'2941369',
'3808188',
'3846632',
'3880549',
'3651672',
'2603916',
'3735177',
'3170655',
'3838416',
'2491827',
'3852145',
'3656838',
'3053576',
'3810772',
'3659252',
'3647899',
'2927832',
'3171397',
'3229184',
'3449501',
'3649988',
'3195657',
'2955324',
'3737797',
'3869337',
'3811652',
'3275414',
'2322360',
'3623192',
'3804935',
'3829715',
'3791402',
'3780266',
'3853212',
'3814157',
'3804175',
'3788098',
'3826374',
'3811680',
'3835589',
'3812165',
'3807502',
'3802377',
--20200205 Ariel Flowers
'2199975',
--20200206 Nicole S
'2054406',
'2126570',
--20200206 Andrew Loof
'3464408',
'3868915',
'1090651',
'3805425',
'3141569',
'2135225',
'2713470',
--20200206 Olivia Durant
'3651672',
--20200206 Ellen Jacobs
'3171397',
'3659356',
'3763723',
'3874244',
'3524701',
'2776793',
'3023281',
'2576963',
'2394207',
'2901477',
'1969580',
'1973173',
--20200206 Patty Bailey
'3811412',
'3844654',
--20200206 Kate Lowe
'1931985',
--20200206 Stefanie Claydon
'1593162',
'1996844',
'2130806',
'3530777',
'3844930',
'3650498',
'3808256',
'3563894',
'3158092',
'1979269',
'3858484',
'3812054',
'3622800',
'2995595',
'3271673',
'3649988',
'3164123',
'3039958',
'2902522',
'3853402',
'3838394',
'3526096',
'3654507',
'3767055',
'3018105',
'3734471',
'3223099',
'3206545',
'1325907',
'3742476',
'3743296',
'3436573',
'3538707',
'3592914',
'3608317',
'2610365',
'2470540',
'2003332',
'3647913',
'2622394',
--20200206 Abigail Walzer
'3508034',
'3176642',
'2015732',
'3786044',
'3661031',
'3663516',
--20200207 Gráinne Griffin
'3561119',
--20200207 Dahlia Balcazar
'3616797',
'2453407',
'3791402',
'3638890',
'3818244',
'3207075',
'2458215',
'3493658',
'3815562',
'3672947',
'2248922',
--20200207 Lauren Pfendner
'3028168',
'3828291',
'1878442',
'2085434',
'3245549',
'3175706',
'3629649',
--20200207 Caroline Vericker
'3781267',
'3777938',
'3038316',
'3774202',
'3767324',
'3768165',
'3769129',
'3637281',
'3684052',
'3639155',
'3602957',
'3728392',
'3271154',
'2510671',
'3626551',
'3462299',
'3626548',
'3566353',
'2968286',
'3164696',
'3030140',
'2914411',
--20200207 Kathy Bell
'2780471',
'3111937',
'2890531',
--20200207 Manni LaCount
'1688895',
--20200208 Yi Bin Liang
'2944357',
'3779641',
'3659211',
--20200208 Jael Gorham
'1814442',
'3216412',
'1573496',
--20200208 Lily Weitzman
'3725134',
'3838395',
'3272328',
'3650288',
'3650323',
'3275884',
'3656837',
'3633283',
'3718094',
'3815548',
'3071093',
'3653799',
'3529765',
'3039950',
'3040194',
'3812165',
'3606314',
'3770375',
'3652129',
'3850903',
'3221893',
'3131989',
'3716302',
'3111937',
'3056307',
'3651336',
'3444715',
'3862787',
'3010511',
'3713831',
'3200228',
'3716774',
'3044763',
'3276861',
'3213370',
'3657334',
'3649157',
--20200209 Lucia Dolan
'3633283',
--20200210 Molly MacKenzie
'3180431',
--20200210 Amber Harvey
'3866181',
--20200210 Sara Belisle
'3540067',
--20200210 Molly Riportella
'3817035',
'3846289',
'3826421',
--20200210 Caroline Tighe
'3207075',
--20200211 Michelle Buglio
'3800932',
--20200211 Maggie Vo
'3718546',
'3775527',
'3207075',
'2467715',
'3844919',
'2712786',
'2353967',
'3808188',
'3737982',
'3825094',
'3175570',
'3141569',
'3734044',
--20200212 Jeremy Robichaud
'3861066',
'3828291',
'3648465',
'3142168',
'3650415',
'3613874',
'3596082',
'2897852',
'3585668',
'3436093',
'3501864',
'3212204',
'3161921',
--20200213 Julie Harvey
'3680754',
'3835538',
'3826234',
'3732407',
'3857921',
'3855796',
'3860015',
'3718164',
--20200215 Katie OConnell
'3812165',
'3839843',
'3780266'
)
GROUP BY b.bib_record_id,1,2,b.material_code 
) a
ORDER BY RANDOM()
LIMIT 50;
;
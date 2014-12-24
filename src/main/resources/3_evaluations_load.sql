-- Load strucuture related objects into PostgreSQL DB

BEGIN;

TRUNCATE TABLE evaluations CASCADE;

-------------------
--- Survey No. 1 --
-------------------
INSERT INTO evaluations (survey, evaluator, evaluand) VALUES
(1,1,2),
(1,1,3),
(1,1,4),
(1,1,5),
(1,1,7),
(1,1,52),
(1,1,326),
(1,1,366),
(1,1,417),
(1,1,453),
(1,2,8),
(1,2,9),
(1,2,58),
(1,2,61),
(1,2,82),
(1,2,3),
(1,2,6),
(1,2,31),
(1,2,52),
(1,2,5),
(1,2,417),
(1,3,10),
(1,3,11),
(1,3,53),
(1,3,92),
(1,3,98),
(1,3,104),
(1,3,211),
(1,3,7),
(1,3,31),
(1,3,5),
(1,3,52),
(1,3,33),
(1,3,417),
(1,3,453),
(1,3,350),
(1,3,351),
(1,3,326),
(1,4,14),
(1,4,3),
(1,4,25),
(1,4,6),
(1,4,5),
(1,4,31),
(1,4,357),
(1,5,6),
(1,5,25),
(1,5,29),
(1,5,31),
(1,5,39),
(1,5,43),
(1,5,2),
(1,5,3),
(1,5,52),
(1,6,23),
(1,6,113),
(1,6,126),
(1,6,127),
(1,6,470),
(1,6,25),
(1,6,4),
(1,6,5),
(1,6,14),
(1,6,31),
(1,6,129),
(1,6,417),
(1,6,82),
(1,6,332),
(1,6,346),
(1,6,345),
(1,8,9),
(1,8,61),
(1,8,58),
(1,8,332),
(1,8,2),
(1,8,454),
(1,9,61),
(1,9,82),
(1,9,58),
(1,9,2),
(1,9,332),
(1,9,8),
(1,10,53),
(1,10,92),
(1,10,3),
(1,10,11),
(1,10,352),
(1,10,353),
(1,10,351),
(1,10,349),
(1,11,53),
(1,11,92),
(1,11,10),
(1,11,98),
(1,11,3),
(1,12,4),
(1,12,378),
(1,13,263),
(1,13,4),
(1,13,378),
(1,13,267),
(1,14,16),
(1,14,47),
(1,14,25),
(1,14,4),
(1,14,23),
(1,14,454),
(1,14,6),
(1,14,346),
(1,14,345),
(1,15,14),
(1,15,361),
(1,15,360),
(1,16,14),
(1,16,337),
(1,17,14),
(1,17,454),
(1,17,127),
(1,17,361),
(1,19,263),
(1,19,360),
(1,19,267),
(1,19,378),
(1,19,4),
(1,20,360),
(1,20,358),
(1,20,361),
(1,20,4),
(1,20,357),
(1,21,16),
(1,21,127),
(1,21,449),
(1,23,113),
(1,23,112),
(1,23,129),
(1,23,6),
(1,23,14),
(1,23,126),
(1,23,454),
(1,23,470),
(1,23,449),
(1,24,23),
(1,24,454),
(1,24,112),
(1,24,470),
(1,24,420),
(1,24,126),
(1,25,4),
(1,25,470),
(1,25,6),
(1,25,16),
(1,25,5),
(1,25,346),
(1,25,332),
(1,25,345),
(1,26,25),
(1,26,127),
(1,26,112),
(1,27,16),
(1,27,25),
(1,28,470),
(1,28,16),
(1,28,25),
(1,28,127),
(1,28,14),
(1,29,30),
(1,29,174),
(1,29,5),
(1,29,39),
(1,29,268),
(1,29,53),
(1,29,417),
(1,29,420),
(1,29,43),
(1,30,162),
(1,30,163),
(1,30,176),
(1,30,174),
(1,30,29),
(1,31,33),
(1,31,36),
(1,31,190),
(1,31,29),
(1,31,2),
(1,31,52),
(1,31,39),
(1,31,5),
(1,31,453),
(1,31,53),
(1,31,417),
(1,32,31),
(1,32,33),
(1,33,36),
(1,33,31),
(1,33,190),
(1,34,33),
(1,35,33),
(1,36,33),
(1,36,31),
(1,36,190),
(1,37,36),
(1,38,36),
(1,39,5),
(1,39,29),
(1,40,39),
(1,41,43),
(1,41,39),
(1,42,470),
(1,42,43),
(1,43,174),
(1,43,5),
(1,43,39),
(1,44,43),
(1,44,174),
(1,45,43),
(1,46,43),
(1,47,346),
(1,47,345),
(1,47,326),
(1,48,52),
(1,49,52),
(1,50,52),
(1,51,52),
(1,52,2),
(1,53,11),
(1,53,98),
(1,53,3),
(1,53,10),
(1,53,104),
(1,54,3),
(1,54,104),
(1,55,360),
(1,57,7),
(1,58,2),
(1,58,9),
(1,58,82),
(1,58,8),
(1,59,61),
(1,60,61),
(1,61,8),
(1,61,58),
(1,61,2),
(1,61,9),
(1,61,82),
(1,61,33),
(1,61,53),
(1,64,61),
(1,64,129),
(1,64,126),
(1,67,61),
(1,75,8),
(1,76,8),
(1,77,8),
(1,78,8),
(1,79,8),
(1,80,8),
(1,81,82),
(1,82,9),
(1,82,58),
(1,82,61),
(1,82,2),
(1,83,82),
(1,84,92),
(1,85,97),
(1,85,101),
(1,85,98),
(1,86,92),
(1,86,353),
(1,87,92),
(1,90,92),
(1,91,92),
(1,92,10),
(1,92,11),
(1,92,53),
(1,92,3),
(1,92,97),
(1,92,101),
(1,93,92),
(1,94,10),
(1,95,11),
(1,96,11),
(1,97,101),
--(1,97,97),
(1,97,98),
(1,98,97),
(1,98,101),
(1,98,11),
(1,98,30),
(1,98,53),
(1,98,349),
(1,98,3),
(1,99,97),
(1,99,101),
(1,99,98),
(1,100,98),
(1,100,101),
(1,101,97),
(1,101,98),
(1,102,98),
(1,104,353),
(1,104,351),
(1,104,53),
(1,104,82),
(1,104,33),
(1,104,349),
(1,104,352),
(1,105,104),
(1,106,104),
(1,107,104),
(1,108,104),
(1,109,104),
(1,110,16),
(1,110,14),
(1,111,14),
(1,112,126),
(1,113,112),
(1,113,129),
(1,113,126),
(1,113,268),
(1,113,16),
(1,113,6),
(1,113,23),
(1,113,33),
(1,113,53),
(1,114,113),
(1,115,113),
(1,115,112),
(1,116,112),
(1,117,23),
(1,117,470),
(1,118,23),
(1,118,112),
(1,118,6),
(1,118,379),
(1,118,470),
(1,118,129),
(1,118,126),
(1,120,127),
(1,121,127),
(1,121,112),
(1,122,23),
(1,122,126),
(1,122,129),
(1,123,23),
(1,123,6),
(1,123,129),
(1,124,126),
(1,124,112),
(1,125,126),
(1,126,113),
(1,126,129),
(1,126,470),
(1,126,112),
(1,126,23),
(1,126,6),
(1,127,157),
(1,127,14),
(1,127,53),
(1,127,6),
(1,128,112),
(1,129,131),
(1,129,113),
(1,129,6),
(1,129,126),
(1,129,23),
(1,129,162),
(1,129,163),
(1,131,129),
(1,131,113),
(1,132,131),
(1,132,129),
(1,133,131),
(1,133,129),
(1,134,131),
(1,135,131),
(1,136,131),
(1,137,131),
(1,138,131),
(1,139,131),
(1,140,131),
(1,141,131),
(1,145,131),
(1,147,131),
(1,157,127),
(1,159,30),
(1,160,162),
(1,161,162),
(1,162,163),
(1,162,176),
(1,162,30),
(1,163,176),
(1,163,30),
(1,163,162),
(1,163,29),
(1,164,163),
(1,165,163),
(1,166,163),
(1,167,162),
(1,168,162),
(1,169,162),
(1,170,162),
(1,171,163),
(1,172,163),
(1,173,163),
(1,174,29),
(1,174,43),
(1,174,33),
(1,176,30),
(1,176,163),
(1,176,162),
(1,176,29),
(1,177,176),
(1,178,176),
(1,178,30),
(1,179,176),
(1,179,30),
(1,180,176),
(1,181,176),
(1,182,176),
(1,183,176),
(1,184,176),
(1,189,190),
(1,190,31),
(1,190,33),
(1,190,268),
(1,190,82),
(1,191,190),
(1,192,190),
(1,193,190),
(1,195,190),
(1,196,190),
(1,197,33),
(1,198,39),
(1,199,267),
(1,201,199),
(1,203,212),
(1,203,211),
(1,203,267),
(1,204,210),
(1,204,199),
(1,205,199),
(1,205,211),
(1,205,268),
(1,205,215),
(1,206,205),
(1,207,205),
(1,207,210),
(1,208,268),
(1,208,205),
(1,209,210),
(1,209,213),
(1,209,260),
(1,209,211),
(1,210,199),
(1,210,211),
(1,211,199),
(1,211,205),
(1,211,210),
(1,211,212),
(1,211,214),
(1,211,215),
(1,211,267),
(1,211,268),
(1,211,10),
(1,211,92),
(1,211,11),
(1,211,3),
(1,211,104),
(1,212,213),
(1,212,260),
(1,212,376),
(1,212,199),
(1,212,205),
(1,212,211),
(1,212,267),
(1,213,260),
(1,213,212),
(1,214,212),
(1,214,215),
(1,214,205),
(1,214,211),
(1,215,261),
(1,215,262),
(1,215,264),
(1,215,265),
(1,215,266),
(1,215,212),
(1,215,214),
(1,215,210),
(1,215,267),
(1,215,199),
(1,215,205),
(1,215,211),
(1,216,199),
(1,218,260),
(1,219,266),
(1,219,210),
(1,220,264),
(1,220,210),
(1,221,213),
(1,222,213),
(1,223,213),
(1,224,213),
(1,225,213),
(1,226,214),
(1,227,214),
(1,228,214),
(1,229,215),
(1,229,264),
(1,229,261),
(1,229,266),
(1,230,215),
(1,230,262),
(1,230,265),
(1,231,260),
(1,232,260),
(1,233,260),
(1,234,260),
(1,235,261),
(1,236,261),
(1,237,261),
(1,238,261),
(1,239,262),
(1,240,262),
(1,241,262),
(1,242,262),
(1,243,263),
(1,244,263),
(1,245,263),
(1,246,263),
(1,247,263),
(1,248,264),
(1,249,264),
(1,250,265),
(1,251,265),
(1,252,265),
(1,253,265),
(1,254,266),
(1,255,266),
(1,256,266),
(1,257,268),
(1,258,268),
(1,259,268),
(1,260,213),
(1,260,212),
(1,261,262),
(1,261,265),
(1,261,214),
(1,261,264),
(1,261,210),
(1,261,266),
(1,262,214),
(1,262,261),
(1,262,215),
(1,262,264),
(1,262,265),
(1,262,266),
(1,263,267),
(1,264,261),
(1,264,262),
(1,264,266),
(1,264,210),
(1,264,265),
(1,264,214),
(1,265,264),
(1,265,266),
(1,265,261),
(1,265,262),
(1,265,215),
(1,266,264),
(1,266,215),
(1,266,261),
(1,266,262),
(1,266,265),
(1,267,263),
(1,267,205),
(1,267,212),
(1,268,267),
(1,268,211),
(1,268,174),
(1,268,30),
(1,269,43),
(1,270,335),
(1,272,328),
(1,272,336),
(1,273,327),
(1,275,344),
(1,275,337),
(1,276,336),
(1,277,336),
(1,279,333),
(1,280,359),
(1,281,335),
(1,281,352),
(1,282,331),
(1,282,349),
(1,283,335),
(1,284,339),
(1,285,339),
(1,285,344),
(1,286,329),
(1,288,334),
(1,288,340),
(1,289,329),
(1,291,329),
(1,292,327),
(1,293,328),
(1,293,335),
(1,294,359),
(1,296,334),
(1,296,339),
(1,296,328),
(1,297,335),
(1,297,333),
(1,298,336),
(1,299,330),
(1,299,349),
(1,299,327),
(1,300,340),
--(1,300,340),
(1,301,330),
(1,302,331),
(1,302,344),
(1,303,340),
(1,305,340),
(1,306,339),
(1,307,335),
(1,308,334),
(1,309,327),
(1,309,328),
(1,310,330),
(1,311,328),
(1,313,327),
(1,313,341),
(1,313,328),
(1,314,329),
(1,317,359),
(1,318,336),
(1,319,330),
(1,321,331),
(1,321,344),
(1,322,339),
(1,322,349),
(1,323,334),
(1,325,326),
(1,326,47),
(1,326,327),
(1,326,332),
(1,326,333),
(1,326,337),
(1,326,345),
(1,326,346),
(1,326,350),
(1,326,357),
(1,326,10),
(1,326,7),
(1,326,58),
(1,326,29),
(1,326,39),
(1,326,4),
(1,326,11),
(1,326,61),
(1,326,8),
(1,327,337),
(1,327,340),
(1,327,350),
(1,327,334),
(1,327,326),
(1,328,346),
(1,328,352),
(1,328,335),
(1,329,47),
(1,329,333),
(1,329,353),
(1,329,344),
(1,329,336),
(1,330,47),
(1,330,345),
(1,330,331),
(1,330,339),
(1,330,16),
(1,331,345),
(1,331,339),
(1,331,330),
(1,331,47),
(1,332,30),
(1,332,43),
(1,332,357),
(1,332,346),
(1,332,326),
(1,332,327),
(1,332,333),
(1,332,341),
(1,332,345),
(1,333,329),
(1,333,336),
(1,333,344),
(1,333,332),
(1,333,350),
(1,333,30),
(1,333,358),
(1,333,359),
(1,333,36),
(1,333,326),
(1,333,345),
(1,333,357),
(1,333,58),
(1,333,113),
(1,334,337),
(1,334,47),
(1,334,351),
(1,334,341),
(1,335,346),
(1,335,328),
(1,335,358),
(1,335,352),
(1,336,333),
(1,336,344),
(1,336,353),
(1,336,341),
(1,337,334),
(1,337,340),
(1,337,327),
(1,337,332),
(1,337,351),
(1,337,361),
(1,337,47),
(1,337,326),
(1,337,16),
(1,337,113),
(1,337,345),
(1,337,357),
(1,337,162),
(1,337,163),
(1,337,350),
(1,339,345),
(1,339,331),
(1,339,330),
(1,340,337),
(1,340,351),
(1,340,47),
(1,341,335),
(1,341,346),
(1,341,326),
(1,341,328),
(1,341,350),
(1,341,7),
(1,341,329),
(1,343,359),
(1,343,357),
(1,344,333),
(1,344,353),
(1,344,336),
(1,344,358),
(1,345,330),
(1,345,331),
(1,345,339),
(1,345,332),
(1,345,326),
(1,345,360),
(1,345,357),
(1,345,350),
(1,346,328),
(1,346,335),
(1,346,326),
(1,346,332),
(1,346,352),
(1,346,359),
(1,346,360),
(1,346,341),
(1,346,345),
(1,346,16),
(1,346,36),
(1,346,357),
(1,346,350),
(1,348,47),
(1,349,345),
(1,349,350),
(1,349,352),
(1,349,330),
(1,349,339),
(1,349,353),
(1,349,331),
(1,349,104),
(1,349,351),
(1,349,10),
(1,349,359),
(1,350,341),
(1,350,349),
(1,350,351),
(1,350,352),
(1,350,353),
(1,350,326),
(1,350,92),
(1,350,7),
(1,350,10),
(1,350,337),
(1,350,11),
(1,350,3),
(1,351,349),
(1,351,353),
(1,351,350),
(1,351,352),
(1,351,327),
(1,351,334),
(1,351,337),
(1,351,340),
(1,351,361),
(1,351,104),
(1,352,346),
(1,352,351),
(1,352,349),
(1,352,353),
(1,352,350),
(1,352,328),
(1,352,335),
(1,352,341),
(1,352,358),
(1,352,104),
(1,352,10),
(1,353,344),
(1,353,351),
(1,353,349),
(1,353,329),
(1,353,336),
(1,353,350),
(1,353,104),
(1,353,333),
(1,353,352),
(1,353,10),
(1,357,358),
(1,357,359),
(1,357,360),
(1,357,361),
(1,357,326),
(1,357,4),
(1,357,332),
(1,357,25),
(1,357,190),
(1,357,350),
(1,357,346),
(1,357,345),
(1,358,357),
(1,358,359),
(1,358,360),
(1,358,361),
(1,358,333),
(1,358,344),
(1,358,328),
(1,358,346),
(1,358,329),
(1,358,335),
(1,358,14),
(1,359,357),
(1,359,358),
(1,359,361),
(1,359,360),
(1,360,358),
(1,360,359),
(1,360,361),
(1,360,357),
(1,360,333),
(1,360,345),
(1,360,215),
(1,360,329),
(1,360,330),
(1,360,331),
(1,360,14),
(1,360,205),
(1,360,339),
(1,361,358),
(1,361,360),
(1,361,359),
(1,361,337),
(1,361,357),
(1,361,340),
(1,361,334),
(1,361,327),
(1,362,341),
(1,362,7),
(1,363,341),
(1,363,345),
(1,363,330),
(1,363,331),
(1,363,339),
(1,364,341),
(1,364,344),
(1,364,336),
(1,364,7),
(1,364,333),
(1,364,329),
(1,365,341),
(1,365,7),
(1,365,327),
(1,365,337),
(1,365,334),
(1,365,340),
(1,366,371),
(1,366,378),
(1,366,379),
(1,366,39),
(1,366,10),
(1,366,29),
(1,366,61),
(1,366,376),
(1,366,11),
(1,366,4),
(1,366,8),
(1,367,379),
(1,367,366),
(1,368,366),
--(1,368,368),
(1,368,371),
(1,368,375),
(1,368,379),
(1,368,36),
(1,368,373),
(1,368,376),
(1,368,58),
(1,368,374),
(1,368,16),
(1,368,370),
(1,368,162),
(1,369,375),
(1,370,174),
(1,370,366),
(1,370,375),
(1,370,379),
(1,370,36),
(1,370,376),
(1,370,368),
(1,370,373),
(1,370,190),
(1,371,368),
(1,371,370),
(1,371,372),
(1,371,373),
(1,371,374),
(1,371,446),
(1,371,379),
(1,371,366),
(1,371,378),
(1,371,30),
(1,371,376),
(1,371,113),
(1,371,163),
--(1,371,371),
(1,372,446),
(1,372,368),
(1,372,371),
(1,372,174),
(1,372,366),
(1,372,374),
(1,372,375),
(1,372,162),
(1,372,163),
(1,373,368),
(1,373,375),
(1,373,371),
(1,373,379),
(1,373,366),
(1,373,376),
(1,374,371),
(1,374,379),
(1,374,366),
(1,374,373),
(1,374,375),
(1,374,376),
(1,374,368),
(1,375,376),
(1,375,378),
(1,376,378),
(1,376,375),
(1,376,212),
(1,377,376),
(1,377,378),
(1,378,375),
(1,378,376),
(1,378,368),
(1,378,370),
(1,378,190),
(1,378,366),
(1,378,25),
(1,378,371),
(1,379,372),
(1,379,374),
(1,379,373),
(1,379,370),
(1,379,378),
(1,379,371),
(1,379,375),
(1,379,366),
(1,379,368),
(1,380,374),
(1,380,368),
(1,381,370),
(1,381,374),
(1,382,374),
(1,383,370),
(1,384,373),
(1,385,370),
(1,386,373),
(1,387,370),
(1,390,374),
(1,390,368),
(1,391,370),
(1,392,368),
(1,393,373),
(1,395,368),
(1,396,370),
(1,397,423),
(1,398,437),
(1,398,423),
(1,399,422),
(1,399,425),
(1,400,421),
(1,400,425),
(1,401,423),
(1,401,425),
(1,402,419),
(1,402,422),
(1,403,421),
(1,403,437),
(1,404,419),
(1,404,437),
(1,404,425),
(1,404,420),
(1,404,434),
(1,404,427),
(1,406,437),
(1,406,419),
(1,407,425),
(1,407,419),
(1,409,421),
(1,410,423),
(1,411,422),
(1,411,437),
(1,412,423),
(1,413,419),
(1,413,422),
(1,414,421),
(1,415,419),
(1,416,422),
(1,417,420),
(1,417,425),
(1,417,427),
(1,417,434),
(1,417,421),
(1,417,422),
(1,417,423),
(1,417,437),
(1,417,39),
(1,417,58),
(1,417,61),
(1,417,29),
(1,417,4),
(1,417,8),
(1,417,11),
(1,418,427),
(1,418,417),
(1,419,434),
(1,419,420),
(1,419,421),
(1,419,422),
(1,419,425),
(1,419,427),
(1,420,419),
(1,420,421),
(1,420,422),
(1,420,423),
(1,420,437),
(1,420,417),
(1,420,434),
(1,420,425),
(1,420,427),
(1,420,113),
(1,420,36),
(1,420,190),
(1,421,437),
(1,421,174),
(1,421,425),
(1,421,434),
(1,421,420),
(1,421,423),
(1,421,427),
(1,421,419),
(1,421,190),
(1,421,422),
(1,422,419),
(1,422,437),
(1,422,425),
(1,422,423),
(1,422,36),
(1,422,420),
(1,422,434),
(1,422,427),
(1,422,421),
(1,422,162),
(1,422,163),
(1,423,437),
(1,423,420),
(1,423,425),
(1,423,434),
(1,423,427),
(1,423,36),
(1,423,421),
(1,423,422),
(1,424,434),
(1,425,420),
(1,425,421),
(1,425,422),
(1,425,423),
(1,425,434),
(1,425,417),
(1,425,419),
(1,425,437),
(1,426,427),
(1,427,417),
(1,427,420),
(1,427,421),
(1,427,422),
(1,427,423),
(1,427,419),
(1,427,434),
(1,427,25),
(1,427,190),
(1,427,212),
(1,428,434),
(1,430,434),
(1,431,434),
(1,432,434),
(1,433,434),
(1,434,420),
(1,434,421),
(1,434,422),
(1,434,423),
(1,434,425),
(1,434,417),
(1,434,419),
(1,434,427),
(1,436,434),
(1,438,372),
(1,438,371),
(1,438,446),
(1,439,372),
(1,439,371),
(1,439,446),
(1,440,446),
(1,440,372),
(1,440,371),
(1,441,446),
(1,441,372),
(1,442,446),
(1,442,371),
(1,442,372),
(1,443,372),
(1,443,446),
(1,443,373),
(1,444,446),
(1,444,372),
(1,446,372),
(1,446,374),
(1,447,455),
(1,447,453),
(1,447,449),
(1,448,449),
(1,448,455),
(1,449,453),
(1,449,454),
(1,449,455),
(1,449,174),
(1,449,58),
(1,449,23),
(1,449,43),
(1,449,162),
(1,449,163),
(1,450,449),
(1,450,453),
(1,450,455),
(1,451,454),
(1,451,453),
(1,453,449),
(1,453,454),
(1,453,455),
(1,453,4),
(1,454,455),
(1,454,449),
(1,454,453),
(1,455,453),
(1,455,454),
(1,457,157),
(1,458,157),
(1,459,157),
(1,460,157),
(1,461,157),
(1,462,157),
(1,463,157),
(1,464,157),
(1,465,157),
(1,466,43),
(1,466,47),
(1,466,326),
(1,467,2),
(1,468,359),
(1,470,82),
(1,470,126),
(1,471,127),
(1,455,449),
(1,2,2),
(1,3,3),
(1,4,4),
(1,5,5),
(1,6,6),
(1,7,7),
(1,8,8),
(1,9,9),
(1,10,10),
(1,11,11),
(1,14,14),
(1,16,16),
(1,23,23),
(1,25,25),
(1,29,29),
(1,30,30),
(1,31,31),
(1,33,33),
(1,36,36),
(1,39,39),
(1,43,43),
(1,47,47),
(1,52,52),
(1,53,53),
(1,58,58),
(1,61,61),
(1,82,82),
(1,92,92),
(1,97,97),
(1,98,98),
(1,101,101),
(1,104,104),
(1,112,112),
(1,113,113),
(1,126,126),
(1,127,127),
(1,129,129),
(1,131,131),
(1,157,157),
(1,162,162),
(1,163,163),
(1,174,174),
(1,176,176),
(1,190,190),
(1,199,199),
(1,205,205),
(1,210,210),
(1,211,211),
(1,212,212),
(1,213,213),
(1,214,214),
(1,215,215),
(1,260,260),
(1,261,261),
(1,262,262),
(1,263,263),
(1,264,264),
(1,265,265),
(1,266,266),
(1,267,267),
(1,268,268),
(1,326,326),
(1,327,327),
(1,328,328),
(1,329,329),
(1,330,330),
(1,331,331),
(1,332,332),
(1,333,333),
(1,334,334),
(1,335,335),
(1,336,336),
(1,337,337),
(1,339,339),
(1,340,340),
(1,341,341),
(1,344,344),
(1,345,345),
(1,346,346),
(1,349,349),
(1,350,350),
(1,351,351),
(1,352,352),
(1,353,353),
(1,357,357),
(1,358,358),
(1,359,359),
(1,360,360),
(1,361,361),
(1,366,366),
(1,368,368),
(1,370,370),
(1,371,371),
(1,372,372),
(1,373,373),
(1,374,374),
(1,375,375),
(1,376,376),
(1,378,378),
(1,379,379),
(1,417,417),
(1,419,419),
(1,420,420),
(1,421,421),
(1,422,422),
(1,423,423),
(1,425,425),
(1,427,427),
(1,434,434),
(1,437,437),
(1,446,446),
(1,449,449),
(1,453,453),
(1,454,454),
(1,455,455),
(1,470,470);

-------------------
--- Survey No. 2 --
-------------------
INSERT INTO evaluations (survey, evaluator, evaluand) VALUES
(2,2,467),
(2,3,54),
(2,3,467),
(2,3,95),
(2,3,94),
(2,4,19),
(2,4,13),
(2,4,12),
(2,4,20),
(2,4,28),
(2,6,32),
(2,6,122),
(2,6,123),
(2,6,120),
(2,7,95),
(2,10,94),
(2,10,54),
(2,10,95),
(2,11,96),
(2,11,95),
(2,11,54),
(2,12,19),
(2,12,13),
(2,12,20),
(2,13,19),
(2,13,12),
(2,13,20),
(2,14,15),
(2,14,17),
(2,14,28),
(2,14,110),
(2,15,28),
(2,15,27),
(2,16,21),
(2,16,110),
(2,16,26),
(2,16,27),
(2,16,15),
(2,16,17),
(2,17,28),
(2,17,21),
(2,17,110),
(2,19,13),
(2,19,12),
(2,19,20),
(2,20,12),
(2,20,19),
(2,20,13),
(2,21,27),
(2,21,28),
(2,22,114),
(2,22,32),
(2,22,24),
(2,23,116),
(2,23,119),
(2,23,120),
(2,23,121),
(2,23,24),
(2,23,117),
(2,23,118),
(2,23,122),
(2,23,123),
(2,24,118),
(2,24,117),
(2,24,124),
(2,24,125),
(2,24,115),
(2,24,120),
(2,25,26),
(2,25,27),
(2,25,28),
(2,26,21),
(2,26,116),
(2,26,119),
(2,27,110),
(2,28,15),
(2,28,17),
(2,28,116),
(2,29,32),
(2,31,32),
(2,33,34),
(2,35,34),
(2,38,34),
(2,39,40),
(2,39,198),
(2,39,41),
(2,40,198),
(2,40,41),
(2,41,198),
(2,41,40),
(2,42,45),
(2,42,269),
(2,42,46),
(2,43,269),
(2,43,42),
(2,43,44),
(2,43,45),
(2,43,46),
(2,43,41),
(2,44,42),
(2,44,45),
(2,44,46),
(2,44,269),
(2,45,269),
(2,45,42),
(2,45,44),
(2,45,46),
(2,46,44),
(2,46,269),
(2,46,45),
(2,46,42),
(2,47,348),
(2,47,466),
(2,47,26),
(2,52,81),
(2,52,83),
(2,52,203),
(2,53,96),
(2,53,95),
(2,53,94),
(2,53,54),
(2,54,452),
(2,54,96),
(2,54,94),
(2,54,467),
(2,55,13),
(2,61,467),
(2,61,452),
(2,61,81),
(2,61,83),
(2,64,124),
(2,64,125),
(2,82,81),
(2,82,83),
(2,83,452),
(2,90,54),
(2,92,86),
(2,92,89),
(2,92,90),
(2,92,95),
(2,92,94),
(2,96,54),
(2,98,102),
(2,98,100),
(2,98,95),
(2,99,102),
(2,99,100),
(2,100,102),
(2,102,100),
(2,103,102),
(2,103,100),
(2,104,34),
(2,104,54),
(2,104,467),
(2,105,94),
(2,106,81),
(2,107,452),
(2,108,83),
(2,110,15),
(2,110,17),
(2,112,120),
(2,112,115),
(2,112,119),
(2,112,26),
(2,112,122),
(2,112,123),
(2,112,116),
(2,113,115),
(2,113,22),
(2,113,114),
(2,113,120),
(2,113,122),
(2,113,123),
(2,113,121),
(2,114,22),
(2,114,24),
(2,114,117),
(2,114,118),
(2,115,124),
(2,115,125),
(2,115,122),
(2,115,123),
(2,117,27),
(2,117,120),
(2,118,115),
(2,118,124),
(2,118,125),
(2,118,21),
(2,118,110),
(2,118,24),
(2,118,117),
(2,118,120),
(2,118,28),
(2,118,26),
(2,118,27),
(2,119,116),
(2,120,119),
(2,120,121),
(2,121,116),
(2,121,119),
(2,121,26),
(2,122,124),
(2,122,125),
(2,122,26),
(2,122,27),
(2,122,110),
(2,122,115),
(2,122,118),
(2,122,81),
(2,123,121),
(2,123,115),
(2,123,24),
(2,123,26),
(2,123,27),
(2,123,117),
(2,123,120),
(2,124,122),
(2,124,123),
(2,125,122),
(2,125,123),
(2,126,124),
(2,126,125),
(2,126,114),
(2,126,24),
(2,126,22),
(2,127,110),
(2,128,119),
(2,128,116),
(2,128,120),
(2,128,122),
(2,128,123),
(2,129,114),
(2,129,122),
(2,129,123),
(2,129,22),
(2,129,124),
(2,129,125),
(2,129,117),
(2,131,122),
(2,131,123),
(2,132,117),
(2,132,118),
(2,133,117),
(2,133,118),
(2,138,118),
(2,138,117),
(2,141,115),
(2,141,122),
(2,141,123),
(2,174,44),
(2,197,34),
(2,198,40),
(2,198,41),
(2,199,201),
(2,199,204),
(2,200,202),
(2,201,204),
(2,202,203),
(2,203,202),
(2,204,201),
(2,204,202),
(2,205,203),
(2,205,34),
(2,205,202),
(2,206,204),
(2,207,201),
(2,207,209),
(2,209,204),
(2,210,209),
(2,210,201),
(2,211,203),
(2,211,209),
(2,211,95),
(2,212,209),
(2,212,203),
(2,212,201),
(2,213,202),
(2,213,209),
(2,214,204),
(2,214,202),
(2,215,203),
(2,215,202),
(2,216,209),
(2,217,209),
(2,218,209),
(2,260,209),
(2,261,201),
(2,264,204),
(2,265,202),
(2,267,203),
(2,267,13),
(2,268,203),
(2,268,202),
(2,270,119),
(2,272,116),
(2,273,86),
(2,274,86),
(2,280,468),
(2,285,119),
(2,294,468),
(2,302,119),
(2,309,119),
(2,310,116),
(2,317,468),
(2,318,86),
(2,323,86),
(2,326,325),
(2,326,466),
(2,327,348),
(2,327,466),
(2,327,365),
(2,327,362),
(2,329,347),
(2,329,89),
(2,330,347),
(2,330,363),
(2,330,362),
(2,331,363),
(2,333,466),
(2,333,89),
(2,333,364),
(2,333,110),
(2,333,362),
(2,334,365),
(2,335,348),
(2,335,362),
(2,336,89),
(2,337,466),
(2,337,348),
(2,337,365),
(2,337,362),
(2,340,348),
(2,340,365),
(2,341,362),
(2,341,364),
(2,344,364),
(2,345,347),
(2,346,347),
(2,347,466),
(2,349,86),
(2,349,89),
(2,349,96),
(2,349,94),
(2,350,363),
(2,350,365),
(2,350,362),
(2,350,364),
(2,350,466),
(2,351,96),
(2,351,89),
(2,351,86),
(2,351,54),
(2,352,467),
(2,352,96),
(2,352,89),
(2,352,86),
(2,352,54),
(2,353,467),
(2,353,89),
(2,353,96),
(2,353,86),
(2,353,94),
(2,353,54),
(2,357,325),
(2,357,363),
(2,357,15),
(2,357,17),
(2,357,13),
(2,357,12),
(2,357,19),
(2,357,20),
(2,358,363),
(2,359,468),
(2,359,325),
(2,359,95),
(2,360,15),
(2,360,17),
(2,361,15),
(2,361,17),
(2,362,364),
(2,362,365),
(2,362,363),
(2,363,365),
(2,363,362),
(2,363,364),
(2,364,362),
(2,364,365),
(2,364,348),
(2,364,363),
(2,365,362),
(2,365,364),
(2,365,348),
(2,365,363),
(2,365,96),
(2,366,377),
(2,366,367),
(2,366,40),
(2,366,32),
(2,368,377),
(2,368,367),
(2,370,367),
(2,370,377),
(2,371,377),
(2,371,369),
(2,371,21),
(2,372,377),
(2,373,377),
(2,375,369),
(2,376,377),
(2,378,20),
(2,378,19),
(2,378,369),
(2,378,13),
(2,378,12),
(2,379,367),
(2,379,377),
(2,379,21),
(2,379,118),
(2,380,121),
(2,381,121),
(2,389,121),
(2,390,118),
(2,392,121),
(2,395,118),
(2,400,90),
(2,407,90),
(2,414,90),
(2,417,418),
(2,417,32),
(2,420,418),
(2,421,418),
(2,422,418),
(2,423,418),
(2,427,418),
(2,427,20),
(2,427,19),
(2,427,12),
(2,434,90),
(2,434,418),
(2,434,94),
(2,434,467),
(2,437,90),
(2,448,24),
(2,449,24),
(2,450,24),
(2,452,83),
(2,453,452),
(2,453,32),
(2,453,46),
(2,453,41),
(2,453,44),
(2,453,40),
(2,453,42),
(2,454,20),
(2,454,21),
(2,454,24),
(2,455,452),
(2,466,347),
(2,467,81),
(2,467,83),
(2,468,325),
(2,469,83),
(2,470,81),
(2,470,83),
(2,472,369),
(2,473,369),
(2,474,369),
(2,475,468),
(2,476,468),
(2,477,468),
(2,478,468),
(2,479,468),
(2,480,369),
(2,481,369),
(2,482,369),
(2,127,21),
(2,40,40),
(2,96,96),
(2,95,95),
(2,94,94),
(2,115,115),
(2,347,347),
(2,86,86),
(2,89,89),
(2,90,90),
(2,198,198),
(2,377,377),
(2,452,452),
(2,325,325),
(2,367,367),
(2,418,418),
(2,269,269),
(2,54,54),
(2,114,114),
(2,19,19),
(2,369,369),
(2,32,32),
(2,466,466),
(2,348,348),
(2,41,41),
(2,13,13),
(2,12,12),
(2,116,116),
(2,119,119),
(2,120,120),
(2,121,121),
(2,124,124),
(2,125,125),
(2,42,42),
(2,363,363),
(2,365,365),
(2,26,26),
(2,27,27),
(2,44,44),
(2,21,21),
(2,110,110),
(2,15,15),
(2,17,17),
(2,45,45),
(2,46,46),
(2,28,28),
(2,20,20),
(2,24,24),
(2,117,117),
(2,118,118),
(2,122,122),
(2,123,123),
(2,362,362),
(2,22,22),
(2,364,364),
(2,34,34),
(2,81,81),
(2,83,83),
(2,467,467),
(2,102,102),
(2,100,100),
(2,201,201),
(2,203,203),
(2,204,204),
(2,209,209),
(2,202,202),
(2,468,468);

UPDATE evaluations SET completed=FALSE, create_time=now(), create_User='0 - System', version=0 WHERE id IS NOT NULL;

COMMIT;
10 DIM slowo$(2736899)
15 DIM lit$(20)

20 OPEN "slowa.txt" FOR INPUT AS #1
30 FOR w = 1 TO 2736899
    40 LINE INPUT #1, slowo$ 'Wczytuje s�owo tekstu z pliku
    45 CLS: PRINT "Wczytuj� s�ownik": PRINT INT((2736899 - w) / 10000)
    50 slowo$(w) = slowo$
60 NEXT


100 CLS
120 INPUT "Wprowad� litery (min. 5)"; litery$
125 il = LEN(litery$) 'ilo�� liter
130 IF il < 5 THEN PRINT "Ilo�� liter mniejsza ni� 5. Wpisz ponownie ": GOTO 120 ' je�li ilo�� liter mniesza ni� 5 od nowa
140 FOR x = 1 TO il
    150 lit$(x) = MID$(litery$, x, 1) ' przypisanie zmiennych do poszczeg�lnych liter
160 NEXT

'podane litery - ukladanie alfabetyczne

385 x = il 'x bedzie malec
387 FOR y = 1 TO x - 1 'tu nie maleje
    388 x = x - 1 'tu maleje
    390 FOR z = 1 TO x
        400 IF ASC(lit$(z)) > ASC(lit$(z + 1)) THEN litrez$ = lit$(z): lit$(z) = lit$(z + 1): lit$(z + 1) = litrez$
450 NEXT: NEXT
455 literyalfabet$ = ""
460 FOR x = 1 TO il
    470 literyalfabet$ = literyalfabet$ + lit$(x) ' tworzenie jednego s�owa z liter - alfabetycznie
480 NEXT

' szukanie takiego samego zestawu

1240 FOR w = 1 TO 2736899
    1370 IF LEN(slowo$(w)) <> il GOTO 1800 'je�li inna ilo�� liter wczytanego s�owa niz w wpisanych to wczytaj kolejne s�owo

    'wczytane slowo - ukladanie alfabetyczne

    1400 'PRINT slowo$(w),
    1455 FOR x = 1 TO il
        1460 lit$(x) = MID$(slowo$(w), x, 1) ' przypisanie zmiennych do poszczeg�lnych liter
    1470 NEXT

    1485 x = il 'x bedzie malec
    1487 FOR y = 1 TO x - 1 'tu nie maleje
        1488 x = x - 1 'tu maleje
        1490 FOR z = 1 TO x
            1500 IF ASC(lit$(z)) > ASC(lit$(z + 1)) THEN litrez$ = lit$(z): lit$(z) = lit$(z + 1): lit$(z + 1) = litrez$
    1550 NEXT: NEXT
    1570 slowoalfabet$ = ""
    1600 FOR x = 1 TO il
        1610 slowoalfabet$ = slowoalfabet$ + lit$(x) ' tworzenie jednego s�owa z liter - alfabetycznie
    1680 NEXT

    ' porownywanie slow
    1700 IF literyalfabet$ = slowoalfabet$ THEN PRINT slowo$(w),
1800 NEXT
2590 PRINT "SPACJA - OD NOWA"
2600 odnowa$ = INKEY$: IF odnowa$ <> CHR$(32) GOTO 2600
2700 GOTO 100







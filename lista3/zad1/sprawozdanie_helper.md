Niestety z przyczyny prawdopodobnie tego że tmux ma limit na pamiętane linijki duża część mojego zadania nr 1 jest ucięta. Z tego powodu piszę to sprawozdanie żeby opisać wszystkie komendy które pisałem ale niestety bez ich outputów z racji tego że pamiętam tylko to co wpisywałem

Dodatkowe informacje:
korzystam z narzędzia **zoxide** który jest odpowiednikiem **cd**, używa sie go komendą z pozwala na przechodzenie do ostatnio odwiedzqanych folderów bez wpisywania ich pełnych ścieżek tylko po części nazwy (więc z folderu *trunk* do *braches/268449* po wcześniejszym odwiedzeniu mogę przejść tylko za pomocą komendy `$ z 268449` pomijając `z ..` oraz `$ z branches`)
`..` to alias na `z ..`

``` bash
.../lista3 $ svn co https://repo.cs.pwr.edu.pl/p-0/
.../lista3 $ z p-0/app_1/trunk
.../trunk $ cat README
.../trunk $ ..
.../app_1 $ svn copy ./trunk ./branches/268449
.../app_1 $ z branches/268449
.../268449 $ v
```

*v* to alias na *neovima* w którym wystąpiła edycja plików:
* README
* main.c
* makefile
* program.h
* s268449_podprogram.c

```bash
.../268449 $ svn status
.../268449 $ svn add s268449_podprogram.c
.../268449 $ svn status
.../268449 $ svn commit -m "268449 subprogram is working"
.../268449 $ svn merge ^/app_1/trunk
.../268449 $ svn commit -m "Synchronization with trunk"
```

następną komedę jako jedyną mam zapisaną jako że chciałem lepiej zrozumieć jej output więc w notatniku ją sobie rospisałem na części
```bash
../268449 $ svn mergeinfo ../../trunk
Authentication realm: <https://repo.cs.pwr.edu.pl:443> Subversion Repository
Password for '268449': 

    youngest common ancestor
    |         last full merge
    |         |        tip of branch
    |         |        |         repository path

    210                211
    |                  |
  -------| |------------         app_1/trunk
     \
      \
       --| |------------         app_1/branches/268449
                       |
                       WC

$ svn log
```

Część outputu tej komendy widać już na logach z tmuxa a więc tutaj skończę tą część sprawozdania

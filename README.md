# Git-komento-opas

Käytännönläheinen suomenkielinen Git-opas päivittäiseen käyttöön. Oppaassa painotetaan muutosten tarkistamista, täsmällisiä committeja, turvallisia työnkulkuja ja virheistä palautumista.

## Sisällys

1. [Gitin peruskäsitteet](#1-gitin-peruskäsitteet)
2. [Repositorion luominen](#2-repositorion-luominen)
3. [Gitin käyttäjätiedot](#3-gitin-käyttäjätiedot)
4. [Projektin tilan tarkistaminen](#4-projektin-tilan-tarkistaminen)
5. [Muutosten tarkasteleminen](#5-muutosten-tarkasteleminen)
6. [Muutosten lisääminen staging-alueelle](#6-muutosten-lisääminen-staging-alueelle)
7. [Commitin tekeminen](#7-commitin-tekeminen)
8. [Historian tarkasteleminen](#8-historian-tarkasteleminen)
9. [Haarojen käyttäminen](#9-haarojen-käyttäminen)
10. [Haarojen yhdistäminen](#10-haarojen-yhdistäminen)
11. [Etärepositoriot](#11-etärepositoriot)
12. [Muutosten hakeminen ja lähettäminen](#12-muutosten-hakeminen-ja-lähettäminen)
13. [Tiedostomuutosten peruuttaminen](#13-tiedostomuutosten-peruuttaminen)
14. [Viimeisimmän commitin korjaaminen](#14-viimeisimmän-commitin-korjaaminen)
15. [Commitien kumoaminen](#15-commitien-kumoaminen)
16. [Kadonneiden commitien etsiminen](#16-kadonneiden-commitien-etsiminen)
17. [Keskeneräisten muutosten siirtäminen sivuun](#17-keskeneräisten-muutosten-siirtäminen-sivuun)
18. [Tiedostojen poistaminen ja siirtäminen](#18-tiedostojen-poistaminen-ja-siirtäminen)
19. [`.gitignore`](#19-gitignore)
20. [Tagit](#20-tagit)
21. [Kahden version vertaaminen](#21-kahden-version-vertaaminen)
22. [Yksittäisen commitin siirtäminen toiseen haaraan](#22-yksittäisen-commitin-siirtäminen-toiseen-haaraan)
23. [Rebase](#23-rebase)
24. [Pakotettu push](#24-pakotettu-push)
25. [Tiedoston tekijähistorian tutkiminen](#25-tiedoston-tekijähistorian-tutkiminen)
26. [Hakeminen historiasta](#26-hakeminen-historiasta)
27. [Turvallinen päivittäinen työnkulku](#27-tyypillinen-turvallinen-päivittäinen-työnkulku)
28. [Esimerkki täsmällisestä commitista](#28-esimerkki-yhden-täsmällisen-commitin-tekemisestä)
29. [Hyvä commit-käytäntö](#29-hyvä-commit-käytäntö)
30. [Vaaralliset komennot](#30-vaaralliset-komennot)
31. [Hyödylliset aliakset](#31-hyödylliset-aliakset)
32. [Pikamuistilista](#32-pikamuistilista)
33. [Suositeltu perussääntö](#33-suositeltu-perussääntö)

## 1. Gitin peruskäsitteet

**Repository eli repositorio**

Projektihakemisto, jonka muutoksia Git seuraa. Se sisältää tavallisten tiedostojen lisäksi piilotetun `.git`-hakemiston.

**Working tree eli työpuu**

Projektin tämänhetkiset tiedostot levyllä.

**Staging area eli valmistelualue**

Välivaihe, johon valitaan seuraavaan commitiin kuuluvat muutokset.

**Commit**

Tallennettu ja nimetty piste projektin historiassa.

**Branch eli haara**

Oma kehityslinja. Esimerkiksi `main` voi sisältää vakaan version ja `feature/uusi-toiminto` keskeneräisen työn.

**Remote eli etärepositorio**

Repositorion verkossa sijaitseva vastine, esimerkiksi GitHubissa. Tavallisin etärepositorion nimi on `origin`.

## 2. Repositorion luominen

### Luo uusi Git-repositorio nykyiseen hakemistoon

```bash
git init
```

Komento luo hakemistoon piilotetun `.git`-hakemiston. Tämän jälkeen Git pystyy seuraamaan projektin tiedostoja.

Tarkista tila:

```bash
git status
```

### Kloonaa olemassa oleva repositorio

```bash
git clone https://github.com/kayttaja/projekti.git
```

Git lataa repositorion ja sen historian uuteen hakemistoon.

Voit antaa kohdehakemistolle oman nimen:

```bash
git clone https://github.com/kayttaja/projekti.git oma-hakemisto
```

## 3. Gitin käyttäjätiedot

Aseta nimi ja sähköpostiosoite:

```bash
git config --global user.name "Erkki Esimerkki"
git config --global user.email "erkki.esimerkki@example.com"
```

Näytä asetukset:

```bash
git config --global --list
```

Tietoja käytetään commitien tekijätietoina. Niiden ei tarvitse olla samat kuin käyttöjärjestelmän käyttäjätunnus.

## 4. Projektin tilan tarkistaminen

```bash
git status
```

Tämä on yksi Gitin tärkeimmistä komennoista. Se näyttää muun muassa:

- aktiivisen haaran
- muokatut tiedostot
- uudet seuraamattomat tiedostot
- staging-alueelle lisätyt muutokset
- mahdollisen eron etärepositorioon nähden

Tiiviimpi esitys:

```bash
git status --short
```

Esimerkkituloste:

```text
 M README.md
A  docs/opas.md
?? notes.txt
```

Merkinnät tarkoittavat:

- ` M` – tiedostoa on muokattu, mutta muutosta ei ole valmisteltu
- `A ` – uusi tiedosto on lisätty staging-alueelle
- `??` – Git ei vielä seuraa tiedostoa

## 5. Muutosten tarkasteleminen

Näytä työpuun muutokset:

```bash
git diff
```

Tämä näyttää muutokset, joita ei ole vielä lisätty staging-alueelle.

Näytä staging-alueelle lisätyt muutokset:

```bash
git diff --staged
```

Vaihtoehtoinen nimi:

```bash
git diff --cached
```

Näytä tietyn tiedoston muutokset:

```bash
git diff -- polku/tiedostoon.md
```

Tiedostonimen edessä oleva `--` erottaa tiedoston mahdollisista komentovalitsimista.

## 6. Muutosten lisääminen staging-alueelle

Lisää yksi tiedosto:

```bash
git add README.md
```

Lisää useita nimettyjä tiedostoja:

```bash
git add README.md docs/opas.md scripts/check.sh
```

Lisää kokonainen tarkasti rajattu hakemisto:

```bash
git add docs/luku-056/
```

Lisää vain osa yhden tiedoston muutoksista:

```bash
git add -p README.md
```

`-p` eli patch-tila näyttää muutokset paloina ja kysyy jokaisesta erikseen, lisätäänkö se commitiin.

Tavallisimmat vastaukset:

- `y` – lisää tämä muutos
- `n` – älä lisää
- `s` – jaa muutos pienempiin osiin
- `q` – lopeta
- `?` – näytä ohje

### Vältä tarpeettoman laajoja lisäyksiä

Komennot

```bash
git add .
```

ja

```bash
git add -A
```

voivat lisätä vahingossa mukaan esimerkiksi väliaikaistiedostoja, paikallisia asetuksia tai toiseen työvaiheeseen kuuluvia muutoksia.

Turvallisempi käytäntö on nimetä tiedostot tai hakemistot täsmällisesti:

```bash
git add manuscript/CH-056.md manifests/chapters.json
```

Tarkista aina lisäyksen jälkeen:

```bash
git diff --staged
```

## 7. Commitin tekeminen

Kun staging-alueella ovat täsmälleen oikeat muutokset:

```bash
git commit -m "docs: add Git command guide"
```

Commit-viestin pitäisi kuvata, mitä muutos tekee.

Hyviä esimerkkejä:

```text
docs: add installation instructions
fix: correct voltage calculation
feat: add search filtering
refactor: simplify parser structure
test: add transformer model tests
chore: update build scripts
```

Laajemman commit-viestin voi kirjoittaa editorissa:

```bash
git commit
```

Tyypillinen rakenne:

```text
feat: add tube reference chapter

Add operating limits, pinouts and substitution notes for ECC83,
ECC82 and ECC81.
```

### Tarkista commit ennen sen tekemistä

```bash
git status
git diff --staged
git commit -m "feat: add tube reference chapter"
```

Tämä kolmen komennon sarja on turvallinen perusrutiini.

## 8. Historian tarkasteleminen

Näytä commit-historia:

```bash
git log
```

Tiivis yhden rivin esitys:

```bash
git log --oneline
```

Näytä haararakenne:

```bash
git log --oneline --graph --decorate --all
```

Näytä viimeisin commit:

```bash
git show HEAD
```

Näytä tietty commit:

```bash
git show a1b2c3d
```

Commitin tunnisteesta riittää yleensä yksikäsitteinen alkuosa.

Näytä tietyn tiedoston historia:

```bash
git log -- README.md
```

Näytä myös tiedoston muutokset:

```bash
git log -p -- README.md
```

## 9. Haarojen käyttäminen

Näytä paikalliset haarat:

```bash
git branch
```

Näytä myös etähaarat:

```bash
git branch --all
```

Luo uusi haara ja siirry siihen:

```bash
git switch -c feature/uusi-luku
```

Siirry olemassa olevaan haaraan:

```bash
git switch main
```

Vanhempi vastaava komento on:

```bash
git checkout main
```

Uusissa työnkuluissa `git switch` on yleensä selkeämpi haarojen vaihtamiseen.

Poista valmis paikallinen haara:

```bash
git branch -d feature/uusi-luku
```

Pakotettu poisto:

```bash
git branch -D feature/uusi-luku
```

`-D` poistaa haaran, vaikka sen muutoksia ei olisi yhdistetty. Käytä sitä harkiten.

## 10. Haarojen yhdistäminen

Siirry ensin haaraan, johon muutokset yhdistetään:

```bash
git switch main
```

Yhdistä toinen haara:

```bash
git merge feature/uusi-luku
```

Jos Git pystyy yhdistämään muutokset automaattisesti, operaatio valmistuu heti.

Jos syntyy konflikti, Git merkitsee ristiriitaiset kohdat tiedostoihin:

```text
 <<<<<<< HEAD
Nykyisen haaran sisältö
 =======
Yhdistettävän haaran sisältö
 >>>>>>> feature/uusi-luku
```

Muokkaa tiedosto haluttuun muotoon, poista konfliktimerkinnät ja lisää korjattu tiedosto staging-alueelle:

```bash
git add polku/tiedostoon.md
git commit
```

Keskeytä keskeneräinen merge:

```bash
git merge --abort
```

## 11. Etärepositoriot

Näytä määritetyt etärepositoriot:

```bash
git remote -v
```

Lisää GitHub-repositorio nimellä `origin`:

```bash
git remote add origin git@github.com:kayttaja/projekti.git
```

Vaihda osoite:

```bash
git remote set-url origin git@github.com:kayttaja/projekti.git
```

Näytä tarkemmat tiedot:

```bash
git remote show origin
```

## 12. Muutosten hakeminen ja lähettäminen

### Fetch

```bash
git fetch origin
```

`fetch` hakee etärepositorion uudet tiedot, mutta ei yhdistä niitä nykyiseen haaraan.

Se on turvallinen tapa tarkistaa, mitä etärepositoriossa on muuttunut.

### Pull

```bash
git pull
```

`pull` hakee muutokset ja yhdistää ne nykyiseen haaraan.

Selkeämpi vaihtoehto on usein tehdä vaiheet erikseen:

```bash
git fetch origin
git log --oneline HEAD..origin/main
git merge origin/main
```

### Push

Lähetä nykyinen haara etärepositorioon:

```bash
git push
```

Kun uusi haara lähetetään ensimmäisen kerran:

```bash
git push -u origin feature/uusi-luku
```

`-u` yhdistää paikallisen haaran etähaaraan. Tämän jälkeen tavallinen `git push` riittää.

## 13. Tiedostomuutosten peruuttaminen

### Peruuta työpuussa oleva muutos

```bash
git restore README.md
```

Tämä palauttaa tiedoston viimeisimmän commitin mukaiseen tilaan. Paikalliset tallentamattomat muutokset menetetään.

Palauta kaikki seuratut tiedostot:

```bash
git restore .
```

Tätä kannattaa käyttää vain, kun olet tarkistanut tilanteen huolellisesti.

### Poista tiedosto staging-alueelta mutta säilytä muutos

```bash
git restore --staged README.md
```

Tiedosto jää muokatuksi työpuuhun, mutta ei enää kuulu seuraavaan commitiin.

Kaikkien staged-muutosten poistaminen:

```bash
git restore --staged .
```

## 14. Viimeisimmän commitin korjaaminen

Lisää unohtunut muutos viimeisimpään commitiin:

```bash
git add unohtunut-tiedosto.md
git commit --amend --no-edit
```

Muuta viimeisimmän commitin viesti:

```bash
git commit --amend
```

Jos commit on jo lähetetty ja muut ihmiset voivat käyttää sitä, amend muuttaa historiaa. Silloin sitä ei yleensä pidä tehdä ilman yhteistä sopimusta.

## 15. Commitien kumoaminen

### Revert: turvallinen kumoaminen

```bash
git revert a1b2c3d
```

`revert` luo uuden commitin, joka kumoaa valitun commitin muutokset. Vanha historia säilyy.

Tämä on yleensä paras tapa kumota jo GitHubiin lähetetty muutos.

### Reset: historian siirtäminen

Siirrä haara edelliseen commitiin mutta säilytä muutokset staging-alueella:

```bash
git reset --soft HEAD~1
```

Säilytä muutokset työpuussa mutta poista ne staging-alueelta:

```bash
git reset HEAD~1
```

Poista sekä commit että sen muutokset:

```bash
git reset --hard HEAD~1
```

`--hard` voi hävittää työn työpuusta. Tarkista ennen käyttöä:

```bash
git status
git log --oneline -5
```

## 16. Kadonneiden commitien etsiminen

Git tallentaa viittauslokin monista haarojen ja `HEAD`-osoittimen siirroista:

```bash
git reflog
```

Esimerkki:

```text
c005ff2 HEAD@{0}: reset: moving to HEAD~1
af04d91 HEAD@{1}: commit: add safety chapter
```

Kadonneelta vaikuttavan commitin voi palauttaa esimerkiksi uudeksi haaraksi:

```bash
git switch -c recovery af04d91
```

`git reflog` on yksi tärkeimmistä pelastuskomennoista esimerkiksi virheellisen resetin jälkeen.

## 17. Keskeneräisten muutosten siirtäminen sivuun

Tallenna nykyiset muutokset väliaikaisesti:

```bash
git stash push -m "Keskeneräinen kuvitustyö"
```

Näytä stashit:

```bash
git stash list
```

Palauta viimeisin stash ja poista se stash-listasta:

```bash
git stash pop
```

Palauta stash säilyttäen se listassa:

```bash
git stash apply 'stash@{0}'
```

Näytä stash-muutokset:

```bash
git stash show -p 'stash@{0}'
```

Oletusarvoisesti stash ei välttämättä ota mukaan seuraamattomia tiedostoja. Lisää ne komennolla:

```bash
git stash push -u -m "Keskeneräinen työ"
```

## 18. Tiedostojen poistaminen ja siirtäminen

Poista tiedosto sekä levyltä että Gitistä:

```bash
git rm vanha-tiedosto.md
```

Lopeta tiedoston seuraaminen mutta säilytä se levyllä:

```bash
git rm --cached paikallinen-asetus.env
```

Siirrä tai nimeä tiedosto uudelleen:

```bash
git mv vanha-nimi.md uusi-nimi.md
```

Tavallinen käyttöjärjestelmän `mv` toimii myös, mutta `git mv` ilmaisee tarkoituksen selkeästi.

## 19. `.gitignore`

`.gitignore` kertoo Gitille, mitä seuraamattomia tiedostoja ei pidä ehdottaa lisättäviksi.

Esimerkki:

```gitignore
# macOS
.DS_Store

# Python
__pycache__/
*.pyc
.venv/

# Rakennustulokset
build/
dist/
*.pdf

# Paikalliset asetukset
.env
*.local
```

`.gitignore` ei lopeta jo seurattavan tiedoston seuraamista. Jos tiedosto on jo mukana Gitissä:

```bash
git rm --cached tiedosto
```

Lisää sen jälkeen tiedosto `.gitignoreen` ja tee commit.

## 20. Tagit

Tagilla voidaan nimetä tärkeä commit, esimerkiksi julkaisuversio.

Luo annotoitu tagi:

```bash
git tag -a v1.0.0 -m "Ensimmäinen vakaa julkaisu"
```

Näytä tagit:

```bash
git tag
```

Lähetä yksi tagi etärepositorioon:

```bash
git push origin v1.0.0
```

Lähetä kaikki paikalliset tagit:

```bash
git push origin --tags
```

Näytä tagin tiedot:

```bash
git show v1.0.0
```

## 21. Kahden version vertaaminen

Vertaa kahta commitia:

```bash
git diff a1b2c3d e4f5g6h
```

Vertaa nykyistä haaraa `main`-haaraan:

```bash
git diff main...HEAD
```

Näytä vain muuttuneiden tiedostojen nimet:

```bash
git diff --name-only main...HEAD
```

Näytä muutosten määrä:

```bash
git diff --stat main...HEAD
```

## 22. Yksittäisen commitin siirtäminen toiseen haaraan

```bash
git cherry-pick a1b2c3d
```

Komento ottaa valitun commitin muutokset ja tekee niistä uuden commitin nykyiseen haaraan.

Keskeytä konfliktitilanteessa:

```bash
git cherry-pick --abort
```

Jatka konfliktin ratkaisemisen jälkeen:

```bash
git add korjattu-tiedosto
git cherry-pick --continue
```

## 23. Rebase

Rebase siirtää haaran commitit toisen haaran päälle:

```bash
git switch feature/uusi-luku
git rebase main
```

Tulos näyttää historiassa siltä kuin ominaisuushaara olisi aloitettu uusimmasta `main`-versiosta.

Keskeytä:

```bash
git rebase --abort
```

Jatka konfliktin ratkaisemisen jälkeen:

```bash
git add korjattu-tiedosto
git rebase --continue
```

Rebase kirjoittaa commit-historiaa uudelleen. Sitä ei yleensä pidä tehdä jaetuille commiteille, joita muut ovat jo hakeneet.

## 24. Pakotettu push

Jos paikallista historiaa on tarkoituksella kirjoitettu uudelleen:

```bash
git push --force-with-lease
```

Käytä mieluummin `--force-with-lease`-valitsinta kuin raakaa `--force`-valitsinta. Se kieltäytyy ylikirjoittamasta etähaaraa, jos joku muu on ehtinyt päivittää sitä sen jälkeen, kun viimeksi hait tiedot.

Tavalliseen päivittäiseen työhön pakotettua pushia ei yleensä tarvita.

## 25. Tiedoston tekijähistorian tutkiminen

```bash
git blame README.md
```

Komento näyttää, missä commitissa ja kenen toimesta kukin rivi on viimeksi muuttunut.

Rajaa riveihin 20–40:

```bash
git blame -L 20,40 README.md
```

Tarkastele löytynyttä commitia:

```bash
git show a1b2c3d
```

`blame` on nimestään huolimatta ennen kaikkea tutkimustyökalu: sillä selvitetään rivin historia ja muutoksen asiayhteys.

## 26. Hakeminen historiasta

Etsi commit-viesteistä:

```bash
git log --grep="turvallisuus"
```

Etsi commit, jossa tietty merkkijono lisättiin tai poistettiin:

```bash
git log -S "MAX_ANODE_VOLTAGE" -p
```

Etsi muutoksia, joiden diff vastaa säännöllistä lauseketta:

```bash
git log -G "voltage.*limit" -p
```

## 27. Tyypillinen turvallinen päivittäinen työnkulku

### Työn alussa

```bash
git status
git branch --show-current
git fetch origin
```

Tarvittaessa tarkista etähaaran uudet commitit:

```bash
git log --oneline HEAD..origin/main
```

### Työn aikana

```bash
git status --short
git diff
```

### Ennen committia

```bash
git status
git diff
git add tarkka/tiedosto1.md tarkka/tiedosto2.json
git diff --staged
```

### Tee commit

```bash
git commit -m "feat: add output-stage design example"
```

### Tarkista lopputulos

```bash
git status
git log -1 --stat
```

### Lähetä muutokset

```bash
git push
```

## 28. Esimerkki yhden täsmällisen commitin tekemisestä

Oletetaan, että olet lisännyt uuden luvun ja päivittänyt kaksi manifestia.

Tarkista muutokset:

```bash
git status --short
git diff -- manuscript/CH-056.md
git diff -- manifests/chapters.json
git diff -- manifests/equations.json
```

Lisää vain kyseiset tiedostot:

```bash
git add \
  manuscript/CH-056.md \
  manifests/chapters.json \
  manifests/equations.json
```

Tarkista staging-alue:

```bash
git diff --staged
```

Tee commit:

```bash
git commit -m "feat(ch056): add small-signal tube reference"
```

Tarkista:

```bash
git status
git show --stat --oneline HEAD
```

Tämä pitää commitin rajattuna yhteen loogiseen kokonaisuuteen.

## 29. Hyvä commit-käytäntö

Hyvä commit on:

- rajattu yhteen loogiseen muutokseen
- riittävän pieni tarkistettavaksi
- itsenäisesti ymmärrettävä
- mielellään rakennettava ja testit läpäisevä
- kuvattu selkeällä commit-viestillä

Vältä committeja, joissa on sekalaisesti esimerkiksi:

- uuden ominaisuuden toteutus
- suuri muotoilumuutos
- satunnaisia korjauksia
- generoituja tiedostoja
- toiseen projektiin kuuluvaa keskeneräistä työtä

Jos muutoksia on paljon, käytä:

```bash
git add -p
```

ja tee useita täsmällisiä committeja.

## 30. Vaaralliset komennot

Seuraavat komennot eivät ole itsessään vääriä, mutta ne voivat poistaa tai ylikirjoittaa työtä:

```bash
git reset --hard
git clean -fd
git branch -D
git push --force
git restore .
```

Ennen niiden käyttöä tarkista vähintään:

```bash
git status
git diff
git log --oneline -10
```

Tarvittaessa tee turvahaara:

```bash
git branch backup-before-reset
```

Tai tallenna keskeneräinen työ:

```bash
git stash push -u -m "Turvakopio ennen operaatiota"
```

## 31. Hyödylliset aliakset

Voit tehdä pitkille komennoille lyhyitä nimiä:

```bash
git config --global alias.st status
git config --global alias.co switch
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.lg "log --oneline --graph --decorate --all"
```

Tämän jälkeen:

```bash
git st
git lg
```

Aliakset ovat henkilökohtaisia eivätkä muuta repositorion sisältöä.

## 32. Pikamuistilista

```bash
# Tila
git status
git status --short

# Muutokset
git diff
git diff --staged

# Valitse muutokset
git add tiedosto
git add -p

# Commit
git commit -m "selkeä viesti"

# Historia
git log --oneline --graph --decorate --all
git show HEAD

# Haarat
git switch -c uusi-haara
git switch main
git branch

# Etärepositorio
git fetch origin
git pull
git push
git push -u origin uusi-haara

# Peruuttaminen
git restore tiedosto
git restore --staged tiedosto
git revert commit-tunniste

# Pelastaminen
git reflog
git stash push -u -m "Keskeneräinen työ"
```

## 33. Suositeltu perussääntö

Ennen jokaista commitia:

```bash
git status
git diff
git add täsmällisesti-nimetyt-tiedostot
git diff --staged
git commit -m "kuvaava viesti"
```

Ennen jokaista riskialtista komentoa:

```bash
git status
git diff
git log --oneline -10
```

Gitissä suurin osa virheistä on korjattavissa, kun muutoksia ei poisteta harkitsemattomasti ja commitit pidetään pieninä, täsmällisinä ja selkeästi nimettyinä.

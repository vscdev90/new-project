# Geautomatiseerde developer-workflow

Dit project gebruikt een pipeline van geautomatiseerde Claude-agents, gestuurd
via geplande Routines.

## Dagelijks — elke dag 09:00 (Europe/Amsterdam)
Een verse sessie start en doorloopt:

1. **Developer-rol** — leest `TASKS.md`, pakt de eerst openstaande taak onder
   **Open**, maakt een nieuwe branch en implementeert de taak.
2. **Review-rol** — een aparte subagent reviewt de diff (correctheid,
   simplificatie, veiligheid) en verwerkt relevante bevindingen.
3. **Test-rol** — een aparte subagent draait de testsuite (en voegt tests toe
   waar zinnig) en lost falende tests op.
4. De branch wordt gepusht en er wordt een pull request geopend tegen de
   default branch. De taak verhuist in `TASKS.md` naar **In review**.
   Er wordt **niet automatisch gemerged**.

Geen openstaande taken in `TASKS.md`? Dan doet de agent die dag niets.

## Wekelijks — elke vrijdag 18:00 (Europe/Amsterdam)
Een planningsoverleg in deze sessie:

- Samenvatting van de afgelopen week (afgeronde taken, openstaande PR's).
- Ruimte om eisen, wensen en nieuwe taken te bespreken; `TASKS.md` wordt
  bijgewerkt.
- Openstaande pull requests worden een voor een besproken. Alleen na
  expliciete goedkeuring in dat gesprek wordt een PR gemerged en de taak naar
  **Klaar** verplaatst.

## Let op
- De tech-stack van dit project is nog niet definitief gekozen — dit komt
  terug bij het eerste vrijdagoverleg.
- De cron-tijden staan in UTC en zijn ingesteld op basis van de huidige
  zomertijd (CEST, UTC+2). Rond de klokwissel in maart/oktober kan het
  daadwerkelijke lokale tijdstip een uur verschuiven totdat dit handmatig
  wordt bijgesteld.

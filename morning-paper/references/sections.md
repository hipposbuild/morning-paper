# Sections

Each section maps to a `SECTION:name` block in `assets/template.html`. Only build the ones listed in
the reader's `config.md`.

## masthead (optional)
Big paper-name title plus a thin strip: left ear (their business or tagline), center "<City> Edition"
(or the city they are travelling in that day, if the calendar shows it), right today's weather for that
city (high / low, one word) from web search. Many people turn it off to save space; then the page
starts with the date line.

## Date line (always on)
Full date, "Vol. I · No. N" (N = number of PDFs in `editions/` + 1), and "Printed H:MM AM".

## lead: Today's Lead
Headline = the day in one line (the 1 or 2 things that matter most). Deck = one italic sentence on the
shape of the day plus anything urgent in the inbox. Write it last, after gathering everything else.

## schedule: Suggested Schedule
Today's timeline from the calendars in `config.md`. ■ for events already on the calendar, □ (italic)
for suggestions they can tick. Add the daily routines they asked for (for example a workout or writing
block) in free gaps at their preferred time, and to-dos worth a focus block.
- If a work calendar only exposes "Busy" blocks, collapse the workday into one line plus a meeting count,
  listing only meetings that constrain them (early, late, or long).
- If a busy block has the same start and end as one of their own events, it is an echo of that event:
  drop the duplicate.
- Skip all-day "Free" entries.

## countdown: Countdown box
Big number = days until the next event on their list. Under it, the next 2 or 3 events with dates.
Drop events once they pass. If `config.md` says to, also scan the calendar for new big events in the
next 60 days. If nothing is left, say so and suggest they add a new countdown.

## inbox: Inbox Overnight
Email since the last edition, 3 to 6 lines, each tagged REPLY or FYI. Lead with the senders `config.md`
marks as important. Skip newsletters, promos and receipts, and count them in one FYI line. Keep each line
short enough to fit on one line in the narrow column (about 35 characters).

## todos: To-Do Desk
One suggested move per project or area from their to-do source, with priority and due date underneath
and a blank write-back line. Pick the most important open item per group: highest priority first, then
earliest due date, then items owned by the reader. Overdue items say "(overdue)". If a group has
nothing open, suggest one sensible next step and mark it "(suggested)". Up to 6 groups fit.

## news: News (and business)
Up to 4 stories from the last 24 to 48 hours, one per topic in `config.md`. Check their preferred
sources first; many are paywalled, so use only what is publicly visible (headline, summary, free
posts), credit the source, and never invent what is behind a paywall. Otherwise use web search and
reputable outlets. Headline plus one or two short lines: what happened, then why it matters to the
reader. If a topic has nothing real, run fewer stories.

**business** (optional, inside the news box): 3 short items on deals, M&A, earnings, funding and
pricing in the reader's industry. Headline plus one line each. Remove the block if not chosen and let
the news grid use two columns.

## ideas: Ideas File
3 items from their ideas tracker (writing ideas, content ideas, anything), in progress first. Rotate
so the same 3 do not appear two days running (check yesterday's edition). If the tracker has 3 or
fewer, say so in the build summary so they know to add more.

## writein: Write-in box
A dashed box with blank lines. Weekdays: "Letters to the Editor" (anything on their mind). Mondays:
"This Week" brain dump (one line per thing on their plate this week). Everything written here is
handled by the Reply mode.

## people: People Worth Meeting
3 real people found by web search, each with name, role, one line on why they fit, which of the
reader's goals they serve, and the source site in small type. Rotate across the reader's goals.
- Only people with a verifiable public profile. Never compile personal contact details (no home
  addresses, phone numbers or family). The reader finds contact details themselves.
- Never repeat anyone in `people-log.md`, and append each day's 3 with the date and source URL.
- Respect any values in `config.md` (for example, types of investors to avoid).

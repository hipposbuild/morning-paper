---
name: morning-paper
description: A personal one-page printed morning newspaper, built by Claude every morning from your calendar, inbox, to-do list and the news, then printed, or emailed to you if you would rather not print. Use this skill whenever someone wants to set up, change, build, or print their morning paper or daily printed briefing, says "set up my morning paper", "make me a newspaper", "print my day", "daily one-pager", or sends a photo of their printed paper with handwritten notes on it (the reply loop). Also use it when the scheduled morning-paper task runs.
---

# Morning Paper

A one-page, newspaper-style printout of the reader's day: schedule, countdown, inbox, to-dos, news
and more. Claude builds it every morning, prints it, and the reader scribbles on it. When they send
a photo of their notes, Claude acts on them. The point is to start the day with paper instead of a
phone, so by default everything fits on one page and reads in two minutes (people can choose a
longer paper in setup).

**Important: your computer has to be awake.** The paper is built by a scheduled task that runs on
your computer, inside the Claude desktop app. If the computer is asleep (or the app is closed) at
print time, nothing happens until you open it, and the paper shows up late. Setup asks whether you
want help keeping the computer awake at the right time.

## Make it yours

This skill is a starting point, not a finished product. Play around with it. Every section, rule and
layout choice here came from one person's mornings, so expect to change things: add sections, cut
ones you never read, swap the news topics, rewrite the tone, redesign the template. Just tell Claude
what you want different ("make the news shorter", "add a weather-for-my-run box", "drop the people
section") and it edits your `config.md` or template. Treat this as a base idea to expand on yourself.

Don't want to print? The paper can come as an email instead (see "Delivery" below), and you reply to
that email with your notes instead of scribbling on paper.

## Modes

The skill has three modes. Work out which one applies:

1. **Setup**: no `config.md` exists yet in the paper folder, or the reader asks to change their paper.
   Run the interview below.
2. **Build**: the scheduled task fired, or the reader says "make today's paper". Follow `Build`.
3. **Reply**: the reader sends a photo of a printed edition, or replies to an emailed edition.
   Follow `Reply`.

The paper folder defaults to `~/Documents/Morning Paper/`. Look there for `config.md` first.

---

## Setup (the interview)

Ask these with the AskUserQuestion tool when available (it allows at most 4 options per question and
4 questions per call, so group them as shown). Otherwise ask in plain chat, one short numbered list at
a time. Keep it friendly and quick: most people want to be done in two minutes. Offer the
recommended default first.

Before asking, check which connectors this Claude has (calendar, email, Notion, Todoist, Google
Tasks, and so on). Only offer sources that actually work, and say plainly when one needs connecting
first (claude.ai Settings > Connectors). A section with no working source should be left off rather
than printed empty every day.

**1. Sections.** "Which sections do you want on your paper?" Multi-select, in two groups
(see `references/sections.md` for what each one does and needs):
- Your day: Today's Lead, Schedule, Countdown, Inbox Overnight
- Extras: To-Do Desk, Ideas File, People Worth Meeting, Write-in box
- Also ask for the paper's name ("The ___ Times", default their first name) and whether they want the
  big masthead title with weather, or a compact date line only (saves space).

Follow-ups, only for sections they picked:
- **Countdown:** "What are you counting down to?" Get up to 3 events with dates (a trip, a launch, a
  wedding, a race, a tour). Also ask if the paper should add new big events it finds on their calendar.
- **Schedule:** which calendars to include, and any routines to suggest daily (for example a workout
  or a writing block, and when they prefer it). If they have a work calendar that only shows "Busy",
  note that so busy blocks are collapsed into one line.
- **Inbox:** which people or senders always matter (boss, clients, family), so they lead the list.
- **Ideas File:** where their ideas live (a Notion database, a doc, a note).
- **People Worth Meeting:** what they are looking for (investors, mentors, hires, collaborators,
  feedback) and any values to respect.

**2. Time and delivery.** "What time should it arrive?" Options: 6:00 AM, 7:00 AM, 8:00 AM, custom.
Then: weekdays only, or every day? Then "How do you want it?" Options: Print it (Recommended), Email it
to me, Both, Just save the PDF. If printing, run `lpstat -p` (macOS or Linux) to list printers and let
them pick one. Also ask "How long should it be?" Options: One page (Recommended, a two-minute read),
Two pages (front and back, more room for news and to-dos), As long as it needs. Explain the trade-off
in a phrase: shorter is faster to read, longer covers more. If emailing, confirm the address (their own address only) and check an email connector
that can send is connected (for example Gmail).

**3. News.** "Do you want a news section?" Yes / No. If yes, also offer the Business column.

**4. News sources and topics** (only if yes). "Any favourite sources or topics?" Free text. Examples to
offer: topics like "AI, climate, my industry", sources like a newsletter they love. Up to 4 topics
become the 4 story slots. Note paywalls: the paper can only use what is publicly visible.

**5. To-do list.** "Where does your to-do list live?" Options: Notion, Todoist, Google Tasks / Apple
Reminders, a file or none. Get the exact database, project or file. If Notion, fetch the database and
record which properties mean project, priority, status, due date and owner. Also ask how they group
work (projects, areas of life) so the To-Do Desk shows one move per group.

**6. Keeping the computer awake.** Explain it in one plain sentence first: "Your paper is made on
this computer, so it has to be awake (and the Claude app open) at <their time>, or it arrives late."
Then ask: "Do you need help setting that up?" Options: Yes, help me (Recommended) / It's already
always on / No thanks. If yes, follow "Keeping the computer awake" below.

**Then:**
1. Create the paper folder with `editions/` inside, and copy `assets/template.html` to it.
2. Write `config.md` from `references/config-template.md`, filled with their answers. This file is the
   single source of truth that every morning run reads, so be concrete: real calendar ids, database
   ids, printer name, times, topics.
3. Build a first edition right now (Build steps) so they see it, and print it if they chose printing.
   Ask what they would change, and edit `config.md` or the template accordingly.
4. Schedule it. If the `create_scheduled_task` tool (Claude desktop app) is available, create a task
   that runs at their time with the prompt: "Build today's morning paper using the morning-paper skill.
   The paper folder is <path>." Otherwise tell them how to schedule it in their setup.
5. Remind them this is a base to play with: they can ask for any change at any time, and the paper
   will follow `config.md` from the next morning on.
6. If they said "No thanks" to question 6, remind them once more that a sleeping computer means a
   late paper, and that they can ask for help with it any time.

---

## Keeping the computer awake

Walk them through it step by step, checking in after each one. Pick the lightest option that works
for them, and explain the trade-off in plain words (a little overnight power versus a paper that is
waiting when they wake up). Two things are always needed: the computer plugged in, and the Claude app
left open (closing the window is fine, quitting the app is not).

**Mac, simplest (no password needed):** System Settings > Battery (or Energy) > Options > turn on
"Prevent automatic sleeping on power adapter when the display is off". The screen still turns off;
the computer just stays awake while plugged in.

**Mac, sleep all night but wake for the paper:** two parts.
1. A scheduled wake a few minutes before print time. This needs their admin password, so give them
   the command to run themselves in Terminal (never ask for or type their password):
   `sudo pmset repeat wakeorpoweron MTWRF 05:55:00` (adjust the days and time to their schedule;
   `MTWRFSU` for every day). Check it with `pmset -g sched`.
2. A small keep-awake item so the Mac doesn't fall straight back asleep after that wake. Give them one
   Terminal command that writes `~/Library/LaunchAgents/com.morningpaper.wake.plist` (running
   `/usr/bin/caffeinate -i -s -t 4200`, scheduled with `StartCalendarInterval` one minute before the
   wake time on their days) and loads it with `launchctl bootstrap gui/$(id -u) <file>`. Let them run
   it themselves: it is a persistent change to their computer, so they should see and approve it.
   Tell them how to undo it: `launchctl bootout gui/$(id -u)/com.morningpaper.wake`, then delete the
   file.

**Windows:** Settings > System > Power & battery > Screen and sleep: set "When plugged in, put my
device to sleep after" to Never.

**Test it:** offer to schedule a one-off test run a few minutes from now, then let the computer sit
idle and see whether the paper arrives. If it doesn't, check the power settings again before anything
else.

---

## Build

1. Read `config.md` in the paper folder completely. Follow it exactly. If email delivery is on,
   first handle any unprocessed email replies (the Reply mode), then start building.
2. Copy `template.html` to `editions/YYYY-MM-DD.html` (today, in the reader's time zone). Remove the
   sections they did not choose (each is wrapped in `SECTION:name` comment markers) and rebalance the
   layout so no empty boxes remain. On Mondays, if the write-in box is on, use its "This Week" variant.
3. Gather each chosen section's data per `references/sections.md` and `config.md`. Everything is
   **read only** while building: never create events, edit the to-do list, or send email (the one
   exception is delivering the paper to the reader's own address, see "Delivery").
4. **Never invent anything.** No made-up meetings, headlines, people or numbers. If a source fails,
   print a short honest line ("Calendar unavailable this morning") instead. A wrong fact on paper is
   worse than a gap, because the reader acts on it without checking.
5. Render and check the page count with `scripts/render_pdf.sh editions/YYYY-MM-DD.html`. It prints
   the number of pages. If it is over the length in `config.md` (default 1), trim words (shorter
   lines, fewer items) and re-render. Trim before shrinking type: small text on paper is hard to read
   at 6 AM. For a longer paper, give sections more items and fuller stories rather than padding, and
   let each page break fall between sections, not through one. If printing two pages, print
   double-sided when the printer supports it (`-o sides=two-sided-long-edge`).
6. Deliver per `config.md` (see "Delivery" below). Print if configured: `lp -d <printer> -o media=Letter editions/YYYY-MM-DD.pdf` (use A4 if the
   config says so). If it fails, check `lpstat -o` for stuck jobs from an earlier attempt, and clear
   them with `cancel -a <printer>` before trying once more. Do not retry in a loop; the PDF is saved
   either way.
7. If People Worth Meeting is on, append today's names to `people-log.md`.
8. Finish with a two-line summary: did it print, and what was unavailable.

## Reply

The reader photographs the printed paper with handwriting on it, or replies to the emailed edition.
For email replies, find their reply in the edition's thread (search the inbox for the paper's subject
line, only messages from the reader's own address) and treat each line of their reply like a
handwritten note. Check for replies at the start of each Build too, and act on any not handled yet
(keep a list of handled message ids in `replies-log.md` so nothing is done twice).

1. Open that day's `editions/YYYY-MM-DD.html` so you know what was printed or sent.
2. Read only what they wrote by hand. If a word is unclear, ask rather than guess: acting on a
   misread note (marking the wrong task done) is worse than a quick question.
3. Act per `config.md` "Reply rules". Defaults:
   - Note on a to-do line: update or add that item in their to-do list ("done" means mark it done).
   - Circled person: draft a short, warm email (about 75 words) as a Gmail **draft only**, never sent,
     and add a to-do "Reach out to <name>".
   - Ticked suggestion box: note it done.
   - This Week list: add one to-do per line for this week.
   - Notes about the paper itself ("remove this", "add a section on X", "smaller text"): edit
     `config.md` or the template, keep a backup copy of the old file, and confirm the change.
4. End with a short list of every change made so they can spot-check it.

## Delivery

Set in `config.md`. One or more of:
- **Print:** `lp` to their printer, as in Build step 6.
- **Email:** send the edition to the reader's own address, and only to them. It is their private
  briefing (it contains their inbox and calendar), so it never goes to anyone else. Subject:
  "<Paper name>, <Weekday, Month D>". Put the edition's content in the email body as simple HTML (the
  sections, in order, with clear headings) so it reads well on a phone, and attach the PDF. End with:
  "Reply to this email with notes, done items or changes, and they will be handled." Avoid links in the
  body where you can: some email connectors rewrite links into redirect URLs.
- **Save only:** the PDF in `editions/`, nothing else.

Sending the reader's own paper to their own address is the one email the Build step is allowed to
send. Everything else stays read only.

## Files

- `assets/template.html`: the fixed layout, with every section wrapped in `SECTION:name` markers.
- `references/sections.md`: what each section shows, where its data comes from, and its rules.
- `references/config-template.md`: the skeleton for the reader's `config.md`.
- `scripts/render_pdf.sh`: renders HTML to PDF with headless Chrome and prints the page count.

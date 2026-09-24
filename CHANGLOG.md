# Changelog Linny Notes Boilerplate

# 0.3.0
- add a searchable HTML **web-view** via the linny-web-theme Hugo module
  - `hugo-web.yaml` (web config, separate from the linny.vim indexer)
  - `start-web.sh` + `./RUNME.sh web` (fetch theme, fence CLI tables, `hugo server` on :9999)
  - `fence.py` (wrap box-drawing CLI output so it renders as a table)
  - `go.mod` / `go.sum` pin the theme module
  - see WEB-README.md
- sample note `first_note.md`: `tags` given a list value (`[note]`) so the web-view builds cleanly

# 0.2.0
- renamed carl to Linny Notes Boilerplate
- make compatible with Hugo versions higher then 0.123
- remove makefile and rakefile
- add RUNME.sh

# 0.1.0
- initial implentation of Linden Specification 0.2

#!/usr/bin/env python3
"""Wikkel contiguue runs van regels met box-drawing/block-tekens (U+2500-U+259F,
bv. CLI-output van `aws ec2 ... --output table`) in een ```text code-fence, zodat
ze als nette monospace-tabel renderen i.p.v. tot een kapotte paragraaf te plakken.

Idempotent per build (de checkout wordt telkens ge-reset). Draait op stdin->stdout,
per markdown-bestand. Torrlinny-repo blijft ongemoeid (gebeurt in de build-checkout).
"""
import sys
import re

BOX = re.compile(r"[─-▟]")  # box-drawing + block elements


def process(text):
    lines = text.split("\n")
    out, i, n = [], 0, len(lines)

    # Frontmatter (--- ... ---) ongemoeid laten.
    if lines and lines[0].strip() == "---":
        out.append(lines[0])
        i = 1
        while i < n and lines[i].strip() != "---":
            out.append(lines[i])
            i += 1
        if i < n:
            out.append(lines[i])
            i += 1

    infence = False
    while i < n:
        l = lines[i]
        if l.lstrip().startswith("```"):
            infence = not infence
            out.append(l)
            i += 1
            continue
        if not infence and BOX.search(l):
            run = []
            while i < n and BOX.search(lines[i]) and not lines[i].lstrip().startswith("```"):
                run.append(lines[i])
                i += 1
            out.append("```text {linenos=false}")
            out.extend(run)
            out.append("```")
            continue
        out.append(l)
        i += 1
    return "\n".join(out)


if __name__ == "__main__":
    sys.stdout.write(process(sys.stdin.read()))

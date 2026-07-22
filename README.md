# Curriculum Vitae — Brian Steven Bingham

Version-controlled LaTeX source for my CV. Compiles locally and on
[Overleaf](https://www.overleaf.com/) from the same files.

## Layout

```
main.tex              Preamble, header, and \input of each section
references.bib        All publications (BibTeX; rendered by biblatex/IEEE)
sections/
  personal.tex        Education, positions, honors and awards
  teaching.tex        Courses taught
  research.tex        Grants, publications (from .bib), expeditions
  service.tex         Professional service
cv/                   Original Word/PDF source (reference only)
```

## Building

Requires a TeX distribution with `biber` (TeX Live 2020+ / MacTeX).

```bash
latexmk -pdf main.tex      # runs pdflatex + biber as needed -> main.pdf
latexmk -C                 # clean build artifacts
```

The compiled `main.pdf` is intentionally **not** version-controlled (see `.gitignore`);
each build regenerates it. To version the PDF, delete the `main.pdf` line from `.gitignore`.

## Editing publications

Each entry in `references.bib` carries a `keywords` field that selects the CV section it
appears in: `journal`, `nontechnical`, `conference`, `presentation`, or `bookchapter`.
Publications are sorted newest-first automatically (`sorting=ydnt`) and numbered per
section — so adding a paper is just a new bib entry with the right keyword; no manual
renumbering or reordering.

## Syncing with Overleaf

The repository root holds `main.tex`, so the whole repo maps directly to an Overleaf
project. In the Overleaf project, set the **main document** to `main.tex`. Choose one:

1. **GitHub integration** — In Overleaf: *Menu → GitHub → Link to GitHub repository*.
   Push/pull from either side to sync. (Requires an Overleaf paid plan.)
2. **Git bridge** — Copy the project's Overleaf git URL (*Menu → Git*) and add it as a
   remote:
   ```bash
   git remote add overleaf <overleaf-git-url>
   git pull overleaf master   # first time
   git push overleaf main:master
   ```
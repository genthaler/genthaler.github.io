# genthaler.github.io

This repo is a rebuilt `elm-pages` v3 site driven by markdown content in `content/`.

## What it contains

- `/` renders `content/index.md`
- `/blog` renders `content/blog/index.md` plus a list of published posts
- `/blog/:slug` renders markdown files from `content/blog/`

The content loader supports both YAML-style and JSON-style frontmatter. Draft posts are excluded from the blog index and generated public post routes.

## Local development

Requirements:

- Node via `asdf` using `.tool-versions`
- `npm install`

Commands:

```sh
npm install
npm start
npm run build
npm run deploy
npm run format
npm run review
```

## Review

Recommended local review flow:

```sh
npm run format
npm run review
npm run build
```

## Deploy

Deploy the built site to the `gh-pages` branch of `genthaler/genthaler.github.io` with:

```sh
npm run deploy
```

That script runs `npm run build` first and then publishes `dist/` to the `gh-pages` branch.

It assumes you have push access to the GitHub repo and that GitHub Pages is configured to serve from the `gh-pages` branch.

## Notes

- This repo currently uses `elm-pages` `^3.3.0`.
- Some historical post image paths under `/images/article-covers/...` are referenced by content but are not restored in this reboot.
- For repository workflow and agent-specific guidance, see `AGENTS.md`.

# AGENTS

This file is for coding agents working in this repo.

## Scope

- Treat `content/` as the source of truth for site copy.
- Keep the site structure intentionally small: homepage, blog index, and blog post detail pages.
- Prefer extending the current content-driven approach in `src/Content.elm` instead of reintroducing starter/demo routes.

## Content rules

- Support mixed frontmatter formats already present in `content/`.
- Derive blog slugs from filenames, not titles.
- Do not publish drafts by accident. Draft posts should stay out of the blog index and generated public routes unless the user explicitly asks otherwise.
- Missing optional metadata or missing referenced images should degrade gracefully.

## Useful files

- `src/Content.elm`: content loading, normalization, markdown rendering, draft filtering
- `app/Route/Index.elm`: homepage
- `app/Route/Blog.elm`: blog index
- `app/Route/Blog/Slug_.elm`: blog post route
- `app/Shared.elm`: site shell

## Verification

- Use `npm start` for local dev.
- Use `npm run format` before review/build for Elm edits.
- Use `npm run review` as the lint/review step.
- Use `npm run build` for production verification.
- Use `npm run deploy` for the documented GitHub Pages publish flow.
- If Lamdera reports dependency/cache issues, document the exact command and failure rather than papering over it.

## Recommended Review Tools

- `npm run review`: repo-level static review via `elm-review`
- `npm run format`: formatting and low-noise diffs for Elm changes
- `rg`: fast text search for finding stale references, route wiring, and content usage

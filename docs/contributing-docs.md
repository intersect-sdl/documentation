---
title: Documentation Style Guide
---

## Overview

This guide defines conventions for writing and organizing documentation in the SDL project.

## Front Matter

Each Markdown file must start with:

```yaml
---
title: Page Title
---
```

## Headings

- The `title` field is the H1 heading.
- Start content headings at `##` (H2).
- Use `###` for subsections, and `####` for deeper levels.

## Table of Contents

- Include a TOC at the top of each document:

```markdown
## Table of Contents
- [Section 1](#section-1)
- [Section 2](#section-2)
```

## Cross-Links

- Use relative links for internal references:
  - `[Layer 2 Services](./layer2-services.md)`

## Diagrams

- Use Mermaid diagrams embedded in Markdown files.
- Store large diagrams as `.mmd` files for reuse.


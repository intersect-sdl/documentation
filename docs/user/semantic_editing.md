---
title: "Semantic Content Blocks"
description: "Learn how to create, edit, and annotate semantic blocks within the SDL platform."
author: "SDL Team"
date: "2025-06-25"
published: true
---

> **Disclaimer:** Many of the features described in this guide are still in planning or active development. Some functionality may not yet be available in your instance.

Semantic Content Blocks are the foundation of rich, interoperable knowledge creation in SDL. They allow users to compose documents and datasets using structured, typed blocks that are linked to ontologies and RDF data.

This guide explains how to work with semantic blocks, how to annotate them, and how they contribute to a machine-readable, knowledge-driven environment.

---

## What is a Semantic Block?

A semantic block is a modular unit of content that:

- Is typed using `rdfs:type` or a subclass from a known ontology
- Can include both human-readable and machine-readable components
- Stores data as RDF triples behind the scenes
- Is individually addressable and versioned

Examples include:

- Paragraphs of text with semantic annotations
- Data tables linked to measurement ontologies
- Provenance-aware workflow steps
- Embedded graphs or visualizations

---

## Creating a Semantic Block

To create a block:

1. Click the "+ Add Block" button at the insertion point
2. Select a block type (e.g., Text, Data, Note, Reference, Chart)
3. Enter content and optionally apply a semantic type or link

Each block will be stored with its type and optional context in the RDF graph for the page.

---

## Annotating Content

You can annotate content in two primary ways:

- **Inline Annotation**: Highlight text to link it to a URI or concept
- **Block Annotation**: Assign a semantic type or role to the entire block

Autocomplete and vocabulary suggestions are available during annotation. Blocks may also display embedded metadata (e.g., `dc:creator`, :rdfterm[prov:wasGeneratedBy]).

---

## Linking and Referencing

Semantic blocks can:

- Link to other pages, datasets, or concepts
- Be reused across documents
- Contain embedded references with citations

All links are tracked as RDF relations, supporting provenance and reasoning.

---

## Advanced Features

Planned features include:

- **SHACL-based validation** for block structure
- **Template-driven authoring** for repeatable scientific workflows
- **Context-sensitive autocomplete** for domain-specific vocabularies
- **SPARQL-powered live queries** embedded as semantic blocks

---

## Tips for Semantic Authoring

- Prefer linking to existing ontologies when possible
- Use meaningful types for blocks to support reuse and discovery
- Group related blocks using semantic sections
- Preview RDF output for complex documents to validate structure

---

Semantic content blocks turn SDL into more than a writing tool — they transform it into a semantic knowledge environment where every piece of content can be queried, shared, and reasoned over.

# Ontology-Driven Workspaces for Interactive Science

## Introduction

- Motivation
  : Scientists working in urgent and interactive HPC contexts face fragmented workflows, multiple tools, and disconnected data and documentation.
- Problem Statement
  : Existing environments lack a semantic, unified representation of research activities, outputs, and relationships, making it hard to integrate computational results, experimental data, and scholarly artifacts.
- Goal
  : Present an ontology-driven workspace concept that consolidates research tasks, resources, and outputs into a coherent interface.
- Contributions
  : 1. Ontological foundations using FRBR, SPAR, DoCO, and related models.
    1. Conceptual design of a workspace for scientists in HPC contexts.
    1. Examples of how such a workspace supports urgent and interactive computing.

## Background & Related Work

* Workspaces in Computational Science
  : Brief review of existing workspace concepts (e.g., JupyterLab, scientific portals, workflow managers) and their limitations in HPC contexts.

* Urgent & Interactive HPC
  : Requirements for rapid task switching, contextual awareness, and integrated resource access.

* Ontologies for Scientific Context
  : * FRBR (Functional Requirements for Bibliographic Records): Modeling entities as Works, Expressions, Manifestations, and Items.
    * SPAR Ontologies: For scholarly publishing, citations, and provenance (CiTO, FaBiO, etc.).
    * DoCO (Document Components Ontology): Structuring scientific documents and outputs.
    * Other relevant vocabularies (e.g., PROV-O for provenance, DCAT for datasets).

## Ontological Foundations for a Research Workspace

* Representation of Scientific Tasks
  : Linking computational, experimental, and analytical activities.
* FRBR in a Research Context
  : Distinguishing conceptual works (research questions, hypotheses) from expressions (datasets, results) and manifestations (formatted outputs).
* SPAR for Scholarly Communication
  : Tracking relationships between outputs, citations, and related works.
* DoCO for Structuring Outputs
  : Organizing figures, tables, datasets, and supplementary material.
* Provenance Integration
  : Using PROV-O to link tasks, data, and results over time.

## Conceptual Model of the Workspace

* Core Principles
  : * Single interface to integrate tasks, data, outputs, and communication.
    * Ontology-driven linking of entities for context-rich navigation.
* Key Components
  : * Task Panel
      : Ontologically linked activities (e.g., “run simulation,” “analyze dataset”).
    * Resource Browser
      : Datasets, workflows, publications, and notes organized via semantic relationships.
    * Output Viewer
      : Documents, plots, datasets structured according to DoCO.
    * Collaboration Layer
      : Linking people, roles, and contributions.
* HPC Integration Points:
  * Access to interactive HPC sessions.
  * Real-time monitoring and data capture.

## Use Cases in Urgent and Interactive HPC

* Urgent Response Scenario
  : Example of a domain (e.g., climate event modeling, epidemiology) where rapid task orchestration is essential.
* Interactive Experimentation
  : Using the workspace to iterate between computation and analysis, with all artifacts semantically linked.
* Collaborative Analysis
  : Teams navigating the same semantic workspace from different locations.

## Advantages of an Ontology-Driven Workspace

* Context Preservation
  : Tasks, data, and outputs always linked in their research context.
* Reduced Cognitive Load
  : Single entry point for all relevant activities and resources.
* Enhanced Discovery & Reuse
  : Rich metadata supports finding and reusing resources within and across projects.
* Alignment with FAIR Principles
  : Ontologies ensure findability, accessibility, interoperability, and reusability.

## Challenges & Future Work

* Adoption
  : Bridging semantic models with existing HPC workflows and user habits.
* Performance
  : Ensuring responsive interfaces in large-scale, data-intensive contexts.
* Standardization
  : Encouraging community consensus on ontology profiles for HPC workspaces.
* Integration with Workflow & Data Management Systems
  : Aligning with existing platforms while preserving ontology-driven design.

## Conclusion

* Summary of the ontology-driven workspace concept.
* Vision for unifying scientific activity, data, and outputs in urgent and interactive HPC.
* Call for collaboration on ontology profiles, tool integration, and prototype development.
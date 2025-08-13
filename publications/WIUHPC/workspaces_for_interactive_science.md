# Ontology-Driven Workspaces for Interactive Science

## Introduction

### Motivation

Across the research landscape, scientists face challenges interacting with increasingly complex and demanding research environments. Whether in high-energy physics, climate modeling, life sciences, or digital humanities, the research process has evolved into a complex interplay of domain expertise, computational resources, and data management practices. In today’s environment, a scientist is not only expected to master their field but also to navigate an ever-growing and fragmented ecosystem of domain specific tools, laboratory equipment, data platforms, and analysis environments, as well as data silos, and inconsistent data governance.

Poor metadata and documentation practices further limit reproducibility and collaboration (Birkbeck, 2022). Research shows that highly abstract instruments and disconnected workflows significantly increase cognitive load (Schreiber, 2024), while overreliance on AI tools can erode critical thinking via cognitive offloading (Gerlich, 2025). Complex, cross-domain contexts also challenge effective data governance—undermining data quality and trust—especially when multiple institutions or disciplines are involved (Galvin, 2025; Bozkurt, 2021; Bassi, 2023).

While these resources expand capabilities, they also introduce new burdens: siloed datasets scattered across multiple systems, fragmented workflows that require constant context switching, and documentation that is often missing, incomplete, or insufficient for reproducibility. In addition, inconsistent data governance and inadequate data management practices further exacerbate these issues, leading to unclear ownership, uncertain data quality, and challenges in meeting FAIR (Wilkinson et al., 2016) and CARE (Carroll et al., 2020) principles. This situation increases cognitive load, slows research progress, and hampers collaboration.

### Problem Statement

Without a unifying framework that connects tasks, data, outputs, and their relationships, researchers must invest significant time and effort just to keep their work organized and accessible. The absence of integrated, semantically rich workspaces results in:

* Data silos that are difficult to discover and integrate.
* Fragmented workflows spanning incompatible tools.
* Poorly linked or missing documentation.
* Reduced reproducibility and data reusability.

The workspace concept presented in this paper addresses these issues by providing a centralized, ontology-driven interface that aligns research activities, artifacts, and documentation within a coherent, navigable framework.

## Background & Related Work

### Workspaces in Computational Science

Existing workspace concepts such as JupyterLab, Observable Notebooks (Observable, 2024), electronic lab notebooks (ELNs), scientific portals, workflow management systems, and integrated platforms such as CyVerse.org (Merchant et al., 2016) have been discussed extensively in the literature on eScience, data‑intensive research, and cyberinfrastructure (Barga et al., 2011; Wilhelm et al., 2017). Each addresses facets of the broader workspace challenge.

**Interactive HPC gateways**. A substantial body of work evaluates interactive HPC access via web gateways. Milligan et al. compare Open OnDemand and JupyterHub as interactive gateways, surfacing trade‑offs in authentication, user experience, and integration with batch schedulers (Milligan et al., 2023). Earlier studies documented the emergence of Jupyter as a common technology platform for interactive services on supercomputers (Milligan, 2018) and described gateway patterns for deploying Jupyter/JupyterHub for HPC users (Milligan, 2017). At facility scale, NERSC reported an architecture for interactive supercomputing with Jupyter, demonstrating production usage and adoption patterns (Thomas et al., 2017). More recently, LUNARC Desktop illustrates a desktop‑like environment for interactive HPC sessions, emphasizing usability and remote visualization (Lindemann & Follin, 2024).

**Notebooks and ELNs**. Computational notebooks support literate, reproducible workflows and have been explored for multi‑paradigm modeling (Oakes et al., 2019). ELNs are widely used for documenting experiments, protocols, results, and associated metadata; design studies show how practices emerge in collaborative settings (Oleksik et al., 2014). ELNs range from lightweight apps to platforms with versioning, access control, and regulatory compliance; they improve reproducibility and collaboration but often remain siloed and lack semantic integration with HPC workflows (Rubacha et al., 2011; Quinnell et al., 2020).

However, despite these strengths, most current solutions exhibit limitations when applied to multidisciplinary research contexts—particularly in semantic interoperability, cross‑domain data integration, and maintaining provenance across heterogeneous, instrument‑to‑HPC workflows.

### Urgent & Interactive HPC

**Scope and definitions**. Urgent computing is commonly framed as time‑critical computation in response to real‑world events and deadlines (Leong & Kranzlmüller, 2015), with production implementations demonstrating on‑demand reservations, preemption, and priority routing on HPC systems (Yoshimoto et al., 2012). Complementing this, interactive supercomputing emphasizes human‑in‑the‑loop, low‑latency access to large‑scale resources for exploratory analysis and iterative development (Thomas et al., 2017; Milligan, 2017; Milligan, 2018; Milligan et al., 2023; Lindemann & Follin, 2024).

**State of the practice and emerging directions**. Recent surveys synthesize challenges and opportunities in *Interactive and Urgent HPC*, including scheduling, data movement, provenance, and usability (Reuther et al., 2024), alongside a community draft capturing current practices and gaps (Reuther et al., 2023). Brown et al. analyze how interactive supercomputing supports urgent decision‑making, highlighting requirements for rapid model updates and visualization (Brown et al., 2020).

**Experimental, human‑in‑the‑loop workflows**. Building on these foundations, recent work extends urgent & interactive HPC beyond traditional forecasting and disaster response into experimental and iterative scientific workflows (Engelmann et al., 2022; Engelmann et al., 2023). In these settings, researchers use live computational output to steer experiments—adjusting parameters, refining models, or triggering new data acquisition. This tight coupling of instruments, data assimilation, HPC simulation, and visualization enables adaptive experimentation and integrated computational/experimental campaigns, often spanning distributed facilities and requiring continuous provenance and policy‑aware resource coordination.

### Ontologies for Scientific Context

Discussion of relevant ontologies that form the foundation of an ontology-driven workspace:

* FRBR (Functional Requirements for Bibliographic Records): modeling entities as Works, Expressions, Manifestations, and Items.
* SPAR Ontologies: covering scholarly publishing, citation relationships, and bibliographic metadata.
* DoCO (Document Components Ontology): describing the structural elements of scholarly works.
* PROV-O: enabling detailed provenance tracking of data and processes.
* DCAT: supporting standardized dataset descriptions for discovery and integration.

These ontologies provide the semantic backbone for linking activities, resources, and outputs into a unified, navigable research environment.

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
# Ontology-Driven Research Workspaces for Interactive and Urgent HPC

## Introduction

### Motivation

Across the research landscape, scientists face challenges interacting with increasingly complex and demanding research environments.
Whether in high-energy physics, climate modeling, life sciences, or digital humanities, the research process has evolved significantly.
Today it is a complex interplay of domain expertise, computational resources, and data management practices.
In today’s environment, a scientist is not only expected to master their field but also to navigate an ever-growing and fragmented ecosystem of domain-specific tools, laboratory equipment, data platforms, and analysis environments, data silos, and inconsistent data governance.

While these resources expand capabilities, they also introduce new burdens: siloed datasets scattered across multiple systems, fragmented workflows that require constant context switching, and documentation that is often missing, incomplete, or insufficient for reproducibility.
In addition, inconsistent data governance and inadequate data management practices further exacerbate these issues, leading to unclear ownership, uncertain data quality, and challenges in meeting FAIR (Wilkinson et al., 2016) and CARE (Carroll et al., 2020) principles.
This situation increases cognitive load, slows research progress, and hampers collaboration.

Poor metadata and documentation practices further limit reproducibility and collaboration (Birkbeck, 2022).
Research shows that highly abstract instruments and disconnected workflows significantly increase cognitive load (Schreiber, 2024), while overreliance on AI tools can erode critical thinking via cognitive offloading (Gerlich, 2025).
Complex, cross-domain contexts also challenge effective data governance—undermining data quality and trust—especially when multiple institutions or disciplines are involved (Galvin, 2025; Bozkurt, 2021; Bassi, 2023).

### Problem Statement

Without a unifying framework linking tasks, data, outputs, and their relationships, researchers must invest significant time and effort just to keep their work organized and accessible.
The absence of integrated, semantically rich workspaces results in:

* Data silos that are difficult to discover and integrate.
* Fragmented workflows spanning incompatible tools.
* Poorly linked or missing documentation.
* Reduced reproducibility and data reusability.

The workspace concept presented in this paper addresses these issues by providing a centralized, ontology-driven interface that aligns research activities, artifacts, and documentation within a coherent, navigable framework.

## Background & Related Work

### Workspaces in Computational Science

Existing workspace concepts such as JupyterLab, Observable Notebooks (Observable, 2024), electronic lab notebooks (ELNs), scientific portals, workflow management systems, and integrated platforms such as CyVerse.org (Swetnam et al., 2024) have been discussed extensively in the literature on eScience, data‑intensive research, and cyberinfrastructure (Barga et al., 2011).
Each addresses facets of the broader workspace challenge.

A substantial body of work evaluates interactive HPC access via web gateways.
Milligan et al. compare Open OnDemand and JupyterHub as interactive gateways, surfacing trade‑offs in authentication, user experience, and integration with batch schedulers (Milligan et al., 2023).
Earlier studies documented the emergence of Jupyter as a common technology platform for interactive services on supercomputers (Milligan, 2018) and described gateway patterns for deploying Jupyter/JupyterHub for HPC users (Milligan, 2017).
At facility scale, NERSC reported an architecture for interactive supercomputing with Jupyter, demonstrating production usage and adoption patterns (Thomas et al., 2017).
More recently, LUNARC Desktop illustrates a desktop‑like environment for interactive HPC sessions, emphasizing usability and remote visualization (Lindemann & Follin, 2024).

Computational notebooks support literate, reproducible workflows and have been explored for multi‑paradigm modeling (Oakes et al., 2019).
ELNs are widely used for documenting experiments, protocols, results, and associated metadata; design studies show how practices emerge in collaborative settings (Oleksik et al., 2014).
ELNs range from lightweight apps to platforms with versioning, access control, and regulatory compliance; they improve reproducibility and collaboration but often remain siloed and lack semantic integration with HPC workflows.

However, despite their strengths, most  solutions exhibit limitations when applied to multidisciplinary research contexts—particularly in semantic interoperability, cross‑domain data integration, and maintaining provenance across heterogeneous, instrument‑to‑HPC workflows.

### Urgent & Interactive HPC

Urgent and interactive HPC combines time‑critical scheduling with human‑in‑the‑loop steering of simulations, analytics, and experiments.
Beyond traditional urgent domains like severe weather forecasting and disaster response (Yoshimoto et al., 2012; Brown et al., 2020; Leong & Kranzlmüller, 2015), recent work broadens the scope to include real‑time scientific experiments, iterative design workflows, and lab‑/field‑integrated computing where researchers dynamically adjust parameters, models, or acquisition strategies based on live data (Reuther et al., 2023; Reuther et al., 2024; Engelmann et al., 2022; Engelmann et al., 2023).

Practically, this interactivity is enabled by gateway patterns that lower access friction and shorten feedback loops—e.g., JupyterHub and *Open OnDemand for authenticated, browser‑based interactive sessions on production systems (Thomas et al., 2017; Milligan, 2017; Milligan, 2018; Milligan et al., 2023).
Emerging deployments (e.g., LUNARC Desktop Environment) integrate remote desktops, visualization, and storage staging to support responsive steering at scale (Lindemann & Follin, 2024).
Across these efforts, common requirements recur: (i) low‑latency access (preemption/advance reservations), (ii) session persistence for iterative analytics, (iii) live provenance capture, (iv) tight coupling to instruments and data services, and (v) usable interfaces that reduce cognitive load for domain scientists (Arneson et al., 2025).

### Implications for ontology‑driven workspaces

An ontology‑driven workspace can (1) expose human‑in‑the‑loop controls as first‑class activities with provenance, (2) link experiments, simulations, and artifacts across tools, and (3) encode design‑of‑experiments decisions alongside notebook/gateway sessions for replayability and reuse.
This directly addresses gaps identified in production urgent/interactive deployments—particularly semantic context preservation across heterogeneous tools and teams (Oakes et al., 2019; Oleksik et al., 2014).

## Related workspace & gateway literature (integrations)

* Gateways for interactive HPC. Headless, web‑based access via JupyterHub/Open OnDemand reduces queue friction and supports iterative steering (Thomas et al., 2017; Milligan, 2017; Milligan, 2018; Milligan et al., 2023; Lindemann & Follin, 2024).
* Urgent computing on production systems. Operational patterns for preemption, priority, and on‑demand provisioning (Yoshimoto et al., 2012; Leong & Kranzlmüller, 2015).
* State of practice & research agenda. Community syntheses calling for better interactivity, semantics, and usability (Reuther et al., 2023; Reuther et al., 2024).
* Usability & design. User‑centered methods measurably improve scientific software reproducibility and sustainability—highly relevant for workspace UX (Arneson et al., 2025).
* Notebooks & ELNs. Computational notebooks as integration surfaces for modeling (Oakes et al., 2019) and ELN design practices for collaborative documentation and context capture (Oleksik et al., 2014).

### Ontologies for Scientific Context

Relevant ontologies form the foundation of an ontology-driven workspace:

* FRBR (Functional Requirements for Bibliographic Records): modeling entities as Works, Expressions, Manifestations, and Items.
* SPAR Ontologies: covering scholarly publishing, citation relationships, and bibliographic metadata.
* DoCO (Document Components Ontology): describing the structural elements of scholarly works.
* PROV-O: enabling detailed provenance tracking of data and processes.
* DCAT: supporting standardized dataset descriptions for discovery and integration.

These ontologies provide the semantic backbone for linking activities, resources, and outputs into a unified, navigable research environment.

## Ontological Foundations for a Research Workspace

A research workspace grounded in formal ontologies enables the explicit representation of activities, resources, and relationships across the scientific process.
By leveraging established standards, such a workspace can provide semantic interoperability between heterogeneous tools, disciplines, and data systems, while ensuring that artifacts remain discoverable, reusable, and contextually linked.

### Representation of Scientific Tasks

Capturing the spectrum of research activities (computational, experimental, and analytica) requires an ontology capable of modeling diverse processes while maintaining a consistent conceptual framework.
Existing vocabularies such as the W3C Provenance Ontology (PROV-O) and the Semantic Sensor Network Ontology (SSN/SOSA) allow for fine-grained descriptions of experimental deployments, simulation runs, and analytical workflows.
In an ontology-driven workspace, each task can be linked to its inputs, outputs, agents, and temporal context, enabling precise navigation between related activities and artifacts (Moreau & Missier, 2013; Compton et al., 2012).

### FRBR in a Research Context

The Functional Requirements for Bibliographic Records (FRBR) model, originally developed for library science (IFLA, 2009), distinguishes between:

* Work – the abstract intellectual creation (e.g., a research question or hypothesis),
* Expression – the realization of that work (e.g., a dataset, analysis results), and
* Manifestation – the specific format or version (e.g., CSV file, journal PDF).

Applying FRBR in a research context allows workspaces to manage the lineage of scientific ideas from conception through dissemination, preserving relationships between conceptual intent, intermediate products, and final deliverables.

### SPAR for Scholarly Communication

The Semantic Publishing and Referencing (SPAR) Ontologies (Peroni et al., 2017) provide a family of vocabularies for modeling scholarly content, its structure, and its relationships. In a research workspace, SPAR can:

* Link outputs to the works they cite (CiTO)
* Describe bibliographic metadata (FaBiO)
* Model authorship, contributions, and affiliations

This facilitates tracking the scholarly impact of workspace-generated outputs and ensuring their integration into the broader ecosystem of scientific communication.

### DoCO for Structuring Outputs

The Document Components Ontology (DoCO) (Constantin et al., 2016) offers a formal vocabulary for structuring documents into constituent parts such as sections, tables, figures, captions, and supplementary materials.
Embedding DoCO within a workspace ensures that generated reports, manuscripts, and presentations can be navigated semantically, with each component linked to its underlying data and provenance.

### Provenance Integration

Provenance information is critical for reproducibility and trust in scientific results.
The PROV-O ontology (Moreau & Missier, 2013) provides a flexible framework for linking tasks, data, and results over time, capturing who performed an activity, when, and using what inputs.
Within a research workspace, PROV-O can unify provenance from disparate tools—workflow systems, ELNs, computational notebooks—into a coherent graph, enabling verification, auditing, and reuse.

## Conceptual Model of the Workspace

### Core Principles

The workspace is conceived as a single interface where all research activities, resources, and outputs are accessible without the cognitive burden of switching between multiple disconnected tools.
By bringing together computational, experimental, and analytical elements, the workspace enables researchers to remain focused on the science rather than on the mechanics of their environment.

A defining feature of this model is ontology-driven linking of entities.
Tasks, datasets, publications, and collaborators are connected using formal vocabularies, allowing context-rich navigation across the research graph.
A dataset can be explored in terms of its provenance, the task that produced it, the workflows that consume it, and the publications that cite it—without manual cross-referencing.

### Key Components

* Task Panel
  : Presents a structured view of current and past activities—such as “run simulation,” “process dataset,” or “analyze results”—with each activity ontologically linked to its associated inputs, outputs, and responsible agents.
    Researchers can navigate from a running task to its related datasets, scripts, and derived results with minimal friction.
* Resource Browser
  : Aggregates datasets, workflows, publications, notes, and other artifacts into a single view, organized by semantic relationships rather than by file system hierarchy.
    Resources can be filtered by type, project, provenance, or conceptual linkage, enabling cross-domain discovery and reuse.
* Output Viewer
  : Displays documents, figures, tables, plots, datasets, and supplementary material in a structured form based on the Document Components Ontology (DoCO).
    This ensures that visual and textual components are linked to their source data and relevant provenance records, supporting traceability and reproducibility.
* Collaboration Layer
  ; Manages the human dimension of research by linking people, roles, and contributions.
    Ontologies for scholarly communication (e.g., SPAR, PROV-O) can represent authorship, data stewardship, and task ownership, enabling transparent attribution and better coordination across teams.

### HPC Integration Points

* Access to Interactive HPC Sessions
  : The workspace can launch and manage interactive sessions on HPC systems via secure gateways (e.g., JupyterHub, Open OnDemand).
    These sessions are linked to their originating tasks and datasets, ensuring that computational context is preserved.
* Real-Time Monitoring and Data Capture
  : Integration with HPC job schedulers and instrumentation allows researchers to monitor simulation or experiment progress live, adjust parameters on the fly, and capture intermediate results with full provenance.
    This supports human-in-the-loop workflows where timely decision-making is critical.

## Use Cases in Urgent and Interactive HPC

### Urgent Response Scenario

In high-stakes domains such as climate event modeling or epidemiological forecasting, decision timelines are measured in hours or minutes.
The workspace enables rapid orchestration of computational and analytical tasks by linking simulations, data assimilation, and visualization tools into a single, semantically connected environment.
For example, during an approaching extreme weather event, a forecaster can initiate new simulations, review incoming observational data, and generate updated impact assessments, all while the system automatically captures provenance and maintains context for every action taken.

### Interactive Experimentation

Many scientific workflows benefit from human-in-the-loop interactivity, where a researcher can dynamically adjust parameters, methods, or instruments based on live results.
The workspace supports this mode by allowing scientists to switch seamlessly between computational jobs and analytical views.
Each iteration—whether a simulation rerun or a new data preprocessing step—is automatically recorded with links to its inputs, outputs, and the hypotheses driving the changes, ensuring that iterative exploration does not sacrifice traceability.

### Collaborative Analysis

Modern research is inherently collaborative, often involving distributed teams with diverse expertise.
The workspace serves as a shared semantic hub where all team members can access the same tasks, datasets, workflows, and outputs in real time.
Role-based access control and semantic linking ensure that collaborators can navigate the research graph from their own perspective—be it data analysis, modeling, or interpretation—without losing the shared context that ties the entire project together.

## Advantages of an Ontology-Driven Workspace

* Context Preservation
  : Every task, dataset, and output is stored with explicit links to its research context, enabling users to reconstruct the full chain of evidence from raw data to published results.
* Reduced Cognitive Load
  : A single entry point consolidates tools, data, and communications, freeing researchers from juggling multiple interfaces and file structures.
* Enhanced Discovery & Reuse
  : Rich, ontology-based metadata makes it easy to locate relevant resources across projects, institutions, and domains, fostering data and knowledge reuse.
* Alignment with FAIR Principles
  : By embedding formal vocabularies and semantic relationships, the workspace naturally supports findability, accessibility, interoperability, and reusability.

## Challenges & Future Work

* Adoption
  : Integrating semantic models into established HPC and research workflows requires cultural change and user training, especially in domains with entrenched toolchains.
* Performance
  : Maintaining responsive interfaces when handling large-scale, data-intensive workloads demands optimization at both the data access and visualization layers.
* Standardization
  : The value of semantic interoperability grows with community consensus; establishing shared ontology profiles for HPC workspaces will be key to broader adoption.
* Integration with Workflow & Data Management Systems
  : The workspace must align with existing orchestration, storage, and catalog systems while preserving its ontology-driven structure, avoiding duplication of effort or fragmentation.

## Conclusion

This paper has outlined a vision for an ontology-driven research workspace tailored to urgent and interactive HPC contexts.
By integrating computational, experimental, and analytical activities into a single, semantically rich environment, such a workspace preserves context, reduces cognitive overhead, and enhances discovery and reuse.
The approach builds on established ontologies—FRBR, SPAR, DoCO, PROV-O—to provide the semantic backbone needed for linking diverse research artifacts and processes.
Beyond improving individual productivity, this model has the potential to unify scientific activity across disciplines, linking HPC resources, laboratory systems, and scholarly communication into a coherent whole.
Realizing this vision will require collaboration between domain scientists, HPC experts, and ontology developers to refine ontology profiles, integrate tools, and develop robust prototypes.
The result will be a foundation for more agile, transparent, and reusable science in time-critical and interactive computing environments.

## Bibliography

| Citation Key               | DOI / URL                                                                                                                                                                         |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Birkbeck, 2022             | [https://www.researchgate.net/publication/392418136](https://www.researchgate.net/publication/392418136)                                                                          |
| Schreiber, 2024            | [https://doi.org/10.1016/j.ijhcs.2024.103131](https://doi.org/10.1016/j.ijhcs.2024.103131)                                                                                        |
| Gerlich, 2025              | [https://doi.org/10.3390/soc15010006](https://doi.org/10.3390/soc15010006)                                                                                                        |
| Galvin, 2025               | [https://doi.org/10.1080/21678421.2024.2428927](https://doi.org/10.1080/21678421.2024.2428927)                                                                                    |
| Bozkurt, 2021              | [https://d-nb.info/1280130954/34](https://d-nb.info/1280130954/34)                                                                                                                |
| Bassi, 2023                | [https://www.scitepress.org/Papers/2023/121859/121859.pdf](https://www.scitepress.org/Papers/2023/121859/121859.pdf)                                                              |
| Wilkinson et al., 2016     | [https://doi.org/10.1038/sdata.2016.18](https://doi.org/10.1038/sdata.2016.18)                                                                                                    |
| Carroll et al., 2020       | [https://www.gida-global.org/care](https://www.gida-global.org/care)                                                                                                              |
| Observable, 2024           | [https://observablehq.com/](https://observablehq.com/)                                                                                                                            |
| Swetnam et al., 2024       | [https://doi.org/10.1371/journal.pcbi.1011270](https://doi.org/10.1093/database/baw073)                                                                                           |
| Barga et al., 2011         | [https://doi.org/10.1089/omi.2011.0024](https://doi.org/10.1089/omi.2011.0024)                                                                                                    |
| Engelmann et al., 2022     | [https://doi.org/10.1007/978-3-031-23606-8_11](https://doi.org/10.1007/978-3-031-23606-8_11)                                                                                      |
| Engelmann et al., 2023     | [https://doi.org/10.1145/3628034.3628060](https://doi.org/10.1145/3628034.3628060)                                                                                                |
| Milligan et al., 2023      | [https://doi.org/10.1145/3569951.3597602](https://doi.org/10.1145/3569951.3597602)                                                                                                |
| Yoshimoto et al., 2012     | [https://doi.org/10.1016/j.procs.2012.04.186](https://doi.org/10.1016/j.procs.2012.04.186)                                                                                        |
| Reuther et al., 2024       | [https://doi.org/10.48550/arXiv.2401.14550](https://doi.org/10.48550/arXiv.2401.14550)                                                                                            |
| Reuther et al., 2023       | [http://www.mit.edu/\~reuther/iuhpc\_draft.pdf](http://www.mit.edu/~reuther/iuhpc_draft.pdf)                                                                                      |
| Lindemann & Follin, 2024   | [https://doi.org/10.1109/SCW63240.2024.00251](https://doi.org/10.1109/SCW63240.2024.00251)                                                                                        |
| Milligan, 2017             | [https://doi.org/10.1145/3093338.3104159](https://doi.org/10.1145/3093338.3104159)                                                                                                |
| Milligan, 2018             | [https://doi.org/10.1145/3219104.3219162](https://doi.org/10.1145/3219104.3219162)                                                                                                |
| Oleksik et al., 2014       | [https://doi.org/10.1145/2531602.2531709](https://doi.org/10.1145/2531602.2531709)                                                                                                |
| Oakes et al., 2019         | [https://doi.org/10.1109/MODELS-C.2019.00072](https://doi.org/10.1109/MODELS-C.2019.00072)                                                                                        |
| Brown et al., 2020         | [https://doi.org/10.48550/arXiv.2010.08774](https://doi.org/10.48550/arXiv.2010.08774)                                                                                            |
| Thomas et al., 2017        | [https://cug.org/proceedings/cug2017\_proceedings.orig/includes/files/pap143s2-file1.pdf](https://cug.org/proceedings/cug2017_proceedings.orig/includes/files/pap143s2-file1.pdf) |
| Leong & Kranzlmüller, 2015 | [https://doi.org/10.1016/j.procs.2015.05.402](https://doi.org/10.1016/j.procs.2015.05.402)                                                                                        |
| Moreau & Missier, 2013     | [https://www.w3.org/TR/prov-o/](https://www.w3.org/TR/prov-o/)                                                                                                                    |
| Compton et al., 2012       | [https://doi.org/10.1016/j.websem.2012.05.003](https://doi.org/10.1016/j.websem.2012.05.003)                                                                                      |
| IFLA, 2009                 | [https://www.ifla.org/publications/functional-requirements-for-bibliographic-records/](https://www.ifla.org/publications/functional-requirements-for-bibliographic-records/)      |
| Peroni et al., 2017        | [https://doi.org/10.3233/SW-160218](https://doi.org/10.3233/SW-160218)                                                                                                            |
| Constantin et al., 2016    | [http://purl.org/spar/doco](http://purl.org/spar/doco)                                                                                                                            |

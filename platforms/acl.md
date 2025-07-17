---
uuid: e2dab416-9f43-41d8-8cf3-d2214e0ba83c
title: "ACL: Automated Chemistry Lab"
published: true
---

The **Automated Chemistry Lab (ACL)** is a robotic platform for solid-state synthesis and high-throughput chemical analysis.

It enables **end-to-end provenance capture** for experimental workflows, aligning with the **FAIR principles** and using semantic models based on SSN, DCAT, and PROV.

The **Autonomous Chemistry Laboratory (ACL)** is located in the Chemical and Materials Sciences building (4100) at Oak Ridge National Laboratory (ORNL). It supports robotic synthesis of both liquid and solid products and features tight integration with other ORNL labs for downstream data analysis and preparation. ACL workflows are structured to capture rich, structured metadata suitable for domains such as polymers, ligands, catalysis, and energy storage, providing a foundation for data-driven science and AI/ML discovery.

---

## Platform Architecture

### Synthesis System

The synthesis system automates solid-state reactions and includes:

* **Chemspeed Swing XL Synthesizer** – controlled via programmable input files
    * **Ball mill** for precursor mixing
    * **Pellet press** for compaction
    * **Furnace** with programmable temperature profiles

Each system is represented as an :rdfterm[ssn:System] or subclass, deployed via :rdfterm[ssn:Deployment].

### Analytical Systems

Post-synthesis, materials are analyzed using:

* **XRD (X-ray Diffraction)** – for phase identification
* **HPLC (High-Performance Liquid Chromatography)** – for impurity profiling
* **TGA-SDT650** – for thermal decomposition and mass loss profiling
* **Electrochemical Workstation** – for voltage, current, and conductivity measurements

Each instrument is modeled as an :rdfterm[ssn:System] capable of generating one or more :rdfterm[sosa:Observation]s.

### Sample Handling and Transport

* **KUKA Robotic Arm** – handles sample manipulation within stations.
* **KUKA Mobile Robot** – transports samples between synthesis and analytical stations. Each is tracked as an \:rdfterm and supports associated \:rdfterms for movement and handoff.

---

## Instrument Descriptions

### Chemspeed SwingXL

A programmable synthesis platform with solid and liquid dispensing down to 0.1 mg precision. Includes:

* Gravimetric dispensing
* Overhead reaction control (heating, cooling, stirring, reflux, pH monitoring/titration)
* ISYNTH disposable glass reactor blocks
* High-temp annealing furnace

### Advion Avant UHPLC with CMS

Advanced LC system with autosampler, dual MTP trays, and multiple detection modes:

* UV/Vis and RI detectors
* Compact Mass Spectrometer (CMS, electrospray)
* Column oven up to 90°C and pressure support up to 18,850 psi
* Manual or robotic injection from SwingXL or sample trays

### Agilent 8990 GC + Hiden QGA MS

Gas chromatography unit with dual columns and thermal conductivity detectors (TCD):

* Ar and He carrier gas configurations
* In-line catalytic reactor compatibility
* Optional Hiden QGA MS for product ID (low detection limits)

### Malvern-Panalytical Aeris Benchtop XRD

Cu Kα X-ray diffraction system for solid phase identification:

* Supports automated sample handoff from SwingXL
* Suitable for phase ID and structure refinement

### Electrochemical Workstation (Biologic SP-200)

Integrated into a custom J-Kem catalytic station:

* Measures electrochemical response for electrocatalytic CO₂ conversion
* Compatible with single or H-cell reactors
* Automates electrolyte/gas control and temperature logging

### TA Instruments SDT-650 (TGA/DSC-MS)

Thermogravimetric and differential scanning calorimetry system:

* Operates to 1500°C in inert/oxidizing/reducing atmospheres
* Supports modulated TGA/DSC
* Pfeiffer MS extension for evolved gas analysis up to 300 AMU

### Liquid-Liquid Separation Platform (J-Kem)

Automated workflow for selective phase extraction:

* Ligand-controlled solvation studies
* Weighing, centrifugation, imaging, and spectral quantification

---

## Feature of Interest (FoI)

The core :rdfterm[sosa:FeatureOfInterest] in ACL workflows is:

* :rdfterm[acl:SolidSample]: a synthesized material composed of one or more chemical compounds, characterized by physical and chemical properties.

Additional FoIs:

* :rdfterm[acl:PrecursorMixture]: the input blend of chemicals.
* :rdfterm[acl:SynthesisBatch]: logical grouping of samples from a single recipe.

---

## Observable Properties

Observable properties include:

| Property                               | Description                                | Measured by                 |
| -------------------------------------- | ------------------------------------------ | --------------------------- |
| :rdfterm[acl:phaseComposition]         | Crystal phase (e.g., perovskite structure) | XRD                         |
| :rdfterm[acl:purity]                   | Chemical purity / impurity levels          | HPLC, ICP-OES               |
| :rdfterm[acl:bondingState]             | Functional groups or bonding patterns      | N/A                         |
| :rdfterm[acl:elementalRatio]           | Molar/weight ratio of elements             | N/A.                        |
| :rdfterm[acl:massLossProfile]          | Mass loss vs. temperature curve            | TGA-SDT650                  |
| :rdfterm[acl:electrochemicalSignature] | I-V behavior, charge/discharge properties  | Electrochemical Workstation |

Each is modeled using :rdfterm[sosa:ObservableProperty].

---

## Workflow: Synthesize & Analyze

### Step 1: Sample Synthesis

1. Mix precursors (:rdfterm[acl:PrecursorMixture])
2. Compact into pellet
3. Fire in furnace
4. Result: :rdfterm[acl:SolidSample]

```ttl
acl:run123 a prov:Activity ;
  prov:used acl:precursorMixture456 ;
  prov:generated acl:sample789 ;
  prov:wasAssociatedWith acl:automatedFurnace ;
  prov:startedAtTime "2025-07-10T09:00:00Z"^^xsd:dateTime .
```

### Step 2: Sample Analysis

1. Mount sample on XRD
2. Capture diffraction pattern
3. Derive :rdfterm[acl:phaseComposition]

```ttl
acl:xrdObs123 a sosa:Observation ;
  sosa:hasFeatureOfInterest acl:sample789 ;
  sosa:observedProperty acl:phaseComposition ;
  sosa:madeBySensor acl:XRDSystem ;
  sosa:resultTime "2025-07-10T12:15:00Z"^^xsd:dateTime ;
  sosa:hasResult [
    rdf:value "Orthorhombic perovskite" ;
    qudt:unit qudt:Dimensionless
  ] .
```

Other measurements (HPLC, ICP-OES, FTIR, TGA) follow a similar pattern.

---

## Input & Output Definitions

| Stage     | Instrument | Input                          | Output                                 |
| --------- | ---------- | ------------------------------ | -------------------------------------- |
| Synthesis | Swing XL.  | :rdfterm[acl:PrecursorMixture] | :rdfterm[acl:SolidSample]              |
| Analysis  | XRD        | :rdfterm[acl:SolidSample]      | :rdfterm[acl:phaseComposition]         |
|           | HPLC       | :rdfterm[acl:SolidSample]      | :rdfterm[acl:purity]                   |
|           | ICP-OES    | :rdfterm[acl:SolidSample]      | :rdfterm[acl:elementalRatio]           |
|           | FTIR       | :rdfterm[acl:SolidSample]      | :rdfterm[acl:bondingState]             |
|           | TGA        | :rdfterm[acl:SolidSample]      | :rdfterm[acl:massLossProfile]          |
|           | EChem      | :rdfterm[acl:SolidSample]      | :rdfterm[acl:electrochemicalSignature] |

All inputs and outputs are semantically linked via :rdfterm[prov:used] and :rdfterm[prov:generated].

---

## Data Stores and File Mapping

Each file generated or used in ACL workflows is stored in a structured **data store** associated with a specific purpose and media type. These stores are implemented as **MinIO buckets**, referenced in metadata via :rdfterm[dcat:DataService] and :rdfterm[dcat:Distribution].

### Synthesis Input

| File Type        | Description                | Store Bucket           | Usage                                       |
| ---------------- | -------------------------- | ---------------------- | ------------------------------------------- |
| `.json` / `.yml` | Input recipe for synthesis | `acl-synthesis-inputs` | :rdfterm[prov:used] by synthesis activity |
| `.txt` / `.csv`  | Program script for Chemspeed Swing XL execution | `acl-chemspeed-programs` | :rdfterm[prov:used] by Chemspeed deployment |

### XRD Analysis Outputs

| File Type        | Description                                      | Store Bucket      | Usage                      |
| ---------------- | ------------------------------------------------ | ----------------- | -------------------------- |
| `.xrdml`         | Raw instrument data (XML-based diffraction scan) | `acl-xrd-xrdml`   | :rdfterm[sosa:hasResult] |
| `.xye`           | Processed intensity profile                      | `acl-xrd-xye`     | :rdfterm[sosa:hasResult] |
| `.pdf` / `.html` | Human-readable report of XRD analysis            | `acl-xrd-reports` | :rdfterm[dcat:accessURL] |

### TGA Analysis Outputs

| File Type        | Description                             | Store Bucket      | Usage                      |
| ---------------- | --------------------------------------- | ----------------- | -------------------------- |
| `.csv` / `.txt`  | Raw thermal profile data (mass vs temp) | `acl-tga-data`    | :rdfterm[sosa:hasResult] |
| `.pdf` / `.html` | Human-readable TGA report               | `acl-tga-reports` | :rdfterm[dcat:accessURL] |

### HPLC Analysis Outputs

| File Type        | Description                             | Store Bucket       | Usage    |
| ---------------- | --------------------------------------- | ------------------ | -------- |
| `.cdf` / `.csv`  | Raw or processed chromatogram data      | `acl-hplc-data`    | :rdfterm[sosa:hasResult] |
| `.pdf` / `.html` | Human-readable impurity analysis report | `acl-hplc-reports` | :rdfterm[dcat:accessURL] |

Each store is independently addressable and associated with a `:rdfterm[dcat:DataService]`, for example:

```ttl
acl:xrdRawService a dcat:DataService ;
  dct:title "XRD XRDML Store" ;
  dcat:endpointURL <https://data.example.org/minio/acl-xrd-xrdml/> ;
  dcat:servesDataset acl:xrdDataset .
```

---

## Integration with Metadata

Each dataset entry (e.g., :rdfterm[acl:xrdDataset123]) includes:

* A :rdfterm[dcat:Distribution] per file type
* Media type (:rdfterm[dcat:mediaType]) and file format (:rdfterm[dct:format])
* Logical connection to the :rdfterm[prov:Activity] and :rdfterm[sosa:Observation] that generated it

```ttl
acl:xrdDist123 a dcat:Distribution ;
  dcat:downloadURL <https://data.example.org/minio/acl-xrd-xye/scan789.xye> ;
  dct:format "text/plain" ;
  dcat:mediaType "application/x-xye" ;
  dcat:accessService acl:xrdXYEService .
```

---

## FAIR Integration

All resources (samples, systems, observations) have unique URIs.
Provenance links activities to agents and tools.
Metadata and data are stored in an LDP-compatible repository and described with DCAT.
Observations and results are exportable as RDF in Turtle or JSON-LD.

---

## Related Resources

* ACL Platform Model (Turtle)
* Synthesis Workflow Example (PROV)
* XRD Dataset (DCAT + SOSA)
* Full ACL Catalog

---

## RDF Term Reference Table

| Prefix | Term                           | Full IRI                                          | Description                                                 |
| ------ | ------------------------------ | ------------------------------------------------- | ----------------------------------------------------------- |
| `ssn`  | `ssn:System`                   | `http://www.w3.org/ns/ssn/System`                 | Abstract representation of a sensing or actuation system    |
| `ssn`  | `ssn:Deployment`               | `http://www.w3.org/ns/ssn/Deployment`             | Context-specific deployment of a system                     |
| `sosa` | `sosa:Observation`             | `http://www.w3.org/ns/sosa/Observation`           | An act of observing a property or phenomenon                |
| `sosa` | `sosa:FeatureOfInterest`       | `http://www.w3.org/ns/sosa/FeatureOfInterest`     | The entity being observed                                   |
| `sosa` | `sosa:ObservableProperty`      | `http://www.w3.org/ns/sosa/ObservableProperty`    | The property being observed                                 |
| `sosa` | `sosa:hasResult`               | `http://www.w3.org/ns/sosa/hasResult`             | Links an observation to its result                          |
| `prov` | `prov:Activity`                | `http://www.w3.org/ns/prov#Activity`              | An event or process involving inputs and outputs            |
| `prov` | `prov:used`                    | `http://www.w3.org/ns/prov#used`                  | Indicates usage of an entity by an activity                 |
| `prov` | `prov:generated`               | `http://www.w3.org/ns/prov#generated`             | Indicates output from an activity                           |
| `dcat` | `dcat:accessURL`               | `http://www.w3.org/ns/dcat#accessURL`             | URL for accessing the distribution                          |
| `dcat` | `dcat:mediaType`               | `http://www.w3.org/ns/dcat#mediaType`             | The media type of the distribution                          |
| `dcat` | `dcat:Distribution`            | `http://www.w3.org/ns/dcat#Distribution`          | Represents a specific available form of a dataset           |
| `dcat` | `dcat:DataService`             | `http://www.w3.org/ns/dcat#DataService`           | Describes a service that provides access to datasets        |
| `dct`  | `dct:format`                   | `http://purl.org/dc/terms/format`                 | File format, physical medium, or dimensions of the resource |
| `dct`  | `dct:title`                    | `http://purl.org/dc/terms/title`                  | Title or label of the resource                              |
| `acl`  | `acl:SolidSample`              | `http://example.org/acl/SolidSample`              | A synthesized solid-state material                          |
| `acl`  | `acl:PrecursorMixture`         | `http://example.org/acl/PrecursorMixture`         | Input blend used in synthesis                               |
| `acl`  | `acl:SynthesisBatch`           | `http://example.org/acl/SynthesisBatch`           | Logical grouping of related synthesis runs                  |
| `acl`  | `acl:phaseComposition`         | `http://example.org/acl/phaseComposition`         | Resulting phase structure from synthesis                    |
| `acl`  | `acl:purity`                   | `http://example.org/acl/purity`                   | Degree of chemical purity                                   |
| `acl`  | `acl:bondingState`             | `http://example.org/acl/bondingState`             | Functional group or bond profile                            |
| `acl`  | `acl:elementalRatio`           | `http://example.org/acl/elementalRatio`           | Ratio of elemental composition                              |
| `acl`  | `acl:massLossProfile`          | `http://example.org/acl/massLossProfile`          | Thermal decomposition behavior                              |
| `acl`  | `acl:electrochemicalSignature` | `http://example.org/acl/electrochemicalSignature` | Current-voltage curve and similar metrics                   |
| `acl`  | `acl:ChemspeedProgram`         | `http://example.org/acl/ChemspeedProgram`         | A program used to control the Chemspeed Swing XL            |
---
id: d23e7492-469b-4fa5-bbde-e3f320c6a62c
title: Scientific Data Layer — User FAQ
author: SDL Team
tags:
  - FAQ
  - Documentation
  - Help
  - User Support
version: 1.0
---

This FAQ provides answers to common questions about using the Scientific Data Layer (SDL) to manage, model, and interact with scientific data.

---

## 🔧 What is the Scientific Data Layer (SDL)?

The SDL is an end-to-end framework for managing scientific data using a system-of-systems architecture built on Linked Data Platform (LDP), RDF, and domain ontologies such as SSN, SOSA, DCAT, and PROV-O. It includes backend services, a modular frontend, and ontology-driven data modeling.

---

## 🧩 What types of entities can I manage in SDL?

You can manage a wide range of scientific entities including:

* Observations (:rdfterm[sosa:Observation])
* Samples (:rdfterm[sosa:Sample])
* Platforms and systems (:rdfterm[sosa:Platform], :rdfterm[ssn:System])
* Deployments (:rdfterm[ssn:Deployment])
* Catalogs and datasets (:rdfterm[dcat:Catalog], :rdfterm[dcat:Dataset])
* Agents and activities (:rdfterm[prov:Agent], :rdfterm[prov:Activity])

---

## 📦 How are data organized?

SDL organizes data using LDP containers. These containers group related entities, such as all samples from a deployment or all datasets in a catalog. Each container corresponds to an endpoint where RDF resources can be created, listed, and queried.

---

## 🧪 How do I record an observation?

To create an observation:

1. Define the observed property (:rdfterm[ssn:Property])
2. Link the feature of interest (e.g., a sample or environment)
3. Provide a result value (e.g., pH, temperature)
4. Optionally, associate the observation with the sensor and the time it occurred

SDL uses :rdfterm[sosa:Observation] entities for this purpose.

---

## 🧬 How do I represent samples?

Samples are represented using :rdfterm[sosa:Sample]. They can:

* Reference their origin using :rdfterm[sosa:isSampleOf]
* Be used as features of interest in observations
* Carry provenance information about collection (who, when, where)

---

## 🗃 How are datasets and files handled?

Datasets are modeled as :rdfterm[dcat:Dataset] entities. Files and downloadable content are modeled as :rdfterm[dcat:Distribution], which link to URLs, checksums, media types, and related metadata.

---

## 🧭 How do I trace provenance?

SDL supports full provenance modeling via :rdfterm[prov:Entity], :rdfterm[prov:Activity], and :rdfterm[prov:Agent]. These classes allow you to:

* Attribute data to people, organizations, or software
* Document how data was generated or transformed
* Link observations and results to workflows or deployments

---

## 🌐 What ontologies are used?

SDL integrates:

* **SOSA/SSN** — for sensors, systems, observations, samples
* **DCAT** — for data catalogs and distributions
* **PROV-O** — for provenance and traceability
* **DoCO** — for documents and narrative content
* **QUDT** — for quantities, units, and scientific meanings

---

## 💬 Where can I get help or request features?

Please contact the SDL support team or open a ticket in the issue tracker of your SDL deployment. For ontology-specific questions, refer to the [Entity Documentation](/docs/entity_overview) or contact a data steward.

---

> For advanced modeling questions or integration topics, visit the Architecture Overview or explore the service documentation.

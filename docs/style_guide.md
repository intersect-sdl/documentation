---
id: c7fab0bd-c521-4de0-a8f0-70a904649254
title: Documentation Symbol Guide
---

This style guide defines UTF-8 symbols to visually distinguish ontology components, entities, system layers, and documentation types within the SDL project. It aligns with common UML and architecture diagram practices for clarity and familiarity.

---

## 🟦 Ontology Elements

### Classes / Types

* 🟦 – Class / Type (UML class diagram box)
* 🧩 – Ontology Class (conceptual / semantic)
* 📦 – Package / Module (UML package symbol)

### Instances / Objects

* ⬜️ – Object / Instance (UML object notation)
* 🔑 – Named Individual / Entity
* 🧍 – Actor / Agent (UML use-case diagram)

### Interfaces / Abstract

* 🔷 – Interface / Abstract Class (UML notation)
* 🧠 – Abstract Concept

### Properties / Attributes

* ⚙️ – Attribute / Property
* 🔗 – Association (UML line with arrowheads)
* ➡️ – Directional Link / Object Property
* 📏 – Data Property (measurement / literal)

---

## 🏛️ Architecture Layers

### Frontend

* 🖥️ – User Interface (presentation layer)
* 🎨 – Design / UX
* 🧭 – Navigation
* 📝 – Forms / Input

### Backend

* 🛠️ – Service / Logic Layer
* 🗄️ – Storage / Database (persistence)
* 🔌 – API Endpoint / Connector
* 🏗️ – Microservice (component diagrams)

### System & Deployment

* 📦 – Deployable Package / Container (UML component)
* ☁️ – Cloud Service
* 🔧 – Configuration / DevOps
* 📡 – Network / Interface

---

## 📚 Documentation & Development

* 📘 – Developer Documentation (API Reference)
* 📄 – Specification / Design Document
* 🧑‍💻 – Developer Actor
* 🧪 – Testing / QA
* 🗂️ – Catalog / Index

---

## 🧠 Semantic & Scientific Context

* 🔬 – Scientific Observation / Instrument
* 🧪 – Experiment / Procedure
* 📈 – Result / Analysis
* ⏳ – Workflow / Process
* 🌐 – Linked Data / Namespace
* 📜 – Provenance / Metadata

---

## UML Symbol → UTF Icon Mapping Table

| Ontology Element       | UML Symbol              | UTF Icon |
| ---------------------- | ----------------------- | -------- |
| Class / Type           | Rectangle               | 🟦       |
| Instance / Object      | Underlined Rectangle    | ⬜️       |
| Package / Module       | Folder                  | 📦       |
| Interface / Abstract   | Lollipop / <<abstract>> | 🔷 / 🧠  |
| Association / Relation | Line with Arrow         | 🔗 / ➡️  |
| Attribute / Property   | Field in Class          | ⚙️       |
| Actor                  | Stick Figure            | 🧍       |
| Service Component      | Rectangle with Tabs     | 🛠️      |
| Deployment Container   | Artifact / Node         | 📦       |
| Database / Storage     | Cylinder                | 🗄️      |

---

### Usage Examples

* **Class:** `🟦 sosa:Observation`
* **Instance:** `⬜️ observation-123`
* **Association:** `🔗 ssn:hasFeatureOfInterest`
* **Service:** `🛠️ Registry Service`
* **Frontend Component:** `🖥️ Workspace UI`
* **Backend Deployment:** `📦 Catalog Microservice`
* **Developer Docs:** `📘 API Guide`
* **Scientific Workflow:** `⏳ Synthesis → Analysis 🔬`

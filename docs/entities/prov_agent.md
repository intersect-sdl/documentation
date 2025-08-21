---
id: d6b105cf-4e4d-4605-a98e-7b71b7a6cf80
title: prov:Agent
author: SDL Team
tags:
  - PROV-O
  - RDF Class
  - Agent
  - Entity Detail
version: 1.0
published: true
---

The :rdfterm[prov:Agent] class identifies entities that take responsibility for actions or data in provenance models. In SDL, :rdfterm[prov:Agent] is used to associate people, systems, or organizations with datasets, samples, workflows, or activities.

---

## Definition

**URI**: `http://www.w3.org/ns/prov#Agent`

> An :rdfterm[prov:Agent] is something that bears some form of responsibility for an activity taking place, for the existence of an entity, or for another agent’s activity.

---

## Usage in SDL

In SDL, :rdfterm[prov:Agent] is used to:

* Attribute dataset creation or processing to people or systems
* Link activities to executing agents
* Support traceability and accountability in workflows
* Represent both human and non-human actors (e.g., instruments, scripts)

Agents may be used as:

* :rdfterm[prov:wasAttributedTo] target for :rdfterm[prov:Entity]
* :rdfterm[prov:wasAssociatedWith] target for :rdfterm[prov:Activity]

---

## Properties

| Property               | Description                                                                             | Optional |
| ---------------------- | --------------------------------------------------------------------------------------- | -------- |
| :rdfterm[prov:actedOnBehalfOf] | Identifies a delegation relationship between agents                                     | Yes      |
| :rdfterm[prov:atLocation]      | Physical or digital location of the agent                                               | Yes      |
| :rdfterm[foaf:name]            | Name of the agent                                                                       | No       |
| :rdfterm[foaf:mbox]            | Email address                                                                           | Yes      |
| :rdfterm[foaf:homepage]        | Web page or profile link                                                                | Yes      |
| :rdfterm[dcterms:identifier]   | Agent identifier                                                                        | Yes      |
| :rdfterm[rdf:type]             | Used to distinguish types like :rdfterm[foaf:Person], :rdfterm[prov:SoftwareAgent], :rdfterm[prov:Organization] | No       |

---

## Composition

Agents in SDL are usually subclassed or typed with more specific classes like:

* :rdfterm[foaf:Person]
* :rdfterm[prov:SoftwareAgent]
* :rdfterm[prov:Organization]

```turtle
ex:agent1 a prov:Agent , foaf:Person ;
  foaf:name "Dr. Alice Example" ;
  dcterms:identifier "alice@example.org" .
```

---

## Examples

### Dataset Attribution

```turtle
ex:dataset1 a dcat:Dataset , prov:Entity ;
  dcterms:title "Root Zone Temperature Readings" ;
  prov:wasAttributedTo ex:agent1 .

ex:agent1 a prov:Agent , prov:SoftwareAgent ;
  foaf:name "Sensor Platform A" .
```

---

### Software Agent

```turtle
ex:scriptAgent a prov:Agent , prov:SoftwareAgent ;
  foaf:name "Automated QC Script" ;
  dcterms:identifier "agent:script-qc-2023" ;
  foaf:homepage <https://example.org/scripts/qc> .

ex:activity1 a prov:Activity ;
  prov:wasAssociatedWith ex:scriptAgent ;
  prov:startedAtTime "2023-07-01T10:00:00Z"^^xsd:dateTime .
```

---

### Organization and Delegation

```turtle
ex:labOrg a prov:Agent , prov:Organization ;
  foaf:name "Soil Ecology Lab" ;
  dcterms:identifier "org:soil-ecology" .

ex:technicianB a prov:Agent , foaf:Person ;
  foaf:name "Technician B" ;
  prov:actedOnBehalfOf ex:labOrg .

ex:activity2 a prov:Activity ;
  prov:wasAssociatedWith ex:technicianB ;
  prov:startedAtTime "2024-04-01T09:30:00Z"^^xsd:dateTime .
```

---

## Related Classes

* :rdfterm[prov:Entity] — the thing that was created or modified
* :rdfterm[prov:Activity] — the process or execution trace
* :rdfterm[foaf:Person], :rdfterm[prov:Organization] — subclasses of :rdfterm[prov:Agent]

---

## See Also

* [:rdfterm[prov:Agent]](https://www.w3.org/TR/prov-o/#Agent)
* [:rdfterm[foaf:Person]](http://xmlns.com/foaf/spec/#term_Person)
* [:rdfterm[prov:SoftwareAgent]](https://www.w3.org/TR/prov-o/#SoftwareAgent)

> Provenance agents form the human and computational backbone of scientific data lifecycles in SDL — enabling accountability, transparency, and proper attribution.

---
uuid: 180982f2-8dce-44b7-a779-216bcdb57092
title: Plant Properties
published: true
---

The following is a list of plant-specific properties commonly used in plant science, phenotyping, and growth monitoring. These properties can be used as sosa:observedProperty in the SDL RDF model and linked to ontologies like PPO, TO (Trait Ontology), EO (Environment Ontology), and PSO (Plant Structure Ontology).

## 🌿 **Plant-Specific Properties for Observation**

### 🌱 **Morphological Traits**

| Property       | Description                          | Possible Ontologies |
| -------------- | ------------------------------------ | ------------------- |
| `plantHeight`  | Height from base to apical meristem  | PPO, TO             |
| `leafNumber`   | Total number of leaves on the plant  | TO                  |
| `leafLength`   | Length of individual leaves          | TO                  |
| `leafWidth`    | Width of individual leaves           | TO                  |
| `stemDiameter` | Thickness of the main stem near base | TO                  |
| `rootLength`   | Total length of roots                | TO                  |
| `rootMass`     | Mass of harvested roots              | TO                  |
| `canopyWidth`  | Width of the plant's foliage spread  | TO                  |
| `branchNumber` | Number of branches per plant         | TO                  |
| `flowerNumber` | Number of flowers per plant          | PPO, TO             |

---

### 🌼 **Phenological Stages**

| Property          | Description                           | Possible Ontologies |
| ----------------- | ------------------------------------- | ------------------- |
| `germinationDate` | Date when germination occurred        | PPO                 |
| `emergenceDate`   | Date when seedling emerged above soil | PPO                 |
| `firstLeafDate`   | Date first true leaf appeared         | PPO                 |
| `floweringDate`   | Date when first flower opened         | PPO                 |
| `fruitingDate`    | Date when fruits first appeared       | PPO                 |
| `senescenceDate`  | Onset of visible senescence           | PPO                 |

---

### 🌾 **Biomass and Yield**

| Property             | Description                           | Possible Ontologies |
| -------------------- | ------------------------------------- | ------------------- |
| `abovegroundBiomass` | Mass of all above-ground plant tissue | TO                  |
| `dryMass`            | Mass of plant tissue after drying     | TO                  |
| `yieldPerPlant`      | Total harvestable yield per plant     | TO                  |
| `seedCount`          | Number of seeds produced per plant    | TO                  |
| `seedMass`           | Total or average mass of seeds        | TO                  |

---

### 🧪 **Physiological Measurements**

| Property                | Description                             | Possible Ontologies |
| ----------------------- | --------------------------------------- | ------------------- |
| `chlorophyllContent`    | Chlorophyll level in leaves (SPAD)      | TO                  |
| `photosynthesisRate`    | Rate of CO₂ assimilation                | TO                  |
| `stomatalConductance`   | Water vapor conductance through stomata | TO                  |
| `waterContent`          | Percentage of water in tissues          | TO                  |
| `nutrientConcentration` | Levels of N, P, K, etc. in tissues      | TO                  |

---

### 🌍 **Environmental Interactions**

| Property              | Description                                  | Possible Ontologies |
| --------------------- | -------------------------------------------- | ------------------- |
| `soilMoisture`        | Moisture content of soil at plant root zone  | EO                  |
| `lightExposure`       | Amount of light received                     | EO                  |
| `temperatureExposure` | Temperature experienced by plant             | EO                  |
| `humidity`            | Relative humidity of surrounding environment | EO                  |

---

### 📚 Example in RDF (`sosa:observedProperty`)

```turtle
ex:plantHeight
    a sosa:ObservableProperty ;
    rdfs:label "Plant Height" ;
    dct:description "Measured height of the plant from soil level to apical meristem." ;
    dct:identifier "plantHeight" ;
    skos:exactMatch <http://purl.obolibrary.org/obo/TO_0000207> .  # Trait Ontology term
```

---

## ✅ Ontology References

* **PPO** (Plant Phenology Ontology): [https://github.com/PlantPhenoOntology/ppo](https://github.com/PlantPhenoOntology/ppo)
* **TO** (Plant Trait Ontology): [http://www.cropontology.org/ontology/CO\_320\:plant\_trait](http://www.cropontology.org/ontology/CO_320:plant_trait)
* **EO** (Environment Ontology): [http://purl.obolibrary.org/obo/eo.owl](http://purl.obolibrary.org/obo/eo.owl)
* **PSO** (Plant Structure Ontology): [http://purl.obolibrary.org/obo/pso.owl](http://purl.obolibrary.org/obo/pso.owl)
* **PO** (Plant Ontology): [http://purl.obolibrary.org/obo/po.owl](http://purl.obolibrary.org/obo/po.owl)


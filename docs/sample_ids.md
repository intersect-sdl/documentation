---
uuid: 7210714a-af70-447b-b1bf-ef97db3f40d3
title: Sample IDs
published: false
---

extracted using the following command: 

```bash
grep -rnH "<id>" . | awk -F: '{print $3}' | awk -F\> '{print $2}' | awk -F\< '{print $1}' | sort | uniq
```

- BCAO_20230607_firstfire
- BaCo2TeO6_20230609
- KCAO_20230619-350C
- KCAO_20230619-350C-1hr
- KCAO_20230619_4-refinedata
- KCAO_20230623_60HR-anneal
- KCAO_2023062_350c_anneal_18thdiv-sli
- LiPtO3_EC
- NAPtO3-20230613
- NCSO_20230420_3
- NCSO_20230420_4
- NCSO_20230420_5
- NCSO_20230420_6
- NCSO_20230428_Zndope15
- NCSO_20230526_ZnCl2
- NCTO-2pt3
- NCTO_20230526-Srxchange
- NCTO_20230526_MgCl2
- NCTO_20230602_1-hexflux-ground
- NCTO_20230602_2-monoflux-ground
- NCTO_2pt7Na
- NCTO_2pt8Na
- NCTO_30%Na_20230526
- NCTO_5PCT_Mg_20230526
- NCTO_5pctNa_20230526
- Na2PtO3_20230420_7
- Na2PtO3_20230731
- Na2PtO3_20230804_2-bigbatch
- Na2PtO3_20230804_2-filtrate
- NaPtO
- NaPtO-900C-20230728
- NaPtO3_20230619_350anneal
- NaPtO3_20230619_350anneal-1hr
- NaPtO3_20230806_1-stir-350anneal
- NaPtO3_20230806_2-nostir-350anneal
- NaPtO3_20230807_1-stir
- NaPtO3_20230807_2-nostir
- NaPtO3_overnight
- NaPtO_reheat_over300C
- SCIO_20230526
- ncto 15pt mg
- silicon standard
- test
- testSi4bh
- testSi_080823
- usersample1_20230615

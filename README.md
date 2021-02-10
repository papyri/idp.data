# Papyri.info IDP (Integrating Digital Papyrology) Data

[![XML Validation](https://github.com/papyri/idp.data/workflows/XML%20Validation/badge.svg?event=push)](https://github.com/papyri/idp.data/actions?query=workflow%3A%22XML+Validation%22) [![GitHub contributors](https://img.shields.io/github/contributors-anon/papyri/idp.data)](https://github.com/papyri/idp.data/graphs/contributors) ![GitHub repo size](https://img.shields.io/github/repo-size/papyri/idp.data)

This repository contains data produced by and used to run the [Papyri.info](http://papyri.info/) website. For the code which runs Papyri.info, see the [`papyri/navigator` repository](https://github.com/papyri/navigator) and the [`sosol/sosol` repository](https://github.com/sosol/sosol) (used for the Papyrological Editor). For some more project background, see [the Papyri.info about page](http://papyri.info/docs/about), [the DDbDP background page](http://papyri.info/docs/ddbdp), or [_The Son of Suda On-Line_](http://ryanfb.github.io/papers-BICS/sosol-bics-draft.pdf) (2013). Papyri.info is maintained by the [Duke Collaboratory for Classics Computing](http://dcthree.github.io/) (DC3).

## Repository Contents

As Integrating Digital Papyrology implies, this repository brings together several different data sources from a variety of projects, which is reflected at the top level of the file hierarchy:

* `APD` - Texts from the Arabic Papyrology Database in [EpiDoc XML](http://epidoc.sf.net/)
* `APIS` - Metadata for the [Advanced Papyrological Information System (APIS)](http://papyri.info/docs/apis) in EpiDoc XML
* `Biblio` - Bibliographic data for the [Bibliographie Papyrologique (BP)](http://www.ulb.ac.be/philo/cpeg/bp.htm)
* `DCLP` - Texts from the Digital Corpus of Literary Papyri in EpiDoc XML
* `DDB_EpiDoc_XML` - Texts from the [Duke Data Bank of Documentary Papyri (DDbDP)](http://papyri.info/docs/ddbdp) in EpiDoc XML
* `HGV_meta_EpiDoc` - Metadata from the [Heidelberger Gesamtverzeichnis der Griechischen Papyrusurkunden Ägyptens (HGV)](http://www.rzuser.uni-heidelberg.de/~gv0/) in EpiDoc XML
* `HGV_metadata` - Upstream HGV FileMaker data
* `HGV_trans_EpiDoc` - Translations from the HGV in EpiDoc XML
* `RDF` - Collection metadata from Papyri.info in RDF XML
* `Validation` - Dependencies for XML validation (see `.github/workflows/xml-validation.yml`)

Automated XML validation for this repository is available [as a GitHub Action](https://github.com/papyri/idp.data/actions?query=workflow%3A%22XML+Validation%22).

## Updates

As the [Papyrological Editor on Papyri.info](http://papyri.info/editor/) uses Git for its data backend, data in this repository is updated frequently via that user interface. The Papyrological Editor uses its own Git repository which is synchronized bidirectionally on an hourly basis with this public-facing repository.

As a result of this, it is suggested that you use the [Papyrological Editor](http://papyri.info/editor/) for changes which are primarily to text, metadata, or translations at the level of individual documents. The reason for this is that the Papyrological Editor already incorporates workflows for editorial review by the editorial boards which oversee each individual project component.

For advanced users familiar with Git and XML wishing to make batch changes which affect a large number of files, it may be preferable to use a [Pull Request](https://github.com/papyri/idp.data/pulls) instead. We will review these on a case-by-case basis. You can also contact us at [dcthree@duke.edu](mailto:dcthree@duke.edu) in order to coordinate this sort of work if you are unsure if we are likely to be able to incorporate your changes or submissions.

We also use [this repository's GitHub Issues](https://github.com/papyri/idp.data/issues) to keep track of ongoing issues with the data. Feel free to give us feedback about this repository there as well.

## LICENSE

This data is made available under a [Creative Commons Attribution 3.0 License](http://creativecommons.org/licenses/by/3.0/), with copyright and attribution to the respective projects.

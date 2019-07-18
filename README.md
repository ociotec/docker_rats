# Docker RATS

Docker RATS source code analyzer.

## Introduction

Run source code security analysis (i.e. for ISO 27001 compliance) with CERN tool RATS analysis tool.

This project at Dockerhub: https://hub.docker.com/r/ociotec/rats

RATS web page: https://security.web.cern.ch/security/recommendations/en/codetools/rats.shtml

## Running the analysis

### Text report

Usage example (source code to analyze is inside current folder `$PWD`, it's mounted with a volume inside container at `/tmp/code`):

```
 docker run --rm --volume $PWD:/tmp/code ociotec/rats rats --resultsonly --warning 3 /tmp/code
```

This will output:

```
/tmp/code/src/test.c:131: Low: fopen
A potential race condition vulnerability exists here.  Normally a call to this
function is vulnerable only when a match check precedes it.  No check was
detected, however one could still exist that could not be detected.
```

### HTML report

Same example but the output will be in a HTML report:

```
 docker run --rm --volume $PWD:/tmp/code ociotec/rats rats --resultsonly --warning 3 --html /tmp/code > rats.html
```

cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  ccu002_02-chronic-kidney-disease-ckd-albuminuria---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-albuminuria---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  ccu002_02-chronic-kidney-disease-ckd-stage---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-stage---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-albuminuria---primary/output
  ccu002_02-chronic-kidney-disease-ckd-proteinuria---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-proteinuria---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-stage---primary/output
  ccu002_02-chronic-kidney-disease-ckd-hypertension---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-hypertension---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-proteinuria---primary/output
  ccu002_02-chronic-kidney-disease-ckd-dialysis---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-dialysis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-hypertension---primary/output
  ccu002_02-chronic-kidney-disease-ckd-transplant---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-transplant---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-dialysis---primary/output
  renal-ccu002_02-chronic-kidney-disease-ckd---primary:
    run: renal-ccu002_02-chronic-kidney-disease-ckd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-transplant---primary/output
  nephritic-ccu002_02-chronic-kidney-disease-ckd---primary:
    run: nephritic-ccu002_02-chronic-kidney-disease-ckd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: renal-ccu002_02-chronic-kidney-disease-ckd---primary/output
  ccu002_02-chronic-kidney-disease-ckd-unspecified---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: nephritic-ccu002_02-chronic-kidney-disease-ckd---primary/output
  ccu002_02-chronic-kidney-disease-ckd-glomerulonephritis---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-glomerulonephritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-unspecified---primary/output
  membranous-ccu002_02-chronic-kidney-disease-ckd---primary:
    run: membranous-ccu002_02-chronic-kidney-disease-ckd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-glomerulonephritis---primary/output
  endocapillary-ccu002_02-chronic-kidney-disease-ckd---primary:
    run: endocapillary-ccu002_02-chronic-kidney-disease-ckd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: membranous-ccu002_02-chronic-kidney-disease-ckd---primary/output
  ccu002_02-chronic-kidney-disease-ckd-failure---primary:
    run: ccu002_02-chronic-kidney-disease-ckd-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: endocapillary-ccu002_02-chronic-kidney-disease-ckd---primary/output
  mesangial-ccu002_02-chronic-kidney-disease-ckd---primary:
    run: mesangial-ccu002_02-chronic-kidney-disease-ckd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: ccu002_02-chronic-kidney-disease-ckd-failure---primary/output
  acute-ccu002_02-chronic-kidney-disease-ckd---primary:
    run: acute-ccu002_02-chronic-kidney-disease-ckd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: mesangial-ccu002_02-chronic-kidney-disease-ckd---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: acute-ccu002_02-chronic-kidney-disease-ckd---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}

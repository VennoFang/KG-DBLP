class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: gatk
baseCommand:
  - /bin/sh
  - /script/run.sh
inputs:
  - id: bam
    type: File
    inputBinding:
      position: 0
  - id: bai
    type: File
  - id: flod
    type: float
    inputBinding:
      position: 1
outputs:
  - id: vcf
    type: File
    outputBinding:
      glob: '*vcf'
  - id: idx
    type: File
    outputBinding:
      glob: '*idx'
label: gatk
requirements:
  - class: DockerRequirement
    dockerPull: 'gatk_test:v2'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.bai)
      - $(inputs.bam)
  - class: InlineJavascriptRequirement


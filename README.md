# Build_log_Summary
This project demonstrate CI/CD automation using Python scripting.
3 stages are generate at the Jenkins Pipeline:
1. Git-Checkout
2. XML-file generation
3. HTML-file generation

## XML-file generation
* Python script [buildLogXML.py](https://github.com/twinkle-das/Build_log_Summary/blob/master/buildLogXML.py) is used to generate an XML file with a 
text file [buildLog.txt](https://github.com/twinkle-das/Build_log_Summary/blob/master/buildLog.txt) as an input.

## HTML-file generation
* Python script [buildLogSummary.py](https://github.com/twinkle-das/Build_log_Summary/blob/master/buildLogSummary.py) is used to generate a HTML report for the above XML file. 
XSLT [buildLogXSL.xsl](https://github.com/twinkle-das/Build_log_Summary/blob/master/buildLogXSL.xsl) is used for designing and styling HTML.

## Jenkins-Pipeline
* Windows Batch scripts are used to generate jenkins pipelines.
* [Groovy Script](https://github.com/twinkle-das/Build_log_Summary/blob/master/build_log_summary_pipeline_script.txt) is used for writing the Jenkins pipeline.

## Run the following commands from the folder that contains the python files, to execute the project-
###### For XML generation run:
`python <XML-python-file> <input-text-file> <output-xml-file>`

###### For HTML generation run:
`python <HTML-python-file> <xsl-file-name> <xml-file-name> <html-file-path>`


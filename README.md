# RFC7854bis

## Generating IETF XML
This draft is written using [mmark (markdown)](https://github.com/mmarkdown/mmark) to render
the IETF submission XML file. 

### Root Entrypoint
The root entrypoint where the RFC is defined is [rfc.md](rfc.md).  This file includes
other markdown files, such as ```abstract.md``` and ```body.md```.  

### Apple/Mac

#### Install mmark

```
brew install mmark
```

#### Install xml2rfc

xml2rfc is avaialble via PIP but the pip package doesn't always install scripts. It's more consistent
to install **xml2rfc** using the below:

```
git clone git@github.com:ietf-tools/xml2rfc.git
cd xml2rfc
pip3 install -r requirements.txt
python3 setup.py install --user --install-scripts=$HOME/bin
```

#### Update local environment
Various scripts will require ```python``` which is not always available (e.g. only python3 works).  Add an alias, such
as ```alias python="/usr/bin/python3"```to ensure that python from shell uses python3. 

**xml2rfc** bin has been installed to ```${HOME}/bin/xml2rfc```.  Make sure that ```${HOME}/bin``` is in
the ```PATH=${HOME}/bin:$PATH``` variable. 

### All platforms

### Use 'make' to render IETF documents

Providing **xml2rfc** and **mmark** work from shell/command line, a simple call to ```make``` should
generate the IETF XML file. The text file output will also be generated. The text
file provides a clear human-readable rendering of the generated XML file.

**Example**:
```
❯ make
mkdir -p gen
mmark  rfc.md > gen/draft-jennings-moq-architecture.xml
xml2rfc --text --v3 gen/draft-jennings-moq-architecture.xml
 Created file gen/draft-jennings-moq-architecture.txt
```

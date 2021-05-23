from xml.dom import minidom
import sys
import re


input_file_path = sys.argv[1]
output_file_path = sys.argv[2]


def main():
    doc = minidom.Document()
    root = doc.createElement("root")
    doc.appendChild(root)
    pi = doc.createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="mystyle.xslt"')
    doc.insertBefore(pi, root)

    with open(input_file_path) as ip_file:
        line = ip_file.readline()
        while line:
            if line.__contains__("~"):
                tag, data = line.split("~")
                child = doc.createElement(tag)
                setData(doc, child, data)
                root.appendChild(child)
            line = ip_file.readline()
        ip_file.close()
    with open(output_file_path, "w") as op_file:
        op_file.write(doc.toprettyxml(indent="\t"))
        op_file.close()
        print("Successfully Generated {}".format(output_file_path))
    with open(output_file_path) as op_file:
        line = op_file.readline()
        xml_str = ""
        while line:
            regexp1 = re.compile(r".*</root>")
            regexp2 = re.compile(r"<.*>(.*?)</.*>")
            if regexp1.search(line) or regexp2.search(line):
                xml_str = xml_str + line
            elif not line.__contains__("</"):
                line.strip()
                xml_str = xml_str + line
            else:
                xml_str = xml_str.strip() + line
            line = op_file.readline()
        op_file.close()
    with open(output_file_path, "w") as op_file:
        op_file.write(xml_str)
        op_file.close()
    print("Successfully Generated Formatted {}".format(output_file_path))


def setData(doc, node, data):
    text_node = doc.createTextNode(data)
    node.appendChild(text_node)


if __name__ == "__main__":
    main()
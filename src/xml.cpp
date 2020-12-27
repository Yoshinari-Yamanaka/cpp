#include <iostream>
#include "xml.hpp"

void writeNode(DOMNode* node) 
{
	assert(node != NULL);

	switch( node->getNodeType() ) 
    {
		case DOMNode::ELEMENT_NODE:
			writeElement(static_cast<DOMElement*>(node));
			break;

		case DOMNode::TEXT_NODE:
			writeText(static_cast<DOMText*>(node));
			break;
	}

	DOMNode* child = node->getFirstChild();
	while(child) 
    {
		writeNode(child);
		DOMNode* next = child->getNextSibling();
		child = next;	
	}
}

void writeElement(DOMElement* element) 
{
	char* name = XMLString::transcode(element->getTagName());
	std::cout << "tag     :" << name << std::endl;
	XMLString::release(&name);

	DOMNamedNodeMap* map = element->getAttributes();
	for ( XMLSize_t i = 0; i < map->getLength(); i++ ) 
    {
		DOMAttr* attr= static_cast<DOMAttr*>(map->item(i));
		char* attr_name = XMLString::transcode(attr->getName());
		char* attr_value = XMLString::transcode(attr->getValue());
		std::cout << attr_name << ": " << attr_value << std::endl;

		XMLString::release(&attr_name);
		XMLString::release(&attr_value);
	}
}

void writeText(DOMText* text) 
{
	XMLCh* buffer = new XMLCh[XMLString::stringLen(text->getData()) + 1];
	XMLString::copyString(buffer, text->getData());
	XMLString::trim(buffer);
	char* content = XMLString::transcode(buffer);
	delete[] buffer;

	std::cout << "content :" << content << std::endl;
	XMLString::release(&content);
}
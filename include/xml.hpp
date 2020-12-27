#pragma once
#include <xercesc/dom/DOM.hpp>
#include <xercesc/dom/DOMElement.hpp>
#include <xercesc/dom/DOMNode.hpp>
#include <xercesc/dom/DOMText.hpp>

using namespace xercesc;

void writeNode(DOMNode* node);
void writeElement(DOMElement* element);
void writeText(DOMText* text);
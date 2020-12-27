#include <iostream>
#include "xml.hpp"

#include <xercesc/parsers/XercesDOMParser.hpp>
#include <xercesc/sax/HandlerBase.hpp>



int main(int argc, char** argv) 
{
	try
    {
		XMLPlatformUtils::Initialize();
	}
	catch(const XMLException& exp) 
    {
		char* message = XMLString::transcode(exp.getMessage());
		std::cerr << "Xerces-C++ Initialization Error" << std::endl;
		std::cerr << message << std::endl;
		XMLString::release(&message);
		return 1;
	}
	
	XercesDOMParser* parser = new XercesDOMParser();
	parser->setValidationScheme(XercesDOMParser::Val_Always);
	parser->setDoNamespaces(true);

	ErrorHandler* errHandler = new HandlerBase();
	parser->setErrorHandler(errHandler);

	
	try 
    {
		const char* xmlFile = "sample.xml";
        parser->parse(xmlFile);
		DOMDocument* dom = parser->getDocument();
		writeNode(dom);
        
	}
	catch ( const XMLException& exp ) 
    {
		char* message = XMLString::transcode(exp.getMessage());
		std::cout << "Exception message is: \n" << message << std::endl;
		XMLString::release(&message);
		return 1;
	}
	catch ( const DOMException& exp ) 
    {
		char* message = XMLString::transcode(exp.getMessage());
		std::cout << "Exception message is: \n" << message << std::endl;
		XMLString::release(&message);
		return 1;
	}
	catch (...) 
    {
		std::cout << "Unexpected Exception" << std::endl;
		return 1;
	}

	delete parser;
	delete errHandler;
	
	return 0;
}


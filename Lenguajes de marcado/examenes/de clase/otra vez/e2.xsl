<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  
  <xs:element name="bodegas">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="bodega" type="xs:xBodega"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  
  <xs:element name="xBodega">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="nombre" type="xs:string"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>

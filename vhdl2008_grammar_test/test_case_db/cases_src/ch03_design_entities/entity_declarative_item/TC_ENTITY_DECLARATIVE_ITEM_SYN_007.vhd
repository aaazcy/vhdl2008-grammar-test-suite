-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | attribute_declaration | attribute_specification | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: attribute_declaration + attribute_specification as entity_declarative_item — the entity declarative part declares the user attribute attr_pin:string and specifies an attribute specification for port a, verifying both attribute declarations and attribute specifications can legally exist in the entity declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_attr_ent is
  port(a:in bit; y:out bit);
  attribute pin_name:string;
  attribute pin_name of a:signal is "INPUT_A";
  attribute pin_name of y:signal is "OUTPUT_Y";
end entity edi_attr_ent;
architecture bh of edi_attr_ent is
begin
  y<=a;
end architecture bh;

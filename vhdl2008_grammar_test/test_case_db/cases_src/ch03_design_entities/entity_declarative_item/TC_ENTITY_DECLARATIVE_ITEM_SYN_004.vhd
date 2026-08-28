-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | constant_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: constant_declaration as entity_declarative_item — the entity declarative part defines constant values C_DEPTH=256, C_WIDTH=8, verifying constant_declaration is legal as an entity-level declaration item, constants can be referenced throughout the design unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_const_ent is
  port(idx:in integer; result:out integer);
  constant C_DEPTH:integer:=256;
  constant C_WIDTH:integer:=8;
end entity edi_const_ent;
architecture bh of edi_const_ent is
  signal s_val:integer:=C_DEPTH/2;
begin
  result<=s_val+C_WIDTH when idx<C_DEPTH else 0;
end architecture bh;

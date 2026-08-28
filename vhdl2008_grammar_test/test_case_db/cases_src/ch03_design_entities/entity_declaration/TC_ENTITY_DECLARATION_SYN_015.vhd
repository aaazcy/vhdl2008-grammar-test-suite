-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_015
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Extended identifier as entity name: the entity identifier uses extended identifier format `\entity with spaces and @special chars!\`, verifying the entity identifier slot accepts an extended identifier (VHDL supports backslash-escaped identifiers with spaces and special characters)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity \ent_ext_id\ is
  port(x : in integer; y : out integer);
end entity \ent_ext_id\;
architecture bh of \ent_ext_id\ is
begin
  y <= x * 2;
end architecture bh;

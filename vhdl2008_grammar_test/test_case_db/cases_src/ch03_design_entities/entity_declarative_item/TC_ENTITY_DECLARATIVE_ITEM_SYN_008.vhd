-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | alias_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: alias_declaration as entity_declarative_item — the entity declarative part creates the alias alias_a for input port a, verifying alias_declaration is legal in the entity declarative part, the alias pointing to a port can be used instead in the architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_alias_ent is
  port(a:in bit_vector(3 downto 0); y:out bit);
  alias msb:bit is a(3);
end entity edi_alias_ent;
architecture bh of edi_alias_ent is
begin
  y<=msb;
end architecture bh;

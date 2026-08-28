-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDI_002
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: constants defined in entity_declarative_item can be used in entity port default value expressions
-- Case Type: Positive
-- Error Category: scope_visibility
-- Test Focus: Positive example: the entity declarative part defines constant C_WIDTH=8, C_INIT=0, the generic and default value expressions of the port use constants declared in entity_declarative_item, verifying entity declarative part constants are visible in entity_header (port clause)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_sem2_ent is
  generic(G_WIDTH:integer:=8);
  port(din:in bit_vector(G_WIDTH-1 downto 0); dout:out bit_vector(G_WIDTH-1 downto 0));
  constant C_DEFAULT:bit_vector(7 downto 0):=(others=>'0');
end entity edi_sem2_ent;
architecture bh of edi_sem2_ent is
begin
  dout<=din;
end architecture bh;

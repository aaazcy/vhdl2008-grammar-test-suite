-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: entity with passive concurrent assertion in statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_spc2_ent is
  generic(MIN_W:integer:=4);
  port(a:in bit_vector(7 downto 0); y:out bit);
begin
  assert MIN_W>=2 report "width too small" severity error;
end entity ent_spc2_ent;
architecture bh of ent_spc2_ent is begin y<=a(0); end architecture bh;

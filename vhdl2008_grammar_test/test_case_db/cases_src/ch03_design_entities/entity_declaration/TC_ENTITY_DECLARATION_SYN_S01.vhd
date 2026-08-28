-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: entity with generics + ports in all modes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_spc_ent is
  generic(W:integer:=8; D:time:=1 ns; EN:boolean:=true);
  port(clk:in bit; rst:in bit; din:in bit_vector(W-1 downto 0); dout:out bit_vector(W-1 downto 0); io:inout bit);
end entity ent_spc_ent;
architecture bh of ent_spc_ent is begin dout<=din; io<=clk; end architecture bh;

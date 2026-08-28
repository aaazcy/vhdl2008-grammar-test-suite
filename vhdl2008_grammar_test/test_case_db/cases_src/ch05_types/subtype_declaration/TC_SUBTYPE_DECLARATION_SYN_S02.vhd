-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: array subtype with index constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sub_spc2_ent is port(r:out integer); end entity;
architecture bh of sub_spc2_ent is
  subtype t_nv is bit_vector(3 downto 0);
  subtype t_byte is bit_vector(7 downto 0);
  signal nv:t_nv:="0000"; signal bv:t_byte:=X"00";
begin nv<="1111"; bv<=X"AB"; r<=1; end architecture bh;

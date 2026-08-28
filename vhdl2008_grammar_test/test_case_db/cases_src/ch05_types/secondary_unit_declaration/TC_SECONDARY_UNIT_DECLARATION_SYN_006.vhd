-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Positive
-- Test Focus: secondary_unit_declaration using integer abstract_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sud_syn_frac is port(dout:out integer); end entity;
architecture rtl of sud_syn_frac is
  type t_len is range 0 to 1000000 units nm; um=1000 nm; mm=1000 um; end units;
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;
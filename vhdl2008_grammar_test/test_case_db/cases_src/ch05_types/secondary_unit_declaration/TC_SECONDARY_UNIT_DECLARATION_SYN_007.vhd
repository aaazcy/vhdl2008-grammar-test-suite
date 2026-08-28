-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Positive
-- Test Focus: secondary_unit_declaration with multiple secondary units in chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sud_syn_chain is port(dout:out integer); end entity;
architecture rtl of sud_syn_chain is
  type t_mem is range 0 to 1048576 units B; KB=1024 B; MB=1024 KB; GB=1024 MB; end units;
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;
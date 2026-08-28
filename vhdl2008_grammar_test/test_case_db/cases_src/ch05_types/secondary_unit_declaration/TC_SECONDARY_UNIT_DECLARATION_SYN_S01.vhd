-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.4
-- Test Focus: Secondary unit declaration: identifier = physical_literal;
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_secondary_unit_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_secondary_unit_declaration_syn_s01 is
  type t_sud is range 0 to 1000 units base; kilo=1000 base; end units; signal s_sud:t_sud:=0 base;
begin
  s_sud<=1 kilo; r<=1;end architecture bh;

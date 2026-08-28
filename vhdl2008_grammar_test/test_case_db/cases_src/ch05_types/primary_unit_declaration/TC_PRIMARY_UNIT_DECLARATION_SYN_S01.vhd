-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.4
-- Test Focus: Primary unit declaration: identifier — declares base unit of physical type
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_primary_unit_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_primary_unit_declaration_syn_s01 is
  type t_pud is range 0 to 1000 units b_pud; k_pud=10 b_pud; end units; signal s_pud:t_pud:=0 b_pud;
begin
  s_pud<=5 k_pud; r<=1;end architecture bh;

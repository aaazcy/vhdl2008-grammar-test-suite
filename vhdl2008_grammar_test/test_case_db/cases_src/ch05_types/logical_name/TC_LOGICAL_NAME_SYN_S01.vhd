-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5
-- Test Focus: Logical name: simple_expression — VHDL 2008 file logical name
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_logical_name_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_logical_name_syn_s01 is
    signal s_ln:integer:=0;
begin
  s_ln<=1; r<=s_ln;end architecture bh;

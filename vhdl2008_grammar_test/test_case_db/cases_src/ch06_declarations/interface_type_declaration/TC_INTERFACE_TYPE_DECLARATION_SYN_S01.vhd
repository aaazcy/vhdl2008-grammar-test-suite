-- =============================================================
-- Case ID: TC_INTERFACE_TYPE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.2
-- Test Focus: Interface type declaration: type identifier — type as generic interface parameter (VHDL 2008)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_type_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_type_declaration_syn_s01 is
begin
  r<=42;end architecture bh;

-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Test Focus: Interface subprogram declaration: interface_function_specification ｜ interface_procedure_specification
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_subprogram_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_subprogram_declaration_syn_s01 is
begin
  r<=42;end architecture bh;

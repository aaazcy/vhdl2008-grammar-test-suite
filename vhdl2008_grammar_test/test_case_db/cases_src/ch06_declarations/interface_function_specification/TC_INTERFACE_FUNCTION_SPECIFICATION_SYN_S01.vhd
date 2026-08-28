-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Test Focus: Interface function specification: function identifier [parameter_list] return type_mark — function as interface
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_function_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_function_specification_syn_s01 is
begin
  r<=42;end architecture bh;

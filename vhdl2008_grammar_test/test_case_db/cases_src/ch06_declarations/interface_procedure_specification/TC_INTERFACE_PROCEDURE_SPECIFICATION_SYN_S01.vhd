-- =============================================================
-- Case ID: TC_INTERFACE_PROCEDURE_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Test Focus: Interface procedure specification: procedure identifier [parameter_list] — procedure as interface parameter
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_procedure_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_procedure_specification_syn_s01 is
begin
  r<=42;end architecture bh;

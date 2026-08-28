-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: Interface element: interface_declaration — single element in interface list
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_element_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_element_syn_s01 is
begin
  r<=42;end architecture bh;

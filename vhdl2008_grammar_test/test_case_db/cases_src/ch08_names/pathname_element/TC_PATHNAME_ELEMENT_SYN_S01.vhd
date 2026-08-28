-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Test Focus: Pathname element: identifier [index] ｜ identifier (index) — single element in external pathname
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_pathname_element_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_pathname_element_syn_s01 is
begin
  r<=42;end architecture bh;

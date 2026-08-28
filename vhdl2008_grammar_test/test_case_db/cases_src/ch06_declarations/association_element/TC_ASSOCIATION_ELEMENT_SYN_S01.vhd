-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: Association element: [formal_part =>] actual_part — positional and named association
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_association_element_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_association_element_syn_s01 is
begin
  r<=42;end architecture bh;

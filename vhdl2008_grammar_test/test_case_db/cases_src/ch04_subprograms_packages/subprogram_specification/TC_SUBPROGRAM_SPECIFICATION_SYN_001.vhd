-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: minimal form: procedure_specification as subprogram_specification — procedure p without parameters, verifies procedure_specification is the minimal legal form of subprogram_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_ss_min is
  procedure p_reset;
end package pkg_ss_min;
package body pkg_ss_min is
  procedure p_reset is begin null; end procedure;
end package body pkg_ss_min;
entity ss_min_ent is port(r:out integer); end entity;
architecture bh of ss_min_ent is begin r<=0; end architecture bh;

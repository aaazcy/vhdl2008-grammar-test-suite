-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: floating_type_definition with precise range 0.0 to 3.14159
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ftd_syn_precise is port(dout:out integer); end entity;
architecture rtl of ftd_syn_precise is
  type t_pi is range 0.0 to 3.14159;
  signal s:t_pi:=1.0;
begin
  s<=3.14; dout<=0;
end architecture rtl;

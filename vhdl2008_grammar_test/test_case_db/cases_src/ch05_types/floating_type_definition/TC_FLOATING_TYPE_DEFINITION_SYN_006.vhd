-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: floating_type_definition with large range for gain values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ftd_syn_gain is port(dout:out integer); end entity;
architecture rtl of ftd_syn_gain is
  type t_gain is range -100.0 to 100.0;
  signal s:t_gain:=1.0;
begin
  s<=10.0; dout<=0;
end architecture rtl;

-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: floating_type_definition with range -1.0 to 1.0 for normalized values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ftd_syn_norm is port(dout:out integer); end entity;
architecture rtl of ftd_syn_norm is
  type t_norm is range -1.0 to 1.0;
  signal s:t_norm:=0.0;
begin
  s<=0.5; dout<=0;
end architecture rtl;

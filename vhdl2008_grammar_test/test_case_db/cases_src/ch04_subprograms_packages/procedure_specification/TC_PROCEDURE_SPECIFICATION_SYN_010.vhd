-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with a minimal single-element formal_parameter_list containing one signal parameter exercising the simplest non-empty parameter list in the BNF production
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_minimal_ent is
  port(cnt_in: in natural; cnt_out: out natural);
end entity;
architecture bh of ps_minimal_ent is
  procedure p_double(
    signal src: in natural;
    signal dst: out natural) is
  begin
    dst <= src * 2;
  end procedure;
begin
  p_double(cnt_in, cnt_out);
end architecture bh;

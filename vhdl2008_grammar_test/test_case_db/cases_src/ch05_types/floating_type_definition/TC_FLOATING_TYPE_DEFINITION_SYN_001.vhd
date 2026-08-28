-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.5
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Positive
-- Test Focus: Floating type with negative range+expression bounds: 3 float types - positive range(0.0 to 1.0) / negative range(-1.0 to 1.0) / expression bounds(0.0 to 2.0**4-1.0), verifying the range_constraint of floating_type_definition supports negative values and expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity float_ent is port(y:out integer); end entity;
architecture bh of float_ent is
  type t_gain  is range 0.0 to 1.0;
  type t_bipolar is range -1.0 to 1.0;
  type t_volt  is range 0.0 to 5.0;
  signal s_g:t_gain:=0.5; signal s_b:t_bipolar:=-0.5; signal s_v:t_volt:=3.3;
begin
  process(s_v)
  begin
    if s_v>2.5 then y<=1; else y<=0; end if;
  end process;
end architecture bh;

-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SNN_006
-- Rule Type: Syntax (Negative)
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Negative
-- Test Focus: Illegal token after the "after" keyword - the time_expression is replaced with the string literal "5 ns", expecting the parser to report a type error or syntax error after after
-- Expected Result: Triggers syntax error (invalid time_expression: string literal where time value expected)
-- Dependencies: None
-- =============================================================
entity dcspec_bad_time_expr is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of dcspec_bad_time_expr is
  signal s_g : bit register;
  -- ERROR: time_expression must be a time value, not a string literal
  disconnect s_g : bit after "5 ns";
begin
  b_guard : block (a = '1')
  begin
    s_g <= guarded a; y <= s_g;
  end block;
end architecture rtl;

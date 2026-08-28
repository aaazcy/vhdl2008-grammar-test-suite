-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ACTUAL_PARAMETER_PART
-- IEEE Section: 9.3.4
-- BNF Text: actual_parameter_part ::= parameter_association_list
-- Test Focus: Positional parameter passing to a function — integer arithmetic
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity actual_param_syn_s01 is
  port (
    a : in  integer;
    b : in  integer;
    y : out integer
  );
end entity actual_param_syn_s01;

architecture bh of actual_param_syn_s01 is
  function f_add(x, y : integer) return integer is
  begin
    return x + y;
  end function f_add;
begin
  y <= f_add(a, b);                   -- actual_parameter_part with two positional params
end architecture bh;

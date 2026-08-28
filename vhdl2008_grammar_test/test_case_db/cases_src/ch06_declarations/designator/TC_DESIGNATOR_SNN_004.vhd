-- =============================================================
-- Case ID: TC_DESIGNATOR_SNN_004
-- Rule Type: Syntax
-- BNF Production: DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Test Focus: Invalid operator_symbol with mismatched quotes —
--   operator_symbol must be a string literal enclosed in
--   double quotes containing a valid operator character
--   sequence; here single quotes are used which violates
--   the token syntax for operator_symbol
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity designator_snn_004 is
  port (
    a_in  : in  integer range 0 to 7;
    b_in  : in  integer range 0 to 7;
    y_out : out integer range 0 to 15
  );
end entity designator_snn_004;

architecture rtl of designator_snn_004 is
  -- ERROR: operator_symbol uses single quotes instead of double quotes
  -- Valid form would be: function "+"(x, y : integer) return integer
  function '+'(x, y : integer) return integer is
  begin
    return x + y;
  end function;

  signal s_a, s_b : integer range 0 to 7 := 0;
begin
  s_a <= a_in;
  s_b <= b_in;
  y_out <= s_a '+'(s_a, s_b);  -- also error: single-quoted operator
end architecture rtl;

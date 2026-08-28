-- =============================================================
-- Case ID: TC_DESIGNATOR_SNN_001
-- Rule Type: Syntax
-- BNF Production: DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Test Focus: Missing designator in function declaration —
--   function keyword must be followed by an identifier
--   or operator_symbol; here the 'return' keyword appears
--   immediately, violating the designator requirement
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity designator_snn_001 is
  port (
    x_in  : in  integer range 0 to 15;
    y_out : out integer range 0 to 15
  );
end entity designator_snn_001;

architecture rtl of designator_snn_001 is
  -- ERROR: function declaration missing designator (identifier)
  -- BNF requires: subprogram_body ::= subprogram_specification is ...
  -- subprogram_specification requires designator
  function return integer is
  begin
    return 42;
  end function;

  signal s_val : integer range 0 to 15 := 0;
begin
  s_val <= x_in + 1;
  y_out <= s_val;
end architecture rtl;

-- =============================================================
-- Case ID: TC_DESIGNATOR_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Case Type: Positive
-- Test Focus: Production-specific: exercises designator with operator_symbol in a function definition for the "+" operator.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity designator_syn_s2 is
  port (
    a : in  integer;
    b : in  integer;
    s : out integer
  );
end entity designator_syn_s2;

architecture rtl of designator_syn_s2 is
  function "+"(x, y : integer) return integer is
  begin
    return x + y;
  end function;
begin
  s <= a + b;
end architecture rtl;

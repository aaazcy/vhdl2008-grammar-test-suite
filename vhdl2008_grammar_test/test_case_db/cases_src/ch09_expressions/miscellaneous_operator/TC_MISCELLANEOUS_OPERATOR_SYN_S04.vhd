-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_S04
-- Rule Type: Syntax
-- BNF Production: miscellaneous_operator
-- IEEE Section: 9.2
-- BNF Text: miscellaneous_operator ::= ** | abs | not
-- Test Focus: ** exponentiation operator used to compute square and cube values in a math pipeline
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_miscellaneous_operator_syn_s04 is
  port (
    x       : in  integer range 0 to 10;
    x_sq    : out integer range 0 to 100;
    x_cu    : out integer range 0 to 1000
  );
end entity tc_miscellaneous_operator_syn_s04;

architecture exp_unit of tc_miscellaneous_operator_syn_s04 is
begin
  x_sq <= x ** 2;
  x_cu <= x ** 3;
end architecture exp_unit;

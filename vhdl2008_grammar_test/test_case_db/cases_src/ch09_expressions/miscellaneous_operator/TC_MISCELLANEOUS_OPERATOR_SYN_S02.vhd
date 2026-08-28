-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_S02
-- Rule Type: Syntax
-- BNF Production: miscellaneous_operator
-- IEEE Section: 9.2
-- BNF Text: miscellaneous_operator ::= ** | abs | not
-- Test Focus: abs on negative integers and reals in signal assignments for a signal processing unit
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_miscellaneous_operator_syn_s02 is
  port (
    int_in   : in  integer range -100 to 100;
    real_in  : in  real;
    int_abs  : out integer range 0 to 100;
    real_abs : out real
  );
end entity tc_miscellaneous_operator_syn_s02;

architecture abs_unit of tc_miscellaneous_operator_syn_s02 is
begin
  int_abs  <= abs int_in;
  real_abs <= abs real_in;
end architecture abs_unit;

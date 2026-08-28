-- =============================================================
-- Case ID: TC_SIGN_SYN_S01
-- Rule Type: Syntax
-- BNF Production: sign
-- IEEE Section: 9.2
-- BNF Text: sign ::= + | -
-- Test Focus: unary + operator on an integer expression in a temperature offset calculation
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_sign_syn_s01 is
  port (
    raw_val  : in  integer range -50 to 50;
    abs_val  : out integer range 0 to 50
  );
end entity tc_sign_syn_s01;

architecture offset of tc_sign_syn_s01 is
begin
  abs_val <= abs(+raw_val);  -- unary + sign operator
end architecture offset;

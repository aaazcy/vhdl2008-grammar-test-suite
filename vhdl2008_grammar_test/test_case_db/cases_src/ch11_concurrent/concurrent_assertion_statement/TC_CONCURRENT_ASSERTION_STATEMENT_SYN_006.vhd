-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Positive
-- Test Focus: assert condition is a complex boolean expression — `assert not (clk'stable and data'event)` combines the `'stable` and `'event` attributes to detect timing violations, verifying that a concurrent assertion supports complex signal attribute expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ca_complex_cond_ent is
  port(clk, data, reset_n : in bit);
end entity ca_complex_cond_ent;
architecture bh of ca_complex_cond_ent is
begin
  assert not (clk'stable and data'event and reset_n = '1')
    report "data changed outside clock edge while not in reset"
    severity error;
end architecture bh;

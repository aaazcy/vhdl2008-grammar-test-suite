-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Negative
-- Test Focus: SNN: time expression missing after for — `wait for ;` has no time expression after the for keyword, verifying that the time expression of the timeout_clause is mandatory
-- Expected Result: Triggers syntax error: time expression missing after 'for'
-- Dependencies: None
-- =============================================================
entity wait_for_noexpr_ent is
  port (en : in bit; out_sig : out bit);
end entity wait_for_noexpr_ent;

architecture err of wait_for_noexpr_ent is
begin
  process is
  begin
    out_sig <= '0';
    wait for;  -- ERROR: missing time expression after 'for'
    out_sig <= '1';
    wait;
  end process;
end architecture err;

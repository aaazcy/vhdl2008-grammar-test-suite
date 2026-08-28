-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Negative
-- Test Focus: SNN: Missing semicolon — `wait on clk` is followed directly by a newline with no semicolon, verifying that wait_statement must be terminated by a semicolon
-- Expected Result: Triggers syntax error: missing ';' after wait statement
-- Dependencies: None
-- =============================================================
entity wait_nosemi_ent is
  port (clk : in bit; flag : out bit);
end entity wait_nosemi_ent;

architecture err of wait_nosemi_ent is
begin
  process is
  begin
    flag <= '0';
    wait on clk  -- ERROR: missing semicolon
    flag <= '1';
  end process;
end architecture err;

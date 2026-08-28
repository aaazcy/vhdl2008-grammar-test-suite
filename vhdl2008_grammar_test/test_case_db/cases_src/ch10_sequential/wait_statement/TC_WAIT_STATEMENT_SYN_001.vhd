-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: wait_statement ::= [ label : ] wait [ sensitivity_clause ] [ condition_clause ] [ timeout_clause ] ;
-- Case Type: Positive
-- Test Focus: Minimal form: only the `wait;` keyword plus semicolon with no clauses — verifying the minimal syntax form of the wait statement (infinite wait)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wait_minimal_ent is
  port (start : in bit; ready : out bit);
end entity wait_minimal_ent;

architecture rtl of wait_minimal_ent is
begin
  process is
  begin
    ready <= '0';
    wait;
  end process;
end architecture rtl;

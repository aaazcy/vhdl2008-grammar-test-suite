-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: Minimal form: no label, only `assert condition ;` - verifying the minimal syntactic unit of assertion_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_stmt_min_ent is
  port (gate_ok : in boolean; pass : out bit);
end entity assert_stmt_min_ent;

architecture simple of assert_stmt_min_ent is
begin
  process(gate_ok) is
  begin
    assert gate_ok;
    pass <= '1';
  end process;
end architecture simple;

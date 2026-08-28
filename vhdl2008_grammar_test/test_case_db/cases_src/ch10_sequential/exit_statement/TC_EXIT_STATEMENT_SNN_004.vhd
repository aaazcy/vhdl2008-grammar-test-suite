-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: exit not inside a loop - the `exit;` statement appears among ordinary sequential statements of the process instead of inside a loop body
-- Expected Result: Triggers syntax error: exit statement must be inside a loop
-- Dependencies: None
-- =============================================================
entity exit_outside_loop_ent is
  port (en : in bit; out_sig : out bit);
end entity exit_outside_loop_ent;

architecture err of exit_outside_loop_ent is
begin
  process(en) is
  begin
    out_sig <= en;
    exit;  -- ERROR: exit not within a loop
  end process;
end architecture err;

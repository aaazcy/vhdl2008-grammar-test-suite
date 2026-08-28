-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: next not inside a loop — `next;` appears among the ordinary sequential statements of a process instead of inside a loop body
-- Expected Result: Triggers syntax error: next statement must be inside a loop
-- Dependencies: None
-- =============================================================
entity next_outside_loop_ent is
  port (en : in bit; out_sig : out bit);
end entity next_outside_loop_ent;

architecture err of next_outside_loop_ent is
begin
  process(en) is
  begin
    out_sig <= en;
    next;  -- ERROR: next not within a loop
  end process;
end architecture err;

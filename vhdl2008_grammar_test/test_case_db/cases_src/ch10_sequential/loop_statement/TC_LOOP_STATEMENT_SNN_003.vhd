-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: loop_label mismatch — the for loop labeled "l_outer" has "l_wrong" labeled after its end loop, the label names are inconsistent, verifies loop_label must be consistent at the loop start and after end loop
-- Expected Result: Triggers syntax error: loop label mismatch, expected "l_outer" but found "l_wrong"
-- Dependencies: None
-- =============================================================
entity loop_label_mismatch_ent is port(q:out integer); end entity;
architecture bh of loop_label_mismatch_ent is
  signal s:integer:=0;
begin
  process is
  begin
    l_outer: for i in 0 to 7 loop
      s <= s + i;
    end loop l_wrong;
    q <= s;
    wait;
  end process;
end architecture bh;

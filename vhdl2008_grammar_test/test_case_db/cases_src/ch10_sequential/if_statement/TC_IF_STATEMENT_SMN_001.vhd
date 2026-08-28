-- =============================================================
-- Case ID: TC_IF_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SMN: the if condition uses an integer literal — in `if 1 then` the condition is of integer type and cannot be converted to boolean
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity if_int_cond_ent is
  port (y : out integer);
end entity if_int_cond_ent;

architecture vhdl2008 of if_int_cond_ent is
begin
  process is
  begin
    if 1 then
      y <= 1;
    end if;
    wait;
  end process;
end architecture vhdl2008;

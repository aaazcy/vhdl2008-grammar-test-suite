-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "loop" keyword — `for i in 0 to 7 s_arr(i)<=i; end loop;`, a statement appears directly after parameter_specification, the "loop" keyword is missing
-- Expected Result: Triggers syntax error: missing "loop" keyword
-- Dependencies: None
-- =============================================================
entity loop_snn1_ent is port(y:out integer); end entity;
architecture bh of loop_snn1_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_arr:t_arr;
begin
  process is begin for i in 0 to 7 s_arr(i)<=i; end loop; wait; end process;
end architecture bh;

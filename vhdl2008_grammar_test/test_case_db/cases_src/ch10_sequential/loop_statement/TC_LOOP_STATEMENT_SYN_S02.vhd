-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: while loop with exit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_spc2_ent is port(r:out integer); end entity;
architecture bh of loop_spc2_ent is
begin
  process
    variable v : integer := 0; variable i : integer := 0;
  begin
    while i < 100 loop
      i := i + 1;
      v := v + i;
      exit when v > 1000;
    end loop;
    r <= v; wait;
  end process;
end architecture bh;

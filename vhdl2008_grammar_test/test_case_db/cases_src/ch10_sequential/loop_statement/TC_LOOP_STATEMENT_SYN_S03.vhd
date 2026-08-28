-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: nested labeled loops
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_spc3_ent is port(r:out integer); end entity;
architecture bh of loop_spc3_ent is
begin
  process
    variable v : integer := 0;
  begin
    L_outer: for i in 0 to 3 loop
      L_inner: for j in 0 to 7 loop
        v := v + i*8 + j;
        exit L_outer when v > 50;
      end loop L_inner;
    end loop L_outer;
    r <= v; wait;
  end process;
end architecture bh;

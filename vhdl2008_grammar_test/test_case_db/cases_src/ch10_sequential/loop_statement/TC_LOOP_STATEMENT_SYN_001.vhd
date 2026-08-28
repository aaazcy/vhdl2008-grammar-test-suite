-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: minimal infinite loop: no label, no iteration_scheme, the loop body contains only a wait statement (wait on clk), verifies the infinite loop syntax of plain `loop ... end loop` without iteration scheme — the most common testbench clock pattern
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_min_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of loop_min_ent is
  signal s_cnt:integer:=0;
begin
  process is
  begin
    loop
      wait on clk;
      if clk='1' then s_cnt<=(s_cnt+1) mod 256; end if;
      y<=s_cnt;
    end loop;
  end process;
end architecture bh;

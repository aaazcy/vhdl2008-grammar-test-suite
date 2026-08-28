-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: Process without sensitivity list + wait-based: no sensitivity list, a declarative part with a variable, and a body driven by a wait on loop with a wait until condition, verifying the full form of a process without a sensitivity list (wait-based)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_wait_ent is port(clk:in bit; trigger:in bit; y:out integer); end entity;
architecture bh of proc_wait_ent is
begin
  process is
    variable v_cnt:integer:=0;
  begin
    wait on clk;
    if clk='1' then v_cnt:=v_cnt+1; end if;
    y<=v_cnt;
  end process;
end architecture bh;

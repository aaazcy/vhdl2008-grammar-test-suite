-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: process with wait (no sensitivity list) + declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_spc2_ent is port(clk:in bit; d:in bit; q:out bit); end entity;
architecture bh of proc_spc2_ent is begin
  process
    variable v_cnt:integer:=0;
  begin
    wait until clk='1';
    v_cnt:=v_cnt+1;
    if v_cnt mod 2=0 then q<=d; end if;
  end process;
end architecture bh;

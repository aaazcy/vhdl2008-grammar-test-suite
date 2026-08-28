-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: VHDL 2008 reserved word "all" in sensitivity list — process(all) automatically includes every signal read within the process body in its sensitivity, eliminating manual sensitivity list management and preventing latch inference for combinatorial logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_all_ent is
  port(a, b, sel : in bit; y : out bit);
end entity proc_all_ent;
architecture bh of proc_all_ent is
begin
  process(all)
  begin
    if sel = '1' then y <= a;
    else y <= b;
    end if;
  end process;
end architecture bh;

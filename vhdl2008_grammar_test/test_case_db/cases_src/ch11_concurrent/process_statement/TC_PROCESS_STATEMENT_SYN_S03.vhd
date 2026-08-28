-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: combinatorial process with all inputs in sensitivity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_spc3_ent is port(a,b,sel:in bit; y:out bit); end entity;
architecture bh of proc_spc3_ent is begin
  process(a,b,sel) begin
    if sel='1' then y<=a; else y<=b; end if;
  end process;
end architecture bh;

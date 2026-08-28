-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Positive
-- Test Focus: Minimal process with sensitivity list: no label, a single-signal sensitivity list (clk), no declarative part, and a body with clock-edge detection + signal assignment, verifying the minimal process form——with a sensitivity list, no wait and no declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_min_ent is port(clk:in bit; d:in bit; q:out bit); end entity;
architecture bh of proc_min_ent is
begin
  process(clk)
  begin
    if clk'event and clk='1' then q<=d; end if;
  end process;
end architecture bh;

-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Case Type: Positive
-- Test Focus: No sensitivity list——`process` has no parentheses after it and the process body contains a wait statement, verifying that a process without a sensitivity list must have wait statements inside
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity psl_no_list_ent is
  port(clk : in bit; q : out bit);
end entity psl_no_list_ent;
architecture bh of psl_no_list_ent is
begin
  process is
  begin
    wait until clk'event and clk = '1';
    q <= not q;
  end process;
end architecture bh;

-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Case Type: Positive
-- Test Focus: The "all" keyword——the VHDL 2008 addition `process(all)` is automatically sensitive to all read signals, verifying all as the concise form of a process sensitivity list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity psl_all_ent is
  port(a, b : in bit; y : out bit);
end entity psl_all_ent;
architecture bh of psl_all_ent is
begin
  process(all) is
  begin
    y <= a and b;
  end process;
end architecture bh;

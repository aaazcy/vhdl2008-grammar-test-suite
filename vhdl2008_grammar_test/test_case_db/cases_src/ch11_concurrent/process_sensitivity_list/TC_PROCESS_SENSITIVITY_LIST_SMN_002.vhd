-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Rule Description: A process with a sensitivity list must not contain any wait statements; combining both causes a simulation error
-- Case Type: Negative
-- Error Category: simulation_error
-- Test Focus: SMN: sensitivity list + wait statement coexisting——`process(clk)` has a sensitivity list but its body contains `wait on rst_n;`, verifying that a process with a sensitivity list cannot contain wait statements
-- Expected Result: Triggers semantic error: process with sensitivity list cannot contain wait statements
-- Dependencies: None
-- =============================================================
entity psl_smn2_ent is
  port(clk, rst_n : in bit; q : out bit);
end entity psl_smn2_ent;
architecture bh of psl_smn2_ent is
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      q <= not q;
    end if;
    wait on rst_n;
  end process;
end architecture bh;

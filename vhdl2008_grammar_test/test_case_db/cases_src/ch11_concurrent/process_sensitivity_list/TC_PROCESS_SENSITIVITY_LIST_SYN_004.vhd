-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Case Type: Positive
-- Test Focus: sensitivity_list with multiple signals——`process(clk, rst_n, enable)` separates three signals with commas, verifying that a sensitivity_list can contain multiple signal names
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity psl_multi_ent is
  port(clk, rst_n, enable : in bit; q : out bit);
end entity psl_multi_ent;
architecture bh of psl_multi_ent is
begin
  process(clk, rst_n, enable) is
  begin
    if rst_n = '0' then
      q <= '0';
    elsif clk'event and clk = '1' then
      if enable = '1' then
        q <= not q;
      end if;
    end if;
  end process;
end architecture bh;

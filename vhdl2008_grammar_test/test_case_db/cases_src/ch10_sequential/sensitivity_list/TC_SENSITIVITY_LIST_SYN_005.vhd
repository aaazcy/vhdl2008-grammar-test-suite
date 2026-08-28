-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Positive
-- Test Focus: VHDL 2008 process(all) — using the all keyword instead of an explicit sensitivity_list, verifying all as the alternative form of sensitivity_list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sl_syn5_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sl_syn5_ent is
begin
  process(all) is
  begin
    y <= a + b;
  end process;
end architecture bh;

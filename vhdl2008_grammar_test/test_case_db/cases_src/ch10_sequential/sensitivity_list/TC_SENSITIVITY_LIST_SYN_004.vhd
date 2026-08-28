-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Positive
-- Test Focus: process with three-signal sensitivity_list — process(a, b, sel) three signals comma-separated, covering the multi-input combinational logic scenario
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sl_syn4_ent is port(a,b,sel:in bit; y:out bit); end entity;
architecture bh of sl_syn4_ent is
begin
  process(a, b, sel) is
  begin
    if sel = '1' then
      y <= a;
    else
      y <= b;
    end if;
  end process;
end architecture bh;

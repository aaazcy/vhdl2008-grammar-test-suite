-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Positive
-- Test Focus: external_name selects the external_variable_name branch — binding a variable external name of the form <<variable .tb.uut.shared_cnt : natural>> via alias and monitoring a cross-hierarchy shared variable in a process, verifying the syntax of the external_variable_name branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_name_variable_sel is
  port(capture_en : in bit; captured_val : out natural);
end entity;

architecture vhdl2008 of ext_name_variable_sel is
  alias shared_cnt is <<variable .tb_top.u_dut.txn_count : natural>>;
  signal snapshot : natural := 0;
begin
  process(capture_en)
  begin
    if rising_edge(capture_en) then
      snapshot <= shared_cnt;
    end if;
  end process;
  captured_val <= snapshot;
end architecture vhdl2008;

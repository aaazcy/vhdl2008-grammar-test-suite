-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: Minimal external variable name — alias shared_cnt is <<variable .tb.uut.txn_id : natural>> accesses a cross-hierarchy shared variable using absolute_pathname, verifying the basic syntactic form of external_variable_name starting with '<< variable'
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_minimal is
  port(sample : in bit; snapshot : out natural);
end entity;

architecture vhdl2008 of ext_var_minimal is
  alias shared_cnt is <<variable .tb_top.u_dut.txn_id : natural>>;
  signal latch : natural := 0;
begin
  process(sample)
  begin
    if rising_edge(sample) then latch <= shared_cnt; end if;
  end process;
  snapshot <= latch;
end architecture vhdl2008;

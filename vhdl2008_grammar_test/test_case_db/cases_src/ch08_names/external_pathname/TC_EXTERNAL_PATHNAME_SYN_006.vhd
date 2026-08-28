-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Test Focus: mixing the three path types in the same architecture — <<constant @lib.pk.C1 : int>> + <<signal .tb.dut.S1 : bit>> + <<variable ^.^.parent.V1 : int>> use all three external_pathname branches at the same time, verifying that each branch can coexist independently
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_path_all_three is
  port(clk : in bit; test_val : in integer; alert : out bit);
end entity;

architecture vhdl2008 of ext_path_all_three is
  alias C_PKG is <<constant @work.limits.MAX_COUNT : integer>>;
  alias S_ABS is <<signal .tb_top.u_dut.ready_flag : bit>>;
  alias V_REL is <<variable ^.parent_mon.txn_id : integer>>;
  signal combined : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if test_val > C_PKG and S_ABS = '1' then combined <= '1';
      else combined <= '0'; end if;
    end if;
  end process;
  alert <= combined;
end architecture vhdl2008;

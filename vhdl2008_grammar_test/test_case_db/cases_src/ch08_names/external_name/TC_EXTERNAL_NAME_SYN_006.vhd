-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Positive
-- Test Focus: mixing the three external_name branches in the same architecture — three external aliases, external_constant_name, external_signal_name, and external_variable_name, coexist, verifying that the three branches of external_name can coexist in the same scope and operate independently
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_name_all_three is
  port(clk : in bit; event_val : in natural; trigger : out bit);
end entity;

architecture vhdl2008 of ext_name_all_three is
  alias C_THRESH is <<constant @work.param_pkg.THRESH : natural>>;
  alias mon_sig is <<signal .tb_top.u_dut.enable : bit>>;
  alias mon_var is <<variable .tb_top.u_dut.txn_id : natural>>;
  signal combined : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if event_val > C_THRESH and mon_sig = '1' then
        combined <= '1';
      else
        combined <= '0';
      end if;
    end if;
  end process;
  trigger <= combined;
end architecture vhdl2008;

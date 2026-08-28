-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: Absolute pathname with extended identifiers — the pathname_element uses an extended identifier (\u_core\), verifying that the pathname_element of the partial_pathname following the '.' in absolute_pathname may be an extended identifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_extid_acc is
  port(mon_clk : in bit; status_out : out integer);
end entity;

architecture vhdl2008 of abs_path_extid_acc is
  alias extid_sig is <<signal .tb_top.\u_core\.status_reg : integer>>;
  signal local_reg : integer := 0;
begin
  process(mon_clk)
  begin
    if rising_edge(mon_clk) then
      local_reg <= extid_sig;
    end if;
  end process;
  status_out <= local_reg;
end architecture vhdl2008;

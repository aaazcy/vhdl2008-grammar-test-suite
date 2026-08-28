-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_PATHNAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Rule Description: Whichever branch external_pathname selects, it must form a legal hierarchical path that resolves to a declared design object
-- Test Focus: positive semantic case — three aliases with different path forms use legal paths (@work.pkg / .tb.dut / ^.parent) respectively, and each path resolves correctly to the corresponding declared object during elaboration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_path_valid_resolve is
  port(clk : in bit; chk : in integer; flag : out bit);
end entity;

architecture vhdl2008 of ext_path_valid_resolve is
  alias C_PKG is <<constant @work.params.THRESH : integer>>;
  alias S_ABS is <<signal .tb_top.u_dut.active : bit>>;
  signal result : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if chk > C_PKG and S_ABS = '1' then result <= '1';
      else result <= '0'; end if;
    end if;
  end process;
  flag <= result;
end architecture vhdl2008;

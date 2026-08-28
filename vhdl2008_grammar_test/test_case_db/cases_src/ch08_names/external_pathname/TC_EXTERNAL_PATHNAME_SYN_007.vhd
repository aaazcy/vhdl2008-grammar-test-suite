-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Test Focus: multi-level package path in package_pathname — in <<constant @lib.pkg_a.pkg_b.CONST : time>>, @lib.pkg_a.pkg_b.CONST uses a multi-level package dot-separated path, verifying that package_pathname supports nested package levels ({ package_simple_name . } object_simple_name)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_path_multipkg is
  port(clk : in bit; half_period_ns : out integer);
end entity;

architecture vhdl2008 of ext_path_multipkg is
  alias C_PERIOD is <<constant @work.tb_cfg.timing_params.CLK_PERIOD_NS : integer>>;
  signal half_val : integer := 0;
begin
  process(clk)
  begin
    if rising_edge(clk) then half_val <= C_PERIOD / 2; end if;
  end process;
  half_period_ns <= half_val;
end architecture vhdl2008;

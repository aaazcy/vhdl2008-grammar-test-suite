-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive (Production-Specific)
-- Test Focus: Absolute pathname form of external_pathname:
--   <<constant .tb_top.dut.width : natural>> exercises the absolute_pathname
--   alternative (dot-prefixed partial pathname) within an external constant name.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ext_path_abs_mon is
  port (
    cfg_match : out bit
  );
end entity ext_path_abs_mon;

architecture vhdl2008 of ext_path_abs_mon is
  -- Absolute pathname form: . partial_pathname (starting with a dot)
  constant C_DUT_WIDTH : natural :=
    <<constant .tb_top.dut_inst.DATA_WIDTH : natural>>;

  signal matched : bit := '0';
begin
  -- Report whether the DUT width is within expected range
  matched <= '1' when C_DUT_WIDTH >= 8 and C_DUT_WIDTH <= 64 else '0';
  cfg_match <= matched;
end architecture vhdl2008;

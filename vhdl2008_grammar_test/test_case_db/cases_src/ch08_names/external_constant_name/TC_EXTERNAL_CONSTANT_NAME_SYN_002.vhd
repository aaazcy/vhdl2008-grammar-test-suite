-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External constant name via package pathname: <<constant @lib.pkg.const_name : integer>>
--   Uses hierarchical reference to a library package constant as a verification monitor alias.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ext_const_pkg_monitor is
  port (
    clk          : in  bit;
    observed_val : in  integer;
    match_flag   : out bit
  );
end entity ext_const_pkg_monitor;

architecture vhdl2008 of ext_const_pkg_monitor is
  -- External constant name: reference a configuration constant from a library package
  alias cfg_max_val is
    <<constant @work.config_pkg.MAX_THRESHOLD : integer>>;

  signal threshold_exceeded : bit := '0';
begin
  -- Monitor process: compare observed value against externally-referenced constant
  p_monitor : process(clk)
  begin
    if clk'event and clk = '1' then
      if observed_val > cfg_max_val then
        threshold_exceeded <= '1';
      else
        threshold_exceeded <= '0';
      end if;
    end if;
  end process p_monitor;

  match_flag <= threshold_exceeded;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_generic_map_aspect ::=
--   generic_map_aspect | generic map ( <> ) | generic map ( default )
-- Case Type: Positive
-- Test Focus: Third alternative: generic map ( default ) —
--   all generic parameters take their declared default values.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

package pkg_counter is
  generic (
    MAX_VAL : positive := 255;
    INIT    : natural  := 0
  );
  function f_inc(val : natural) return natural;
end package pkg_counter;

package body pkg_counter is
  function f_inc(val : natural) return natural is
  begin
    if val >= MAX_VAL then return 0; else return val + 1; end if;
  end function f_inc;
end package body pkg_counter;

entity tc_ipgma_syn_003 is
  generic (
    package cnt_pkg is new work.pkg_counter generic map (default)
  );
  port (
    clk   : in  bit;
    count : out natural
  );
end entity tc_ipgma_syn_003;

architecture bh of tc_ipgma_syn_003 is
  signal s_cnt : natural := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_cnt <= cnt_pkg.f_inc(s_cnt);
    end if;
  end process;
  count <= s_cnt;
end architecture bh;

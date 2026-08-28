-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Test Focus: Package pathname form of external_pathname:
--   <<signal @lib.pkg.sig_name : bit>> exercises the package_pathname alternative
--   within an external signal name context.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ext_path_pkg_mon is
  port (
    clk        : in  bit;
    match_out  : out bit
  );
end entity ext_path_pkg_mon;

architecture vhdl2008 of ext_path_pkg_mon is
  -- Package pathname form: @library_name.package_name.object_name
  alias ext_status is
    <<signal @work.status_pkg.system_ready : bit>>;

  signal local_ready : bit := '0';
begin
  p_sync : process(clk)
  begin
    if clk'event and clk = '1' then
      local_ready <= ext_status;
    end if;
  end process p_sync;

  match_out <= local_ready;
end architecture vhdl2008;

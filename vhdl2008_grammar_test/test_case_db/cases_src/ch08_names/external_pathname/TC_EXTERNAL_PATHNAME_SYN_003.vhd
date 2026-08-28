-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Test Focus: Relative pathname form of external_pathname:
--   <<signal ^.parent_inst.data_valid : bit>> exercises the relative_pathname
--   alternative (^ dot-prefixed upward reference) within an external signal name.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ext_path_rel_mon is
  port (
    clk       : in  bit;
    valid_out : out bit
  );
end entity ext_path_rel_mon;

architecture vhdl2008 of ext_path_rel_mon is
  -- Relative pathname form: {^.} partial_pathname (upward reference with ^.)
  alias upstream_valid is
    <<signal ^.parent_inst.data_valid : bit>>;

  signal captured : bit := '0';
begin
  p_capture : process(clk)
  begin
    if clk'event and clk = '1' then
      captured <= upstream_valid;
    end if;
  end process p_capture;

  valid_out <= captured;
end architecture vhdl2008;

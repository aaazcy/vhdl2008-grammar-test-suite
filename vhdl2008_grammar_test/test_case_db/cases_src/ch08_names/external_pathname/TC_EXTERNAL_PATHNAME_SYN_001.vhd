-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Test Focus: the most minimal external_pathname selects the absolute_pathname branch — in <<constant .cfg.MAX : integer>>, .cfg.MAX is in absolute_pathname form, verifying the minimal syntax structure when external_pathname selects absolute_pathname
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_path_abs_min is
  port(val : in integer; exceeds : out bit);
end entity;

architecture vhdl2008 of ext_path_abs_min is
  alias C_MAX is <<constant .cfg_pkg.LIMIT : integer>>;
begin
  process(val)
  begin
    if val > C_MAX then exceeds <= '1';
    else exceeds <= '0'; end if;
  end process;
end architecture vhdl2008;

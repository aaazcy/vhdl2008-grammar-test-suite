-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_CONSTANT_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Rule Description: The subtype_indication declared in external_constant_name must be compatible with the type of the external constant actually referenced
-- Test Focus: positive semantic case — the external constant C_BUS_W references a natural type constant in a package, and the local natural variable compared with it is type-matched, verifying the correct semantic behavior of external_constant_name under type-compatible conditions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_const_sem_valid is
  port(data_width : in natural; width_ok : out bit);
end entity;

architecture vhdl2008 of ext_const_sem_valid is
  alias C_BUS_W is <<constant @work.config_pkg.BUS_WIDTH : natural>>;
begin
  process(data_width)
  begin
    if data_width = C_BUS_W then
      width_ok <= '1';
    else
      width_ok <= '0';
    end if;
  end process;
end architecture vhdl2008;

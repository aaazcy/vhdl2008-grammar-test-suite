-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External constant name with relative pathname: <<constant ^.^.parent_gen.BUS_WIDTH : natural>>
--   References a parent-level generic using upward relative path (^) notation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ext_const_rel_width is
  port (
    data_bus     : in  bit_vector(31 downto 0);
    width_ok     : out bit
  );
end entity ext_const_rel_width;

architecture vhdl2008 of ext_const_rel_width is
  -- External constant name using relative pathname with multiple ^. upward references
  alias C_BUS_W is
    <<constant ^.^.parent_gen.BUS_WIDTH : natural>>;

  -- Ensure the data bus width matches the externally-referenced configuration
  signal actual_width : natural := 32;
begin
  p_check : process(data_bus)
  begin
    if actual_width = C_BUS_W then
      width_ok <= '1';
    else
      width_ok <= '0';
    end if;
  end process p_check;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_SELECTED_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Positive
-- Test Focus: selected_name used as a type mark——work.my_pkg.my_type references a type declared in a package via selected_name as the subtype_indication, verifying that a selected_name can be used as a type_mark
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package config_pkg is
  constant C_DEFAULT : integer := 42;
end package config_pkg;

entity sel_name_type_ref is
  port(val_in : in integer; val_out : out integer);
end entity;

architecture vhdl2008 of sel_name_type_ref is
  alias C_DEF is <<constant @work.config_pkg.C_DEFAULT : integer>>;
  signal buf : integer := 0;
begin
  process(val_in)
  begin
    if val_in > C_DEF then buf <= C_DEF;
    else buf <= val_in; end if;
  end process;
  val_out <= buf;
end architecture vhdl2008;

-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Test Focus: package_pathname referencing a signal in a package — <<signal @work.globals.irq_line : bit>> uses an external signal name to access a global signal declared in the package through package_pathname, verifying that the object may be a signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_path_signal_obj is
  port(local_irq : in bit; combined : out bit);
end entity;

architecture vhdl2008 of pkg_path_signal_obj is
  alias glob_irq is <<signal @work.globals.irq_line : bit>>;
  signal result : bit := '0';
begin
  process(local_irq, glob_irq)
  begin
    result <= local_irq or glob_irq;
  end process;
  combined <= result;
end architecture vhdl2008;

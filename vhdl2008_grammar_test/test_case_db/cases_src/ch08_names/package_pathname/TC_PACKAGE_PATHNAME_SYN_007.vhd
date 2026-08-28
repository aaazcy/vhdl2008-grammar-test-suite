-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Test Focus: package_pathname references a variable inside a package——<<variable @work.shared_vars.txn_counter : natural>> accesses the shared variable in the package via package_pathname, verifying that the package path can reference a variable object
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_path_var_obj is
  port(sample : in bit; snapshot : out natural);
end entity;

architecture vhdl2008 of pkg_path_var_obj is
  alias glob_cnt is <<variable @work.shared_vars.txn_counter : natural>>;
  signal latch : natural := 0;
begin
  process(sample)
  begin
    if rising_edge(sample) then latch <= glob_cnt; end if;
  end process;
  snapshot <= latch;
end architecture vhdl2008;

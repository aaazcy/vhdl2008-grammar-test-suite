-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Test Focus: package_pathname with nested packages — '@work.outer_pkg.inner_pkg.shared_var' tests multiple { package_simple_name . } repetitions in the path
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_path_nested_ent is
  port(observed : in bit; status : out bit);
end entity;

architecture vhdl2008 of pkg_path_nested_ent is
  alias ext_flag is <<signal @work.status_pkg.sub_block.busy_flag : bit>>;
  signal status_reg : bit := '0';
begin
  process(observed)
  begin
    status_reg <= ext_flag;
  end process;
  status <= status_reg;
end architecture vhdl2008;

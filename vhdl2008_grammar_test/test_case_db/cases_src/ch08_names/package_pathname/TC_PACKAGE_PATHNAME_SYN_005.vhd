-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Test Focus: Multi-level package nesting in package_pathname — @work.pkg_a.pkg_b.pkg_c.VAL uses a three-level nested package path {pkg_a . pkg_b . pkg_c .}, verifying the maximum depth of the repeated { package_simple_name . } syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_path_deep_nest is
  port(input_val : in real; clipped : out real);
end entity;

architecture vhdl2008 of pkg_path_deep_nest is
  alias C_CLIP is <<constant @work.math_pkg.float_ops.limits.MAX_VAL : real>>;
  signal clip_val : real := 0.0;
begin
  process(input_val)
  begin
    if input_val > C_CLIP then clip_val <= C_CLIP;
    else clip_val <= input_val; end if;
  end process;
  clipped <= clip_val;
end architecture vhdl2008;

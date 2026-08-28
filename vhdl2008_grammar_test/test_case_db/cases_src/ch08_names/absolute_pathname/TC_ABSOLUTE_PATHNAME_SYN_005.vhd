-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: Absolute pathname used to access a constant — in the form <<constant .pkg_name.const_name : integer>>, an absolute_pathname starting with a dot anchors to the hierarchical path containing the constant declaration inside the package
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_const_acc is
  port(threshold : in integer; exceeded : out boolean);
end entity;

architecture vhdl2008 of abs_path_const_acc is
  alias max_val is <<constant .cfg_pkg.MAX_LIMIT : integer>>;
begin
  process(threshold)
  begin
    if threshold > max_val then
      exceeded <= true;
    else
      exceeded <= false;
    end if;
  end process;
end architecture vhdl2008;

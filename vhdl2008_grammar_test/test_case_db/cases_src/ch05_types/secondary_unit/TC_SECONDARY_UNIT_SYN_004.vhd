-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Positive
-- Test Focus: Positive: secondary_unit as a package_body implementing package declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: secondary_unit as a package_body implementing package declarations
entity sec_unit_syn_pkg_body is port(dout:out integer); end entity;
architecture rtl of sec_unit_syn_pkg_body is
  package pkg is
    constant C_VAL:integer:=42;
    function get_val return integer;
  end package;
  package body pkg is
    function get_val return integer is begin return C_VAL; end function;
  end package body;
  signal s:integer:=pkg.get_val;
begin dout<=s; end architecture;
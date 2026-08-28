-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Positive
-- Test Focus: Positive: package body with function implementation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: package body with function implementation
entity sec_unit_syn_func_body is port(dout:out integer); end entity;
architecture rtl of sec_unit_syn_func_body is
  package pkg is function add(a,b:integer) return integer; end package;
  package body pkg is function add(a,b:integer) return integer is begin return a+b; end function; end package body;
  signal s:integer:=pkg.add(10,20);
begin dout<=s; end architecture;
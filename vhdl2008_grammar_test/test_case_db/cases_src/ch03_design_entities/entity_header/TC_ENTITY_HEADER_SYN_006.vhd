-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Positive
-- Test Focus: entity_header with generic clause only using VHDL 2008 generic package interface—`generic(package pkg is new work.my_pkg generic map(<>))`, demonstrating that the formal_generic_clause can contain an interface_package_declaration, validating the full VHDL 2008 generic interface expansion within the optional generic clause position
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_base is
  generic(N:integer:=1);
  constant C_VAL : integer := 42;
end package pkg_base;

entity eh_gen_pkg is
  generic(
    package pkg_inst is new work.pkg_base generic map(<>)
  );
  port(
    result : out integer
  );
end entity eh_gen_pkg;

architecture bh of eh_gen_pkg is
begin
  result <= pkg_inst.C_VAL;
end architecture bh;

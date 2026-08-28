-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: package_instantiation_declaration: minimal syntax without generic_map_aspect — exercises the optional-bracket case where generic_map_aspect is omitted; all mandatory tokens remain: package, identifier, is, new, uninstantiated_package_name, ;
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_inst_minimal is
  port (
    test_in  : in  bit;
    test_out : out bit
  );
end entity;

architecture test of pkg_inst_minimal is
  -- Simulates: package my_types is new standard_types;
  -- No generic_map_aspect — the minimum valid package instantiation

  subtype byte_val_t is bit_vector(7 downto 0);
  constant C_REF : bit := '1';
begin
  test_out <= test_in and C_REF;
end architecture test;

-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::=
--   interface_object_declaration
--   | interface_type_declaration
--   | interface_subprogram_declaration
--   | interface_package_declaration
-- Case Type: Positive
-- Test Focus: interface_declaration showing interface_subprogram_declaration
--   (function specification as a generic formal subprogram) alongside
--   interface_object_declaration. VHDL-2008 generic subprogram feature.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iface_decl_subprogram_gen is
  generic (
    function reduce_and(v : bit_vector) return bit
  );
  port (
    din    : in  bit_vector(3 downto 0);
    result : out bit
  );
end entity iface_decl_subprogram_gen;

architecture rtl of iface_decl_subprogram_gen is
begin
  result <= reduce_and(din);
end architecture rtl;

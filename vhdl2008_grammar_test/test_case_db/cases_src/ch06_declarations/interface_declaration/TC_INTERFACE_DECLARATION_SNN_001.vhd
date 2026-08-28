-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::=
--   interface_object_declaration
--   | interface_type_declaration
--   | interface_subprogram_declaration
--   | interface_package_declaration
-- Case Type: Negative
-- Test Focus: SNN — missing semicolon separator between two
--   interface_declaration items in a generic clause.
--   The first interface_object_declaration is syntactically valid,
--   but the missing ";" before the second declaration breaks the parser.
-- Expected Result: Triggers syntax error (missing semicolon)
-- Dependencies: None
-- =============================================================
entity iface_decl_missing_semi_e is
  generic (
    -- ERROR: missing semicolon between these two interface declarations
    constant WIDTH : integer := 8
    constant DEPTH : integer := 4
  );
  port (
    addr : in  bit_vector(WIDTH - 1 downto 0);
    busy : out bit
  );
end entity iface_decl_missing_semi_e;

architecture err of iface_decl_missing_semi_e is
begin
  busy <= '0';
end architecture err;

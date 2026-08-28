-- =============================================================
-- Case ID: TC_SEM_INTERFACE_DECLARATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::=
--   interface_object_declaration
--   | interface_type_declaration
--   | interface_subprogram_declaration
--   | interface_package_declaration
-- Case Type: Negative (Semantic)
-- Test Focus: SEMANTIC ERROR — two interface_object_declarations
--   in the same generic clause share identifier "WIDTH" (duplicate).
--   Each declaration is individually syntactically valid, but
--   the duplicate identifier violates scope uniqueness rules.
-- Expected Result: Triggers semantic error (duplicate declaration)
-- Dependencies: None
-- =============================================================
entity iface_decl_duplicate_gen_e is
  generic (
    -- ERROR: duplicate identifier "WIDTH" used in two generic declarations
    constant WIDTH : integer := 8;
    constant WIDTH : integer := 16
  );
  port (
    busy : out bit
  );
end entity iface_decl_duplicate_gen_e;

architecture rtl of iface_decl_duplicate_gen_e is
begin
  busy <= '0';
end architecture rtl;
